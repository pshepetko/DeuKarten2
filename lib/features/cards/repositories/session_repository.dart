import 'package:deu_karten/core/database/drift_database.dart';
import 'package:drift/drift.dart';
import 'dart:convert';
import '../models/learning_session.dart';
import '../models/enums.dart';

abstract class SessionRepository {
  Future<LearningSession> createSession(String deckId);
  Future<LearningSession?> getCurrentSession();
  Future<void> saveSessionProgress(LearningSession session);
  Future<void> completeSession(String sessionId);
  Future<List<LearningSession>> getSessionHistory();
}

class SessionRepositoryImpl implements SessionRepository {
  final AppDatabase _db = AppDatabase.instance;

  // Конвертувати SessionCard → JSON string
  String _cardsToJson(List<SessionCard> cards) {
    return jsonEncode(cards.map((c) => {
      'cardId': c.cardId,
      'type': c.type.name,
      'wasCorrect': c.wasCorrect,
      'answeredAt': c.answeredAt?.toIso8601String(),
    }).toList());
  }

  // Конвертувати JSON string → List<SessionCard>
  List<SessionCard> _cardsFromJson(String json) {
    try {
      final list = jsonDecode(json) as List;
      return list.map((item) => SessionCard(
        cardId: item['cardId'] as String,
        type: parseCardType(item['type'] ?? 'noun'),
        wasCorrect: item['wasCorrect'] as bool?,
        answeredAt: item['answeredAt'] != null
            ? DateTime.parse(item['answeredAt'] as String)
            : null,
      )).toList();
    } catch (_) {
      return [];
    }
  }

  // Конвертувати LearningSessionData (Drift) → LearningSession (model)
  LearningSession _fromData(LearningSessionData data) {
    final cards = _cardsFromJson(data.cards);
    return LearningSession(
      id: data.id,
      deckId: data.deckId,
      startedAt: data.startedAt,
      completedAt: data.completedAt,
      cards: cards,
      cardsStudied: data.cardsStudied,
      correctAnswers: data.correctAnswers,
      xpEarned: data.xpEarned,
      status: data.status == 'completed'
          ? SessionStatus.completed
          : SessionStatus.inProgress,
    );
  }

  @override
  Future<LearningSession> createSession(String deckId) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final now = DateTime.now();

    await _db.into(_db.learningSessions).insert(
      LearningSessionsCompanion.insert(
        id: id,
        deckId: deckId,
        userId: 'local_user',
        startedAt: now,
        cards: '[]',
        status: 'inProgress',
      ),
    );

    print('✅ Session created in DB: $id');

    return LearningSession(
      id: id,
      deckId: deckId,
      startedAt: now,
      cards: <SessionCard>[],
      status: SessionStatus.inProgress,
    );
  }

  @override
  Future<LearningSession?> getCurrentSession() async {
    final data = await _db.getCurrentSession();
    if (data == null) return null;
    return _fromData(data);
  }

  @override
  Future<void> saveSessionProgress(LearningSession session) async {
    await (_db.update(_db.learningSessions)
      ..where((t) => t.id.equals(session.id)))
        .write(LearningSessionsCompanion(
      cards: Value(_cardsToJson(session.cards)),
      cardsStudied: Value(session.cardsStudied ?? 0),
      correctAnswers: Value(session.correctAnswers ?? 0),
      xpEarned: Value(session.xpEarned ?? 0),
    ));

    print('✅ Session progress saved: ${session.cardsStudied} studied, '
        '${session.correctAnswers} correct, ${session.xpEarned} XP');
  }

  @override
  Future<void> completeSession(String sessionId) async {
    await (_db.update(_db.learningSessions)
      ..where((t) => t.id.equals(sessionId)))
        .write(LearningSessionsCompanion(
      status: const Value('completed'),
      completedAt: Value(DateTime.now()),
    ));

    print('✅ Session completed in DB: $sessionId');
  }

  @override
  Future<List<LearningSession>> getSessionHistory() async {
    final data = await _db.getSessionHistory();
    return data.map(_fromData).toList();
  }
}