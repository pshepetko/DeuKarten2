import 'package:drift/drift.dart';
import 'connection/connection.dart';

part 'drift_database.g.dart';

// Word Cards Table
@DataClassName('WordCardData')
class WordCards extends Table {
  TextColumn get id => text()();
  TextColumn get germanWord => text()();
  TextColumn get translation => text()();
  TextColumn get article => text()();
  TextColumn get pluralForm => text()();
  TextColumn get exampleSentence => text().nullable()();
  TextColumn get exampleTranslation => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get level => text()(); // Stored as string for DifficultyLevel enum
  TextColumn get type => text()(); // Stored as string for CardType enum
  TextColumn get tags => text()(); // Stored as JSON string
  TextColumn get deckId =>
      text().references(Decks, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get lastReviewed => dateTime().nullable()();
  DateTimeColumn get nextReview => dateTime().nullable()();
  IntColumn get intervalDays => integer().nullable()();
  IntColumn get repetitionCount =>
      integer().withDefault(const Constant(0))();
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();

  @override
  Set<Column> get primaryKey => {id};

 // @override
 // List<Set<Column>> get uniqueKeys => [{deckId}];
}

// Article Cards Table
@DataClassName('ArticleCardData')
class ArticleCards extends Table {
  TextColumn get id => text()();
  TextColumn get word => text()();
  TextColumn get correctArticle => text()();
  TextColumn get options => text()(); // Stored as JSON string
  TextColumn get translation => text()();
  TextColumn get exampleSentence => text()();
  TextColumn get level => text()();
  TextColumn get wordCardId =>
      text().references(WordCards, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}

// Sentence Cards Table
@DataClassName('SentenceCardData')
class SentenceCards extends Table {
  TextColumn get id => text()();
  TextColumn get incompleteSentence => text()();
  TextColumn get wordOptions => text()(); // Stored as JSON string
  TextColumn get correctAnswer => text()();
  TextColumn get completeSentence => text()();
  TextColumn get translation => text()();
  TextColumn get level => text()();
  TextColumn get grammarTopic => text()();
  TextColumn get deckId =>
      text().references(Decks, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}

// Decks Table
@DataClassName('DeckData')
class Decks extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  TextColumn get level => text()();
  TextColumn get cardIds => text()(); // Stored as JSON string
  IntColumn get totalCards => integer()();
  IntColumn get cardsLearned => integer().withDefault(const Constant(0))();
  RealColumn get progress => real().withDefault(const Constant(0.0))();
  TextColumn get thumbnailEmoji => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastStudied => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Learning Sessions Table
@DataClassName('LearningSessionData')
class LearningSessions extends Table {
  TextColumn get id => text()();
  TextColumn get deckId => text()();
  TextColumn get userId => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get cards => text()(); // Stored as JSON string of SessionCard
  IntColumn get cardsStudied => integer().withDefault(const Constant(0))();
  IntColumn get correctAnswers =>
      integer().withDefault(const Constant(0))();
  IntColumn get xpEarned => integer().withDefault(const Constant(0))();
  TextColumn get status => text()(); // Stored as string for SessionStatus enum

  @override
  Set<Column> get primaryKey => {id};
}

// User Profile Table
@DataClassName('UserProfileData')
class UserProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get avatarUrl => text().nullable()();
  DateTimeColumn get joinedDate => dateTime()();
  TextColumn get settings => text()(); // Stored as JSON string
  TextColumn get learningPrefs => text()(); // Stored as JSON string

  @override
  Set<Column> get primaryKey => {id};
}

// XP History Table
@DataClassName('XpHistoryEntryData')
class XpHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  IntColumn get amount => integer()();
  TextColumn get source => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get description => text().nullable()();
}

// Streak Data Table
@DataClassName('StreakDataData')
class StreakData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  IntColumn get currentStreak => integer()();
  IntColumn get longestStreak => integer()();
  DateTimeColumn get lastStudyDate => dateTime()();
  BoolColumn get studiedToday => boolean()();
  TextColumn get studyDates => text()(); // Stored as JSON string
  TextColumn get lastMilestone =>
      text().nullable()(); // Stored as string for StreakMilestone enum
}

// Tests Table
@DataClassName('TestData')
class Tests extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get questions => text()(); // Stored as JSON string
  IntColumn get duration => integer()();
  TextColumn get category => text()();
  IntColumn get minPassingScore => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Test Sessions Table
