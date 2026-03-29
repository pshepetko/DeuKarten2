// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'fb7a2fa5ed8847b74bee5037fd58e326e0f3d289';

/// See also [database].
@ProviderFor(database)
final databaseProvider = FutureProvider<AppDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseRef = FutureProviderRef<AppDatabase>;
String _$dbHash() => r'7c1afc23cb141e2a7c8323b133cae3b558b36dbb';

/// See also [db].
@ProviderFor(db)
final dbProvider = Provider<AppDatabase>.internal(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DbRef = ProviderRef<AppDatabase>;
String _$allWordCardsHash() => r'568983a5df6054c2d90c629a8eea3206ebd991b6';

/// See also [allWordCards].
@ProviderFor(allWordCards)
final allWordCardsProvider = FutureProvider<List<WordCardData>>.internal(
  allWordCards,
  name: r'allWordCardsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allWordCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllWordCardsRef = FutureProviderRef<List<WordCardData>>;
String _$allArticleCardsHash() => r'c810e5f239ba1a3705ad39dd4c3b78afef271253';

/// See also [allArticleCards].
@ProviderFor(allArticleCards)
final allArticleCardsProvider = FutureProvider<List<ArticleCardData>>.internal(
  allArticleCards,
  name: r'allArticleCardsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allArticleCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllArticleCardsRef = FutureProviderRef<List<ArticleCardData>>;
String _$allSentenceCardsHash() => r'f2ec9511ca7448597cc23702948403a3debe8f16';

/// See also [allSentenceCards].
@ProviderFor(allSentenceCards)
final allSentenceCardsProvider =
    FutureProvider<List<SentenceCardData>>.internal(
  allSentenceCards,
  name: r'allSentenceCardsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allSentenceCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllSentenceCardsRef = FutureProviderRef<List<SentenceCardData>>;
String _$allDecksHash() => r'c29d6da5e75e7edb2b38ffb6124936825bcdca32';

/// See also [allDecks].
@ProviderFor(allDecks)
final allDecksProvider = FutureProvider<List<DeckData>>.internal(
  allDecks,
  name: r'allDecksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allDecksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllDecksRef = FutureProviderRef<List<DeckData>>;
String _$currentSessionHash() => r'0383dc13057ca588e304f71a497f205ca9bff7d0';

/// See also [currentSession].
@ProviderFor(currentSession)
final currentSessionProvider = FutureProvider<LearningSessionData?>.internal(
  currentSession,
  name: r'currentSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentSessionRef = FutureProviderRef<LearningSessionData?>;
String _$sessionHistoryHash() => r'81526d0b8d0eb5516331f82a470b4f7421b15062';

/// See also [sessionHistory].
@ProviderFor(sessionHistory)
final sessionHistoryProvider =
    FutureProvider<List<LearningSessionData>>.internal(
  sessionHistory,
  name: r'sessionHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionHistoryRef = FutureProviderRef<List<LearningSessionData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
