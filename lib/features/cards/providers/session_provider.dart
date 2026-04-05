import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/learning_session.dart';
import '../models/enums.dart';
import '../repositories/cards_repository_drift.dart' as drift_providers;
import '../../spaced_repetition/spaced_repetition_provider.dart';
import 'cards_providers.dart';
import 'cards_providers_drift.dart' as drift_providers;
import '../../profile/providers/providers.dart';
import '../../profile/providers/profile_provider.dart';
import '../../../core/database/drift_database.dart' as drift_db;

part 'session_provider.g.dart';

@riverpod
class CurrentSession extends _$CurrentSession {
  @override
  Future<LearningSession?> build() async {
    return null;
  }

  Future<void> startSession(String deckId) async {
    ref.read(currentCardIndexProvider.notifier).state = 0;
    state = const AsyncLoading();

    final repo = ref.read(sessionRepositoryProvider);
    final profileRepo = ref.read(profileRepositoryProvider);
    final profile = await profileRepo.getUserProfile();
    final dailyGoal = profile?.learningPrefs.dailyGoal ?? 20;

    late final cardsRepo;
    try {
      cardsRepo = await ref.read(
        drift_providers.cardsRepositoryDriftProvider.future,
      );
    } catch (_) {
      cardsRepo = ref.read(cardsRepositoryProvider);
    }

    // Отримуємо всі word cards
    List wordCards;
    if (deckId == 'all' || deckId.isEmpty) {
      wordCards = await cardsRepo.getWordCards();
    } else {
      wordCards = await cardsRepo.getWordCardsByDeck(deckId);
    }

    // ✅ Фільтруємо: тільки due + new
    final now = DateTime.now();
    final readyCards = wordCards.where((card) {
      return card.repetitionCount == 0 ||
          card.nextReview == null ||
          card.nextReview!.isBefore(now);
    }).take(dailyGoal).toList();

    if (readyCards.isEmpty) {
      state = const AsyncData(null);
      return;
    }

    final List<SessionCard> sessionCards = readyCards.map<SessionCard>((card) {
      return SessionCard(
        cardId: card.id.toString(),
        type: _getCardType(card),
        status: CardStatus.new_card,
      );
    }).toList();

    final session = await repo.createSession(deckId);
    final sessionWithCards = session.copyWith(cards: sessionCards);

    await repo.saveSessionProgress(sessionWithCards);
    ref.invalidate(currentCardDataProvider);
    state = AsyncData(sessionWithCards);
  }

  void answerCard(String cardId, bool knewIt) {
    state.whenData((session) {
      if (session == null) return;

      // Prevent double-counting if the card was already answered
      final alreadyAnswered = session.cards.any((c) => c.cardId == cardId && c.wasCorrect != null);
      if (alreadyAnswered) return;

      final updatedCards = session.cards.map((card) {
        if (card.cardId == cardId) {
          return card.copyWith(
            wasCorrect: knewIt,
            answeredAt: DateTime.now(),
          );
        }
        return card;
      }).toList();

      final cardsStudied = (session.cardsStudied ?? 0) + 1;
      final correctAnswers =
        knewIt ? (session.correctAnswers ?? 0) + 1 : (session.correctAnswers ?? 0);
      final xpEarned = correctAnswers * 10;

      final updatedSession = session.copyWith(
        cards: updatedCards,
        cardsStudied: cardsStudied,
        correctAnswers: correctAnswers,
        xpEarned: xpEarned,
      );

      ref.read(sessionRepositoryProvider).saveSessionProgress(updatedSession);
      state = AsyncData(updatedSession);

      // ✅ Оновлюємо прогрес слова в таблиці WordCards
      _updateWordProgress(cardId, knewIt);
    });
  }

  /// Оновлює lastReviewed, repetitionCount, easeFactor, nextReview в БД
  Future<void> _updateWordProgress(String cardId, bool wasCorrect) async {
    try {
      final db = await ref.read(
        drift_providers.cardsRepositoryDriftProvider.future,
      );
      if (db is drift_providers.CardsRepositoryDrift) {
        await db.updateWordProgress(cardId, wasCorrect);
        print('✅ Прогрес: $cardId → ${wasCorrect ? "Wusste" : "Wusste nicht"}');
      }
    } catch (e) {
      print('⚠️ Не вдалось оновити прогрес: $e');
    }
  }