@DataClassName('TestSessionData')
class TestSessions extends Table {
  TextColumn get id => text()();
  TextColumn get testId => text()();
  TextColumn get userId => text()();
  TextColumn get userAnswers => text()(); // Stored as JSON string
  IntColumn get currentQuestionIndex => integer()();
  DateTimeColumn get startTime => dateTime().nullable()();
  IntColumn get timeLeft => integer().nullable()();
  IntColumn get timeElapsed => integer().nullable()();
  BoolColumn get isComplete =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get score => integer().nullable()();
  BoolColumn get isPassed => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Statistics Table
@DataClassName('StatisticsData')
class Statistics extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get cardsLearned => integer().withDefault(const Constant(0))();
  IntColumn get cardsReviewed => integer().withDefault(const Constant(0))();
  IntColumn get testsTaken => integer().withDefault(const Constant(0))();
  RealColumn get averageScore => real().withDefault(const Constant(0.0))();
  IntColumn get studyTimeMinutes =>
      integer().withDefault(const Constant(0))();
  IntColumn get xpEarned => integer().withDefault(const Constant(0))();
  IntColumn get retentionCards =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

// Main Database Class
@DriftDatabase(
  tables: [
    WordCards,
    ArticleCards,
    SentenceCards,
    Decks,
    LearningSessions,
    UserProfiles,
    XpHistory,
    StreakData,
    Tests,
    TestSessions,
    Statistics,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Add userId column to user-specific tables with safe default for existing rows
          await customStatement("ALTER TABLE learning_sessions ADD COLUMN user_id TEXT NOT NULL DEFAULT 'local_user';");
          await customStatement("ALTER TABLE user_profiles ADD COLUMN user_id TEXT NOT NULL DEFAULT 'local_user';");
          await customStatement("ALTER TABLE xp_history ADD COLUMN user_id TEXT NOT NULL DEFAULT 'local_user';");
          await customStatement("ALTER TABLE streak_data ADD COLUMN user_id TEXT NOT NULL DEFAULT 'local_user';");
          await customStatement("ALTER TABLE test_sessions ADD COLUMN user_id TEXT NOT NULL DEFAULT 'local_user';");
          await customStatement("ALTER TABLE statistics ADD COLUMN user_id TEXT NOT NULL DEFAULT 'local_user';");
        }
      },
    );
  }

  // Database initialization
  static AppDatabase? _instance;

  static AppDatabase get instance {
    if (_instance != null) return _instance!;
    throw Exception('Database not initialized. Call initialize() first.');
  }

  static Future<void> initialize() async {
    if (_instance != null) return;

    // Obtain a platform-specific QueryExecutor from the connection layer.
    final executor = await openConnection();

    _instance = AppDatabase(executor);

    // Force actual open / creation
    await _instance!.customSelect('SELECT 1').get();

    print('DB INITIALIZED');
  }

  // Word Cards
  Future<List<WordCardData>> getAllWordCards() {
    return select(wordCards).get();
  }

  Future<WordCardData?> getWordCardById(String id) {
    final query = select(wordCards)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<List<WordCardData>> getWordCardsByLevel(String level) {
    final query = select(wordCards)..where((tbl) => tbl.level.equals(level));
    return query.get();
  }

  // Article Cards
  Future<List<ArticleCardData>> getAllArticleCards() {
    return select(articleCards).get();
  }

  Future<ArticleCardData?> getArticleCardById(String id) {
    final query = select(articleCards)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

  // Sentence Cards
  Future<List<SentenceCardData>> getAllSentenceCards() {
    return select(sentenceCards).get();
  }

  Future<SentenceCardData?> getSentenceCardById(String id) {
    final query = select(sentenceCards)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

  // Decks
  Future<List<DeckData>> getAllDecks() {
    return select(decks).get();
  }

  Future<DeckData?> getDeckById(String id) {
    final query = select(decks)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<List<DeckData>> getDecksByLevel(String level) {
    final query = select(decks)..where((tbl) => tbl.level.equals(level));
    return query.get();
  }

  Future<List<DeckData>> getRecentDecks({int limit = 5}) {
    final query = select(decks)
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.lastStudied)])
      ..limit(limit);

    return query.get();
  }

  // Learning Sessions
  Future<LearningSessionData?> getCurrentSession() async {
    final query = select(learningSessions)
      ..where((tbl) => tbl.status.equals('inProgress'))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)])
      ..limit(1);

    final sessions = await query.get();
    return sessions.isEmpty ? null : sessions.first;
  }

  Future<List<LearningSessionData>> getSessionHistory() {
    final query = select(learningSessions)
      ..where((tbl) => tbl.status.equals('completed'))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.completedAt)]);

    return query.get();
  }

  // Statistics
  Future<List<StatisticsData>> getStatisticsByDateRange(
      DateTime start,
      DateTime end,
      ) {
    final query = select(statistics)
      ..where((tbl) =>
      tbl.date.isBiggerOrEqualValue(start) &
      tbl.date.isSmallerOrEqualValue(end))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.date)]);

    return query.get();
  }

  // Test Sessions
  Future<List<TestSessionData>> getTestHistory() {
    final query = select(testSessions)
      ..where((tbl) => tbl.isComplete.equals(true))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.completedAt)]);

    return query.get();
  }

  // Deck-related card queries
  Future<List<WordCardData>> getWordCardsByDeck(String deckId) {
    final query = select(wordCards)..where((tbl) => tbl.deckId.equals(deckId));
    return query.get();
  }

  Stream<List<WordCardData>> watchWordCardsByDeck(String deckId) {
    final query = select(wordCards)..where((tbl) => tbl.deckId.equals(deckId));
    return query.watch();
  }

  Future<List<SentenceCardData>> getSentenceCardsByDeck(String deckId) {
    final query =
    select(sentenceCards)..where((tbl) => tbl.deckId.equals(deckId));
    return query.get();
  }

  Stream<List<SentenceCardData>> watchSentenceCardsByDeck(String deckId) {
    final query =
    select(sentenceCards)..where((tbl) => tbl.deckId.equals(deckId));
    return query.watch();
  }

  Future<List<ArticleCardData>> getArticleCardsByWordCard(String wordCardId) {
    final query = select(articleCards)
      ..where((tbl) => tbl.wordCardId.equals(wordCardId));
    return query.get();
  }

  /// Оновити прогрес слова після відповіді
  Future<void> updateWordCardProgress({
    required String cardId,
    required bool wasCorrect,
  }) async {
    final card = await getWordCardById(cardId);
    if (card == null) return;

    final now = DateTime.now();
    final newRepCount = card.repetitionCount + 1;

    // Простий алгоритм інтервалів
    int newInterval;
    double newEaseFactor = card.easeFactor;

    if (wasCorrect) {
      // Wusste → збільшуємо інтервал
      if (card.repetitionCount == 0) {
        newInterval = 1;
      } else if (card.repetitionCount == 1) {
        newInterval = 3;
      } else {
        newInterval = ((card.intervalDays ?? 1) * card.easeFactor).round();
      }
      newEaseFactor = (card.easeFactor + 0.1).clamp(1.3, 3.0);
    } else {
      // Wusste nicht → скидаємо інтервал
      newInterval = 1;
      newEaseFactor = (card.easeFactor - 0.3).clamp(1.3, 3.0);
    }

    await (update(wordCards)..where((t) => t.id.equals(cardId))).write(
      WordCardsCompanion(
        lastReviewed: Value(now),
        nextReview: Value(now.add(Duration(days: newInterval))),
        intervalDays: Value(newInterval),
        repetitionCount: Value(newRepCount),
        easeFactor: Value(newEaseFactor),
      ),
    );
  }

  /// Отримати слова які потребують повторення
  Future<List<WordCardData>> getDueWordCards() async {
    final now = DateTime.now();
    final query = select(wordCards)
      ..where((t) =>
      t.nextReview.isNull() | t.nextReview.isSmallerOrEqualValue(now));
    return query.get();
  }
  Future<List<WordCardData>> getDueWordCardsByDeck(String deckId) async {
    final now = DateTime.now();
    final query = select(wordCards)
      ..where((t) =>
      t.deckId.equals(deckId) &
      (t.nextReview.isNull() | t.nextReview.isSmallerOrEqualValue(now)));
    return query.get();
  }
  /// Отримати слова які користувач знає (repetitionCount >= 3)
  Future<List<WordCardData>> getKnownWordCards() async {
    final query = select(wordCards)
      ..where((t) => t.repetitionCount.isBiggerOrEqualValue(3));
    return query.get();
  }

  /// Отримати слова які користувач НЕ знає (нові або з малим repetitionCount)
  Future<List<WordCardData>> getUnknownWordCards() async {
    final query = select(wordCards)
      ..where((t) => t.repetitionCount.isSmallerThanValue(3));
    return query.get();
  }

  /// Отримати статистику вивчення
  Future<Map<String, int>> getWordCardStats() async {
    final all = await getAllWordCards();
    int known = 0;
    int learning = 0;
    int newCards = 0;

    for (final card in all) {
      if (card.repetitionCount >= 3) {
        known++;
      } else if (card.repetitionCount > 0) {
        learning++;
      } else {
        newCards++;
      }
    }

    return {
      'total': all.length,
      'known': known,
      'learning': learning,
      'new': newCards,
    };
  }
