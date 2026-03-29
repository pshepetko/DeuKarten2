import 'package:deu_karten/core/database/converters.dart';
import 'package:deu_karten/core/database/drift_database.dart';
import 'package:deu_karten/features/cards/models/word_card.dart';
import 'package:deu_karten/features/cards/models/article_card.dart';
import 'package:deu_karten/features/cards/models/sentence_card.dart';
import 'package:deu_karten/features/cards/models/enums.dart';
import 'cards_repository.dart';

class CardsRepositoryDrift implements CardsRepository {
  final AppDatabase _db;

  CardsRepositoryDrift(this._db);

  @override
  Future<List<WordCard>> getWordCards() async {
    final data = await _db.getAllWordCards();
    return data.map(wordCardFromData).toList();
  }

  @override
  Future<WordCard?> getWordCardById(String id) async {
    final data = await _db.getWordCardById(id);
    return data != null ? wordCardFromData(data) : null;
  }

  @override
  Future<List<WordCard>> getWordCardsByLevel(DifficultyLevel level) async {
    final data = await _db.getWordCardsByLevel(difficultyLevelToString(level));
    return data.map(wordCardFromData).toList();
  }

  @override
  Future<List<WordCard>> getWordCardsByTag(String tag) async {
    // Get all cards and filter by tag (Drift doesn't have JSON array search)
    final data = await _db.getAllWordCards();
    return data
        .map(wordCardFromData)
        .where((card) => card.tags.contains(tag))
        .toList();
  }

  @override
  Future<List<WordCard>> getWordCardsByDeck(String deckId) async {
    final data = await _db.getWordCardsByDeck(deckId);
    return data.map(wordCardFromData).toList();
  }

  @override
  Future<List<ArticleCard>> getArticleCards() async {
    final data = await _db.getAllArticleCards();
    return data.map(articleCardFromData).toList();
  }

  @override
  Future<ArticleCard?> getArticleCardById(String id) async {
    final data = await _db.getArticleCardById(id);
    return data != null ? articleCardFromData(data) : null;
  }

  @override
  Future<List<SentenceCard>> getSentenceCards() async {
    final data = await _db.getAllSentenceCards();
    return data.map(sentenceCardFromData).toList();
  }

  @override
  Future<SentenceCard?> getSentenceCardById(String id) async {
    final data = await _db.getSentenceCardById(id);
    return data != null ? sentenceCardFromData(data) : null;
  }

  @override
  Future<List<dynamic>> getCardsForSession(
      String deckId, {
        int? limit,
        List<String>? dueCardIds,
      }) async {
    List<WordCard> wordCards = [];
    List<ArticleCard> articleCards = [];
    List<SentenceCard> sentenceCards = [];

    final isAll = deckId == 'all' || deckId.isEmpty;

    if (isAll) {
      wordCards = await getWordCards();
      articleCards = await getArticleCards();
      sentenceCards = await getSentenceCards();
    } else {
      // Load cards filtered by deckId from the database
      final wordData = await _db.getWordCardsByDeck(deckId);
      wordCards = wordData.map(wordCardFromData).toList();

      final sentenceData = await _db.getSentenceCardsByDeck(deckId);
      sentenceCards = sentenceData.map(sentenceCardFromData).toList();

      // Load article cards related to the word cards in this deck
      final articles = <ArticleCard>[];
      for (final w in wordCards) {
        final articleData = await _db.getArticleCardsByWordCard(w.id);
        articles.addAll(articleData.map(articleCardFromData));
      }
      articleCards = articles;
    }

    List<dynamic> allCards = <dynamic>[
      ...wordCards,
      ...articleCards,
      ...sentenceCards,
    ];

    if (dueCardIds != null && dueCardIds.isNotEmpty) {
      final dueSet = dueCardIds.toSet();
      final dueCards = allCards.where((c) => dueSet.contains(c.id.toString())).toList();
      if (dueCards.isNotEmpty) {
        allCards = dueCards;
      }
    }

    if (limit != null && limit > 0) {
      return allCards.take(limit).toList();
    }

    return allCards;
  }

  @override
  Future<void> updateCardProgress(String cardId, bool wasCorrect) async {
    // Update word card if exists
    final wordCardData = await _db.getWordCardById(cardId);
    if (wordCardData != null) {
      final card = wordCardFromData(wordCardData);
      await _db.update(_db.wordCards).replace(
        wordCardToData(
          card.copyWith(
            repetitionCount: card.repetitionCount + 1,
            lastReviewed: DateTime.now(),
          ),
        ),
      );
      return;
    }

    // Note: Article and Sentence cards don't have repetition tracking in the current model
    // This would be extended in a real implementation
  }

  Future<void> updateWordProgress(String cardId, bool wasCorrect) async {
    await _db.updateWordCardProgress(cardId: cardId, wasCorrect: wasCorrect);
  }

  Future<List<WordCard>> getDueWordCards() async {
    final data = await _db.getDueWordCards();
    return data.map(wordCardFromData).toList();
  }

  Future<Map<String, int>> getWordCardStats() async {
    return _db.getWordCardStats();
  }
  Future<List<WordCard>> getReadyCards(String deckId, int limit) async {
    List<WordCardData> data;

    if (deckId == 'all' || deckId.isEmpty) {
      data = await _db.getDueWordCards();
    } else {
      data = await _db.getDueWordCardsByDeck(deckId);
    }

    final cards = data.map(wordCardFromData).toList();

    if (cards.length > limit) {
      return cards.sublist(0, limit);
    }
    return cards;
  }

  Future<int> getReadyCardsCount(String deckId) async {
    List<WordCardData> data;

    if (deckId == 'all' || deckId.isEmpty) {
      data = await _db.getDueWordCards();
    } else {
      data = await _db.getDueWordCardsByDeck(deckId);
    }

    return data.length;
  }

}