  Future<void> completeSession() async {
    final session = state.value;
    if (session == null) return;

    final repo = ref.read(sessionRepositoryProvider);
    await repo.completeSession(session.id);

    final srNotifier = ref.read(spacedRepetitionNotifierProvider.notifier);
    final reviews = <String, bool>{};
    for (final card in session.cards) {
      if (card.wasCorrect != null) {
        reviews[card.cardId] = card.wasCorrect!;
      }
    }
    if (reviews.isNotEmpty) {
      await srNotifier.recordBatchReviews(reviews);
    }

    // ✅ Записуємо XP, Streak, Statistics
    try {
      final appDb = drift_db.AppDatabase.instance;
      final xp = session.xpEarned ?? 0;
      final studied = session.cardsStudied ?? 0;
      final correct = session.correctAnswers ?? 0;

      if (xp > 0) {
        await appDb.addXpEntry(
          amount: xp,
          source: 'session',
          description: '$correct/$studied richtig',
        );
      }

      await appDb.updateStreak();

      await appDb.updateTodayStatistics(
        cardsLearned: correct,
        cardsReviewed: studied,
        xpEarned: xp,
      );

      print('✅ Session stats: XP +$xp, Studied $studied, Correct $correct');
    } catch (e) {
      print('⚠️ Stats error: $e');
    }

    ref.read(currentCardIndexProvider.notifier).state = 0;
    state = const AsyncData(null);
  }

  void resetSession() {
    ref.read(currentCardIndexProvider.notifier).state = 0;
    state = const AsyncData(null);
    ref.invalidate(currentCardDataProvider);
  }

  CardType _getCardType(dynamic card) {
    if (card.runtimeType.toString().contains('WordCard')) {
      return CardType.noun;
    } else if (card.runtimeType.toString().contains('ArticleCard')) {
      return CardType.article;
    } else if (card.runtimeType.toString().contains('SentenceCard')) {
      return CardType.sentence;
    }
    return CardType.noun;
  }
}

final currentCardIndexProvider = StateProvider<int>((ref) => 0);

final currentCardDataProvider =
FutureProvider.family<CardData?, String>((ref, cardId) async {
  dynamic cardsRepo;
  try {
    cardsRepo = await ref.read(
      drift_providers.cardsRepositoryDriftProvider.future,
    );
  } catch (_) {
    cardsRepo = ref.read(cardsRepositoryProvider);
  }

  final wordCard = await cardsRepo.getWordCardById(cardId);
  if (wordCard != null) {
    return CardData(
      id: wordCard.id,
      type: wordCard.type,
      germanWord: wordCard.germanWord,
      translation: wordCard.translation,
      article: wordCard.article,
      pluralForm: wordCard.pluralForm,
      exampleSentence: wordCard.exampleSentence,
      exampleTranslation: wordCard.exampleTranslation,
      imageUrl: wordCard.imageUrl,
    );
  }

  final articleCard = await cardsRepo.getArticleCardById(cardId);
  if (articleCard != null) {
    return CardData(
      id: articleCard.id,
      type: CardType.article,
      germanWord: articleCard.word,
      translation: articleCard.translation,
      article: articleCard.correctArticle,
      exampleSentence: articleCard.exampleSentence,
      articleOptions: articleCard.options,
    );
  }

  final sentenceCard = await cardsRepo.getSentenceCardById(cardId);
  if (sentenceCard != null) {
    return CardData(
      id: sentenceCard.id,
      type: CardType.sentence,
      incompleteSentence: sentenceCard.incompleteSentence,
      completeSentence: sentenceCard.completeSentence,
      translation: sentenceCard.translation,
      wordOptions: sentenceCard.wordOptions,
      grammarTopic: sentenceCard.grammarTopic,
    );
  }

  return null;
});

class CardData {
  final String id;
  final CardType type;
  final String? germanWord;
  final String translation;
  final String? article;
  final String? pluralForm;
  final String? exampleSentence;
  final String? exampleTranslation;
  final String? imageUrl;
  final String? incompleteSentence;
  final String? completeSentence;
  final List<String>? wordOptions;
  final List<String>? articleOptions;
  final String? grammarTopic;

  CardData({
    required this.id,
    required this.type,
    this.germanWord,
    required this.translation,
    this.article,
    this.pluralForm,
    this.exampleSentence,
    this.exampleTranslation,
    this.imageUrl,
    this.incompleteSentence,
    this.completeSentence,
    this.wordOptions,
    this.articleOptions,
    this.grammarTopic,
  });
}