// В клас AppDatabase додайте:

  /// Записати XP
  Future<void> addXpEntry({
    required int amount,
    required String source,
    String? description,
  }) async {
    await into(xpHistory).insert(XpHistoryCompanion.insert(
      userId: 'local_user',
      amount: amount,
      source: source,
      timestamp: DateTime.now(),
      description: Value(description),
    ));
  }

  /// Отримати XP за сьогодні — надійна версія
  Future<int> getTodayXp() async {
    try {
      // Дебаг — подивимось що реально в таблиці
      final allEntries = await customSelect(
        'SELECT * FROM xp_history ORDER BY timestamp DESC LIMIT 5',
      ).get();
      for (final entry in allEntries) {
       // print('  - amount: ${entry.read<int>('amount')}, ts: ${entry.read<int>('timestamp')}, user: ${entry.read<String>('user_id')}');
      }

      // Drift зберігає DateTime як секунди Unix epoch
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final todayStartEpoch = todayStart.millisecondsSinceEpoch ~/ 1000;

      final result = await customSelect(
        'SELECT COALESCE(SUM(amount), 0) as total FROM xp_history WHERE timestamp >= ? AND user_id = ?',
        variables: [
          Variable.withInt(todayStartEpoch),
          Variable.withString('local_user'),
        ],
      ).getSingle();

      final total = result.read<int>('total');
      return total;
    } catch (e, st) {
      print('❌ getTodayXp error: $e');
      print(st);
      return 0;
    }
  }

  /// Оновити streak
  Future<Map<String, int>> updateStreak() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    // Шукаємо існуючий streak запис
    final existing = await (select(streakData)
      ..where((t) => t.userId.equals('local_user'))
      ..limit(1))
        .getSingleOrNull();

    if (existing == null) {
      // Перший раз — створюємо
      await into(streakData).insert(StreakDataCompanion.insert(
        userId: 'local_user',
        currentStreak: 1,
        longestStreak: 1,
        lastStudyDate: today,
        studiedToday: true,
        studyDates: '["${today.toIso8601String()}"]',
      ));
      return {'current': 1, 'longest': 1};
    }

    final lastDate = DateTime(
      existing.lastStudyDate.year,
      existing.lastStudyDate.month,
      existing.lastStudyDate.day,
    );

    if (lastDate == today) {
      // Вже вчились сьогодні — нічого не змінюємо
      return {
        'current': existing.currentStreak,
        'longest': existing.longestStreak,
      };
    }

    int newStreak;
    if (lastDate == yesterday) {
      // Вчились вчора — продовжуємо streak
      newStreak = existing.currentStreak + 1;
    } else {
      // Пропустили день — скидаємо
      newStreak = 1;
    }

    final newLongest =
    newStreak > existing.longestStreak ? newStreak : existing.longestStreak;

    await (update(streakData)
      ..where((t) => t.id.equals(existing.id)))
        .write(StreakDataCompanion(
      currentStreak: Value(newStreak),
      longestStreak: Value(newLongest),
      lastStudyDate: Value(today),
      studiedToday: const Value(true),
    ));

    return {'current': newStreak, 'longest': newLongest};
  }

  /// Отримати поточний streak
  Future<int> getCurrentStreak() async {
    final existing = await (select(streakData)
      ..where((t) => t.userId.equals('local_user'))
      ..limit(1))
        .getSingleOrNull();

    if (existing == null) return 0;

    // Перевіряємо чи streak актуальний
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final lastDate = DateTime(
      existing.lastStudyDate.year,
      existing.lastStudyDate.month,
      existing.lastStudyDate.day,
    );

    if (lastDate == today || lastDate == yesterday) {
      return existing.currentStreak;
    }

    // Streak вже зламаний
    return 0;
  }

  /// Записати денну статистику
  Future<void> updateTodayStatistics({
    int cardsLearned = 0,
    int cardsReviewed = 0,
    int xpEarned = 0,
  }) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final todayId = '${now.year}-${now.month}-${now.day}_local_user';

    final existing = await (select(statistics)
      ..where((t) => t.id.equals(todayId)))
        .getSingleOrNull();

    if (existing == null) {
      await into(statistics).insert(StatisticsCompanion.insert(
        id: todayId,
        userId: 'local_user',
        date: today,
        cardsLearned: Value(cardsLearned),
        cardsReviewed: Value(cardsReviewed),
        xpEarned: Value(xpEarned),
      ));
    } else {
      await (update(statistics)..where((t) => t.id.equals(todayId))).write(
        StatisticsCompanion(
          cardsLearned: Value(existing.cardsLearned + cardsLearned),
          cardsReviewed: Value(existing.cardsReviewed + cardsReviewed),
          xpEarned: Value(existing.xpEarned + xpEarned),
        ),
      );
    }
  }
}