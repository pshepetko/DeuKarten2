// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_providers_drift.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardsRepositoryHash() => r'a73cb8597e2e3b72796ed906f0fbabe1ae847f95';

/// See also [cardsRepository].
@ProviderFor(cardsRepository)
final cardsRepositoryProvider = Provider<CardsRepository>.internal(
  cardsRepository,
  name: r'cardsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cardsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CardsRepositoryRef = ProviderRef<CardsRepository>;
String _$cardsRepositoryDriftHash() =>
    r'9042eb68e93a40214a108da9be0b19d4d96178ca';

/// See also [cardsRepositoryDrift].
@ProviderFor(cardsRepositoryDrift)
final cardsRepositoryDriftProvider = FutureProvider<CardsRepository>.internal(
  cardsRepositoryDrift,
  name: r'cardsRepositoryDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cardsRepositoryDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CardsRepositoryDriftRef = FutureProviderRef<CardsRepository>;
String _$decksRepositoryDriftHash() =>
    r'1074ee441f92d6ef8ce3cf246050b928f8e12205';

/// See also [decksRepositoryDrift].
@ProviderFor(decksRepositoryDrift)
final decksRepositoryDriftProvider = FutureProvider<DecksRepository>.internal(
  decksRepositoryDrift,
  name: r'decksRepositoryDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$decksRepositoryDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DecksRepositoryDriftRef = FutureProviderRef<DecksRepository>;
String _$sessionRepositoryDriftHash() =>
    r'c1279c75774217c47264d20b80f9882388a0d4a2';

/// See also [sessionRepositoryDrift].
@ProviderFor(sessionRepositoryDrift)
final sessionRepositoryDriftProvider =
    FutureProvider<SessionRepository>.internal(
  sessionRepositoryDrift,
  name: r'sessionRepositoryDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionRepositoryDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionRepositoryDriftRef = FutureProviderRef<SessionRepository>;
String _$allDecksDriftHash() => r'c607afec560cd9c7f3177acedb283a85f60c1970';

/// See also [allDecksDrift].
@ProviderFor(allDecksDrift)
final allDecksDriftProvider = FutureProvider<List<Deck>>.internal(
  allDecksDrift,
  name: r'allDecksDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allDecksDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllDecksDriftRef = FutureProviderRef<List<Deck>>;
String _$deckByIdDriftHash() => r'cc1da8e37c32c0684405221364bbb5ccc7766129';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [deckByIdDrift].
@ProviderFor(deckByIdDrift)
const deckByIdDriftProvider = DeckByIdDriftFamily();

/// See also [deckByIdDrift].
class DeckByIdDriftFamily extends Family<AsyncValue<Deck?>> {
  /// See also [deckByIdDrift].
  const DeckByIdDriftFamily();

  /// See also [deckByIdDrift].
  DeckByIdDriftProvider call(
    String id,
  ) {
    return DeckByIdDriftProvider(
      id,
    );
  }

  @override
  DeckByIdDriftProvider getProviderOverride(
    covariant DeckByIdDriftProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deckByIdDriftProvider';
}

/// See also [deckByIdDrift].
class DeckByIdDriftProvider extends FutureProvider<Deck?> {
  /// See also [deckByIdDrift].
  DeckByIdDriftProvider(
    String id,
  ) : this._internal(
          (ref) => deckByIdDrift(
            ref as DeckByIdDriftRef,
            id,
          ),
          from: deckByIdDriftProvider,
          name: r'deckByIdDriftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deckByIdDriftHash,
          dependencies: DeckByIdDriftFamily._dependencies,
          allTransitiveDependencies:
              DeckByIdDriftFamily._allTransitiveDependencies,
          id: id,
        );

  DeckByIdDriftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Deck?> Function(DeckByIdDriftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeckByIdDriftProvider._internal(
        (ref) => create(ref as DeckByIdDriftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Deck?> createElement() {
    return _DeckByIdDriftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeckByIdDriftProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeckByIdDriftRef on FutureProviderRef<Deck?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeckByIdDriftProviderElement extends FutureProviderElement<Deck?>
    with DeckByIdDriftRef {
  _DeckByIdDriftProviderElement(super.provider);

  @override
  String get id => (origin as DeckByIdDriftProvider).id;
}

String _$decksByLevelDriftHash() => r'45b6d5adad1246a313f0d559af34c4d98d255401';

/// See also [decksByLevelDrift].
@ProviderFor(decksByLevelDrift)
const decksByLevelDriftProvider = DecksByLevelDriftFamily();

/// See also [decksByLevelDrift].
class DecksByLevelDriftFamily extends Family<AsyncValue<List<Deck>>> {
  /// See also [decksByLevelDrift].
  const DecksByLevelDriftFamily();

  /// See also [decksByLevelDrift].
  DecksByLevelDriftProvider call(
    DifficultyLevel level,
  ) {
    return DecksByLevelDriftProvider(
      level,
    );
  }

  @override
  DecksByLevelDriftProvider getProviderOverride(
    covariant DecksByLevelDriftProvider provider,
  ) {
    return call(
      provider.level,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'decksByLevelDriftProvider';
}

/// See also [decksByLevelDrift].
class DecksByLevelDriftProvider extends FutureProvider<List<Deck>> {
  /// See also [decksByLevelDrift].
  DecksByLevelDriftProvider(
    DifficultyLevel level,
  ) : this._internal(
          (ref) => decksByLevelDrift(
            ref as DecksByLevelDriftRef,
            level,
          ),
          from: decksByLevelDriftProvider,
          name: r'decksByLevelDriftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$decksByLevelDriftHash,
          dependencies: DecksByLevelDriftFamily._dependencies,
          allTransitiveDependencies:
              DecksByLevelDriftFamily._allTransitiveDependencies,
          level: level,
        );

  DecksByLevelDriftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.level,
  }) : super.internal();

  final DifficultyLevel level;

  @override
  Override overrideWith(
    FutureOr<List<Deck>> Function(DecksByLevelDriftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DecksByLevelDriftProvider._internal(
        (ref) => create(ref as DecksByLevelDriftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        level: level,
      ),
    );
  }

  @override
  FutureProviderElement<List<Deck>> createElement() {
    return _DecksByLevelDriftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DecksByLevelDriftProvider && other.level == level;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, level.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DecksByLevelDriftRef on FutureProviderRef<List<Deck>> {
  /// The parameter `level` of this provider.
  DifficultyLevel get level;
}

class _DecksByLevelDriftProviderElement
    extends FutureProviderElement<List<Deck>> with DecksByLevelDriftRef {
  _DecksByLevelDriftProviderElement(super.provider);

  @override
  DifficultyLevel get level => (origin as DecksByLevelDriftProvider).level;
}

String _$recentDecksDriftHash() => r'76b4917da9618e6faccfe185083ca1308a0779a1';

/// See also [recentDecksDrift].
@ProviderFor(recentDecksDrift)
final recentDecksDriftProvider = FutureProvider<List<Deck>>.internal(
  recentDecksDrift,
  name: r'recentDecksDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentDecksDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecentDecksDriftRef = FutureProviderRef<List<Deck>>;
String _$allWordCardsDriftHash() => r'9303d2dc54565cbfc66ffcc884abc3d565d435e9';

/// See also [allWordCardsDrift].
@ProviderFor(allWordCardsDrift)
final allWordCardsDriftProvider = FutureProvider<List<WordCard>>.internal(
  allWordCardsDrift,
  name: r'allWordCardsDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allWordCardsDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllWordCardsDriftRef = FutureProviderRef<List<WordCard>>;
String _$wordCardByIdDriftHash() => r'dda8b0c0f7702039099f5946e2221f3cafd3cf66';

/// See also [wordCardByIdDrift].
@ProviderFor(wordCardByIdDrift)
const wordCardByIdDriftProvider = WordCardByIdDriftFamily();

/// See also [wordCardByIdDrift].
class WordCardByIdDriftFamily extends Family<AsyncValue<WordCard?>> {
  /// See also [wordCardByIdDrift].
  const WordCardByIdDriftFamily();

  /// See also [wordCardByIdDrift].
  WordCardByIdDriftProvider call(
    String id,
  ) {
    return WordCardByIdDriftProvider(
      id,
    );
  }

  @override
  WordCardByIdDriftProvider getProviderOverride(
    covariant WordCardByIdDriftProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wordCardByIdDriftProvider';
}

/// See also [wordCardByIdDrift].
class WordCardByIdDriftProvider extends FutureProvider<WordCard?> {
  /// See also [wordCardByIdDrift].
  WordCardByIdDriftProvider(
    String id,
  ) : this._internal(
          (ref) => wordCardByIdDrift(
            ref as WordCardByIdDriftRef,
            id,
          ),
          from: wordCardByIdDriftProvider,
          name: r'wordCardByIdDriftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordCardByIdDriftHash,
          dependencies: WordCardByIdDriftFamily._dependencies,
          allTransitiveDependencies:
              WordCardByIdDriftFamily._allTransitiveDependencies,
          id: id,
        );

  WordCardByIdDriftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<WordCard?> Function(WordCardByIdDriftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WordCardByIdDriftProvider._internal(
        (ref) => create(ref as WordCardByIdDriftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<WordCard?> createElement() {
    return _WordCardByIdDriftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordCardByIdDriftProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WordCardByIdDriftRef on FutureProviderRef<WordCard?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _WordCardByIdDriftProviderElement extends FutureProviderElement<WordCard?>
    with WordCardByIdDriftRef {
  _WordCardByIdDriftProviderElement(super.provider);

  @override
  String get id => (origin as WordCardByIdDriftProvider).id;
}

String _$wordCardsByLevelDriftHash() =>
    r'3293639a11e0107969a65fa716b99afba23d001a';

/// See also [wordCardsByLevelDrift].
@ProviderFor(wordCardsByLevelDrift)
const wordCardsByLevelDriftProvider = WordCardsByLevelDriftFamily();

/// See also [wordCardsByLevelDrift].
class WordCardsByLevelDriftFamily extends Family<AsyncValue<List<WordCard>>> {
  /// See also [wordCardsByLevelDrift].
  const WordCardsByLevelDriftFamily();

  /// See also [wordCardsByLevelDrift].
  WordCardsByLevelDriftProvider call(
    DifficultyLevel level,
  ) {
    return WordCardsByLevelDriftProvider(
      level,
    );
  }

  @override
  WordCardsByLevelDriftProvider getProviderOverride(
    covariant WordCardsByLevelDriftProvider provider,
  ) {
    return call(
      provider.level,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wordCardsByLevelDriftProvider';
}

/// See also [wordCardsByLevelDrift].
class WordCardsByLevelDriftProvider extends FutureProvider<List<WordCard>> {
  /// See also [wordCardsByLevelDrift].
  WordCardsByLevelDriftProvider(
    DifficultyLevel level,
  ) : this._internal(
          (ref) => wordCardsByLevelDrift(
            ref as WordCardsByLevelDriftRef,
            level,
          ),
          from: wordCardsByLevelDriftProvider,
          name: r'wordCardsByLevelDriftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordCardsByLevelDriftHash,
          dependencies: WordCardsByLevelDriftFamily._dependencies,
          allTransitiveDependencies:
              WordCardsByLevelDriftFamily._allTransitiveDependencies,
          level: level,
        );

  WordCardsByLevelDriftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.level,
  }) : super.internal();

  final DifficultyLevel level;

  @override
  Override overrideWith(
    FutureOr<List<WordCard>> Function(WordCardsByLevelDriftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WordCardsByLevelDriftProvider._internal(
        (ref) => create(ref as WordCardsByLevelDriftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        level: level,
      ),
    );
  }

  @override
  FutureProviderElement<List<WordCard>> createElement() {
    return _WordCardsByLevelDriftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordCardsByLevelDriftProvider && other.level == level;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, level.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WordCardsByLevelDriftRef on FutureProviderRef<List<WordCard>> {
  /// The parameter `level` of this provider.
  DifficultyLevel get level;
}

class _WordCardsByLevelDriftProviderElement
    extends FutureProviderElement<List<WordCard>>
    with WordCardsByLevelDriftRef {
  _WordCardsByLevelDriftProviderElement(super.provider);

  @override
  DifficultyLevel get level => (origin as WordCardsByLevelDriftProvider).level;
}

String _$wordCardsByTagDriftHash() =>
    r'90eaf464388234b2ca2da2a2ce537e645b3f41b0';

/// See also [wordCardsByTagDrift].
@ProviderFor(wordCardsByTagDrift)
const wordCardsByTagDriftProvider = WordCardsByTagDriftFamily();

/// See also [wordCardsByTagDrift].
class WordCardsByTagDriftFamily extends Family<AsyncValue<List<WordCard>>> {
  /// See also [wordCardsByTagDrift].
  const WordCardsByTagDriftFamily();

  /// See also [wordCardsByTagDrift].
  WordCardsByTagDriftProvider call(
    String tag,
  ) {
    return WordCardsByTagDriftProvider(
      tag,
    );
  }

  @override
  WordCardsByTagDriftProvider getProviderOverride(
    covariant WordCardsByTagDriftProvider provider,
  ) {
    return call(
      provider.tag,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wordCardsByTagDriftProvider';
}

/// See also [wordCardsByTagDrift].
class WordCardsByTagDriftProvider extends FutureProvider<List<WordCard>> {
  /// See also [wordCardsByTagDrift].
  WordCardsByTagDriftProvider(
    String tag,
  ) : this._internal(
          (ref) => wordCardsByTagDrift(
            ref as WordCardsByTagDriftRef,
            tag,
          ),
          from: wordCardsByTagDriftProvider,
          name: r'wordCardsByTagDriftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordCardsByTagDriftHash,
          dependencies: WordCardsByTagDriftFamily._dependencies,
          allTransitiveDependencies:
              WordCardsByTagDriftFamily._allTransitiveDependencies,
          tag: tag,
        );

  WordCardsByTagDriftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tag,
  }) : super.internal();

  final String tag;

  @override
  Override overrideWith(
    FutureOr<List<WordCard>> Function(WordCardsByTagDriftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WordCardsByTagDriftProvider._internal(
        (ref) => create(ref as WordCardsByTagDriftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tag: tag,
      ),
    );
  }

  @override
  FutureProviderElement<List<WordCard>> createElement() {
    return _WordCardsByTagDriftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordCardsByTagDriftProvider && other.tag == tag;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tag.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WordCardsByTagDriftRef on FutureProviderRef<List<WordCard>> {
  /// The parameter `tag` of this provider.
  String get tag;
}

class _WordCardsByTagDriftProviderElement
    extends FutureProviderElement<List<WordCard>> with WordCardsByTagDriftRef {
  _WordCardsByTagDriftProviderElement(super.provider);

  @override
  String get tag => (origin as WordCardsByTagDriftProvider).tag;
}

String _$allArticleCardsDriftHash() =>
    r'b8c10ce836c2c40d0d854d9788a058e6075183b3';

/// See also [allArticleCardsDrift].
@ProviderFor(allArticleCardsDrift)
final allArticleCardsDriftProvider = FutureProvider<List<ArticleCard>>.internal(
  allArticleCardsDrift,
  name: r'allArticleCardsDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allArticleCardsDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllArticleCardsDriftRef = FutureProviderRef<List<ArticleCard>>;
String _$allSentenceCardsDriftHash() =>
    r'31bfd1a3d3b93b5c3029dd9375035fe2785f8680';

/// See also [allSentenceCardsDrift].
@ProviderFor(allSentenceCardsDrift)
final allSentenceCardsDriftProvider =
    FutureProvider<List<SentenceCard>>.internal(
  allSentenceCardsDrift,
  name: r'allSentenceCardsDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allSentenceCardsDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllSentenceCardsDriftRef = FutureProviderRef<List<SentenceCard>>;
String _$cardsForSessionDriftHash() =>
    r'5f8b16bced6b67faf2bc821fdc869b8a4602a766';

/// See also [cardsForSessionDrift].
@ProviderFor(cardsForSessionDrift)
const cardsForSessionDriftProvider = CardsForSessionDriftFamily();

/// See also [cardsForSessionDrift].
class CardsForSessionDriftFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [cardsForSessionDrift].
  const CardsForSessionDriftFamily();

  /// See also [cardsForSessionDrift].
  CardsForSessionDriftProvider call(
    String deckId,
  ) {
    return CardsForSessionDriftProvider(
      deckId,
    );
  }

  @override
  CardsForSessionDriftProvider getProviderOverride(
    covariant CardsForSessionDriftProvider provider,
  ) {
    return call(
      provider.deckId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cardsForSessionDriftProvider';
}

/// See also [cardsForSessionDrift].
class CardsForSessionDriftProvider extends FutureProvider<List<dynamic>> {
  /// See also [cardsForSessionDrift].
  CardsForSessionDriftProvider(
    String deckId,
  ) : this._internal(
          (ref) => cardsForSessionDrift(
            ref as CardsForSessionDriftRef,
            deckId,
          ),
          from: cardsForSessionDriftProvider,
          name: r'cardsForSessionDriftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardsForSessionDriftHash,
          dependencies: CardsForSessionDriftFamily._dependencies,
          allTransitiveDependencies:
              CardsForSessionDriftFamily._allTransitiveDependencies,
          deckId: deckId,
        );

  CardsForSessionDriftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deckId,
  }) : super.internal();

  final String deckId;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(CardsForSessionDriftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CardsForSessionDriftProvider._internal(
        (ref) => create(ref as CardsForSessionDriftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deckId: deckId,
      ),
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _CardsForSessionDriftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CardsForSessionDriftProvider && other.deckId == deckId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deckId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CardsForSessionDriftRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `deckId` of this provider.
  String get deckId;
}

class _CardsForSessionDriftProviderElement
    extends FutureProviderElement<List<dynamic>> with CardsForSessionDriftRef {
  _CardsForSessionDriftProviderElement(super.provider);

  @override
  String get deckId => (origin as CardsForSessionDriftProvider).deckId;
}

String _$currentSessionDriftHash() =>
    r'f235d15f4af5e36d4315e0f101b3aecd975aebd4';

/// See also [currentSessionDrift].
@ProviderFor(currentSessionDrift)
final currentSessionDriftProvider = FutureProvider<LearningSession?>.internal(
  currentSessionDrift,
  name: r'currentSessionDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSessionDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentSessionDriftRef = FutureProviderRef<LearningSession?>;
String _$sessionHistoryDriftHash() =>
    r'1a477a481e4ec413cd006a23940929d75afdf916';

/// See also [sessionHistoryDrift].
@ProviderFor(sessionHistoryDrift)
final sessionHistoryDriftProvider =
    FutureProvider<List<LearningSession>>.internal(
  sessionHistoryDrift,
  name: r'sessionHistoryDriftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionHistoryDriftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionHistoryDriftRef = FutureProviderRef<List<LearningSession>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
