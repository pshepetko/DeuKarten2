// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $DecksTable extends Decks with TableInfo<$DecksTable, DeckData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cardIdsMeta =
      const VerificationMeta('cardIds');
  @override
  late final GeneratedColumn<String> cardIds = GeneratedColumn<String>(
      'card_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalCardsMeta =
      const VerificationMeta('totalCards');
  @override
  late final GeneratedColumn<int> totalCards = GeneratedColumn<int>(
      'total_cards', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cardsLearnedMeta =
      const VerificationMeta('cardsLearned');
  @override
  late final GeneratedColumn<int> cardsLearned = GeneratedColumn<int>(
      'cards_learned', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _thumbnailEmojiMeta =
      const VerificationMeta('thumbnailEmoji');
  @override
  late final GeneratedColumn<String> thumbnailEmoji = GeneratedColumn<String>(
      'thumbnail_emoji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastStudiedMeta =
      const VerificationMeta('lastStudied');
  @override
  late final GeneratedColumn<DateTime> lastStudied = GeneratedColumn<DateTime>(
      'last_studied', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        category,
        level,
        cardIds,
        totalCards,
        cardsLearned,
        progress,
        thumbnailEmoji,
        createdAt,
        lastStudied
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decks';
  @override
  VerificationContext validateIntegrity(Insertable<DeckData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('card_ids')) {
      context.handle(_cardIdsMeta,
          cardIds.isAcceptableOrUnknown(data['card_ids']!, _cardIdsMeta));
    } else if (isInserting) {
      context.missing(_cardIdsMeta);
    }
    if (data.containsKey('total_cards')) {
      context.handle(
          _totalCardsMeta,
          totalCards.isAcceptableOrUnknown(
              data['total_cards']!, _totalCardsMeta));
    } else if (isInserting) {
      context.missing(_totalCardsMeta);
    }
    if (data.containsKey('cards_learned')) {
      context.handle(
          _cardsLearnedMeta,
          cardsLearned.isAcceptableOrUnknown(
              data['cards_learned']!, _cardsLearnedMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('thumbnail_emoji')) {
      context.handle(
          _thumbnailEmojiMeta,
          thumbnailEmoji.isAcceptableOrUnknown(
              data['thumbnail_emoji']!, _thumbnailEmojiMeta));
    } else if (isInserting) {
      context.missing(_thumbnailEmojiMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_studied')) {
      context.handle(
          _lastStudiedMeta,
          lastStudied.isAcceptableOrUnknown(
              data['last_studied']!, _lastStudiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeckData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeckData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      cardIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_ids'])!,
      totalCards: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_cards'])!,
      cardsLearned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cards_learned'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      thumbnailEmoji: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}thumbnail_emoji'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastStudied: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_studied']),
    );
  }

  @override
  $DecksTable createAlias(String alias) {
    return $DecksTable(attachedDatabase, alias);
  }
}

class DeckData extends DataClass implements Insertable<DeckData> {
  final String id;
  final String name;
  final String description;
  final String category;
  final String level;
  final String cardIds;
  final int totalCards;
  final int cardsLearned;
  final double progress;
  final String thumbnailEmoji;
  final DateTime createdAt;
  final DateTime? lastStudied;
  const DeckData(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.level,
      required this.cardIds,
      required this.totalCards,
      required this.cardsLearned,
      required this.progress,
      required this.thumbnailEmoji,
      required this.createdAt,
      this.lastStudied});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['level'] = Variable<String>(level);
    map['card_ids'] = Variable<String>(cardIds);
    map['total_cards'] = Variable<int>(totalCards);
    map['cards_learned'] = Variable<int>(cardsLearned);
    map['progress'] = Variable<double>(progress);
    map['thumbnail_emoji'] = Variable<String>(thumbnailEmoji);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastStudied != null) {
      map['last_studied'] = Variable<DateTime>(lastStudied);
    }
    return map;
  }

  DecksCompanion toCompanion(bool nullToAbsent) {
    return DecksCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      category: Value(category),
      level: Value(level),
      cardIds: Value(cardIds),
      totalCards: Value(totalCards),
      cardsLearned: Value(cardsLearned),
      progress: Value(progress),
      thumbnailEmoji: Value(thumbnailEmoji),
      createdAt: Value(createdAt),
      lastStudied: lastStudied == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStudied),
    );
  }

  factory DeckData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeckData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      level: serializer.fromJson<String>(json['level']),
      cardIds: serializer.fromJson<String>(json['cardIds']),
      totalCards: serializer.fromJson<int>(json['totalCards']),
      cardsLearned: serializer.fromJson<int>(json['cardsLearned']),
      progress: serializer.fromJson<double>(json['progress']),
      thumbnailEmoji: serializer.fromJson<String>(json['thumbnailEmoji']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastStudied: serializer.fromJson<DateTime?>(json['lastStudied']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'level': serializer.toJson<String>(level),
      'cardIds': serializer.toJson<String>(cardIds),
      'totalCards': serializer.toJson<int>(totalCards),
      'cardsLearned': serializer.toJson<int>(cardsLearned),
      'progress': serializer.toJson<double>(progress),
      'thumbnailEmoji': serializer.toJson<String>(thumbnailEmoji),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastStudied': serializer.toJson<DateTime?>(lastStudied),
    };
  }

  DeckData copyWith(
          {String? id,
          String? name,
          String? description,
          String? category,
          String? level,
          String? cardIds,
          int? totalCards,
          int? cardsLearned,
          double? progress,
          String? thumbnailEmoji,
          DateTime? createdAt,
          Value<DateTime?> lastStudied = const Value.absent()}) =>
      DeckData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        category: category ?? this.category,
        level: level ?? this.level,
        cardIds: cardIds ?? this.cardIds,
        totalCards: totalCards ?? this.totalCards,
        cardsLearned: cardsLearned ?? this.cardsLearned,
        progress: progress ?? this.progress,
        thumbnailEmoji: thumbnailEmoji ?? this.thumbnailEmoji,
        createdAt: createdAt ?? this.createdAt,
        lastStudied: lastStudied.present ? lastStudied.value : this.lastStudied,
      );
  DeckData copyWithCompanion(DecksCompanion data) {
    return DeckData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      level: data.level.present ? data.level.value : this.level,
      cardIds: data.cardIds.present ? data.cardIds.value : this.cardIds,
      totalCards:
          data.totalCards.present ? data.totalCards.value : this.totalCards,
      cardsLearned: data.cardsLearned.present
          ? data.cardsLearned.value
          : this.cardsLearned,
      progress: data.progress.present ? data.progress.value : this.progress,
      thumbnailEmoji: data.thumbnailEmoji.present
          ? data.thumbnailEmoji.value
          : this.thumbnailEmoji,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastStudied:
          data.lastStudied.present ? data.lastStudied.value : this.lastStudied,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeckData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('level: $level, ')
          ..write('cardIds: $cardIds, ')
          ..write('totalCards: $totalCards, ')
          ..write('cardsLearned: $cardsLearned, ')
          ..write('progress: $progress, ')
          ..write('thumbnailEmoji: $thumbnailEmoji, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastStudied: $lastStudied')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      category,
      level,
      cardIds,
      totalCards,
      cardsLearned,
      progress,
      thumbnailEmoji,
      createdAt,
      lastStudied);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.category == this.category &&
          other.level == this.level &&
          other.cardIds == this.cardIds &&
          other.totalCards == this.totalCards &&
          other.cardsLearned == this.cardsLearned &&
          other.progress == this.progress &&
          other.thumbnailEmoji == this.thumbnailEmoji &&
          other.createdAt == this.createdAt &&
          other.lastStudied == this.lastStudied);
}

class DecksCompanion extends UpdateCompanion<DeckData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> category;
  final Value<String> level;
  final Value<String> cardIds;
  final Value<int> totalCards;
  final Value<int> cardsLearned;
  final Value<double> progress;
  final Value<String> thumbnailEmoji;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastStudied;
  final Value<int> rowid;
  const DecksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.level = const Value.absent(),
    this.cardIds = const Value.absent(),
    this.totalCards = const Value.absent(),
    this.cardsLearned = const Value.absent(),
    this.progress = const Value.absent(),
    this.thumbnailEmoji = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastStudied = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecksCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String category,
    required String level,
    required String cardIds,
    required int totalCards,
    this.cardsLearned = const Value.absent(),
    this.progress = const Value.absent(),
    required String thumbnailEmoji,
    required DateTime createdAt,
    this.lastStudied = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        category = Value(category),
        level = Value(level),
        cardIds = Value(cardIds),
        totalCards = Value(totalCards),
        thumbnailEmoji = Value(thumbnailEmoji),
        createdAt = Value(createdAt);
  static Insertable<DeckData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? level,
    Expression<String>? cardIds,
    Expression<int>? totalCards,
    Expression<int>? cardsLearned,
    Expression<double>? progress,
    Expression<String>? thumbnailEmoji,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastStudied,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (level != null) 'level': level,
      if (cardIds != null) 'card_ids': cardIds,
      if (totalCards != null) 'total_cards': totalCards,
      if (cardsLearned != null) 'cards_learned': cardsLearned,
      if (progress != null) 'progress': progress,
      if (thumbnailEmoji != null) 'thumbnail_emoji': thumbnailEmoji,
      if (createdAt != null) 'created_at': createdAt,
      if (lastStudied != null) 'last_studied': lastStudied,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecksCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? category,
      Value<String>? level,
      Value<String>? cardIds,
      Value<int>? totalCards,
      Value<int>? cardsLearned,
      Value<double>? progress,
      Value<String>? thumbnailEmoji,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastStudied,
      Value<int>? rowid}) {
    return DecksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      level: level ?? this.level,
      cardIds: cardIds ?? this.cardIds,
      totalCards: totalCards ?? this.totalCards,
      cardsLearned: cardsLearned ?? this.cardsLearned,
      progress: progress ?? this.progress,
      thumbnailEmoji: thumbnailEmoji ?? this.thumbnailEmoji,
      createdAt: createdAt ?? this.createdAt,
      lastStudied: lastStudied ?? this.lastStudied,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (cardIds.present) {
      map['card_ids'] = Variable<String>(cardIds.value);
    }
    if (totalCards.present) {
      map['total_cards'] = Variable<int>(totalCards.value);
    }
    if (cardsLearned.present) {
      map['cards_learned'] = Variable<int>(cardsLearned.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (thumbnailEmoji.present) {
      map['thumbnail_emoji'] = Variable<String>(thumbnailEmoji.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastStudied.present) {
      map['last_studied'] = Variable<DateTime>(lastStudied.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('level: $level, ')
          ..write('cardIds: $cardIds, ')
          ..write('totalCards: $totalCards, ')
          ..write('cardsLearned: $cardsLearned, ')
          ..write('progress: $progress, ')
          ..write('thumbnailEmoji: $thumbnailEmoji, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastStudied: $lastStudied, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WordCardsTable extends WordCards
    with TableInfo<$WordCardsTable, WordCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _germanWordMeta =
      const VerificationMeta('germanWord');
  @override
  late final GeneratedColumn<String> germanWord = GeneratedColumn<String>(
      'german_word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _articleMeta =
      const VerificationMeta('article');
  @override
  late final GeneratedColumn<String> article = GeneratedColumn<String>(
      'article', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pluralFormMeta =
      const VerificationMeta('pluralForm');
  @override
  late final GeneratedColumn<String> pluralForm = GeneratedColumn<String>(
      'plural_form', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exampleSentenceMeta =
      const VerificationMeta('exampleSentence');
  @override
  late final GeneratedColumn<String> exampleSentence = GeneratedColumn<String>(
      'example_sentence', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exampleTranslationMeta =
      const VerificationMeta('exampleTranslation');
  @override
  late final GeneratedColumn<String> exampleTranslation =
      GeneratedColumn<String>('example_translation', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  @override
  late final GeneratedColumn<String> deckId = GeneratedColumn<String>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES decks (id) ON DELETE CASCADE'));
  static const VerificationMeta _lastReviewedMeta =
      const VerificationMeta('lastReviewed');
  @override
  late final GeneratedColumn<DateTime> lastReviewed = GeneratedColumn<DateTime>(
      'last_reviewed', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextReviewMeta =
      const VerificationMeta('nextReview');
  @override
  late final GeneratedColumn<DateTime> nextReview = GeneratedColumn<DateTime>(
      'next_review', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _intervalDaysMeta =
      const VerificationMeta('intervalDays');
  @override
  late final GeneratedColumn<int> intervalDays = GeneratedColumn<int>(
      'interval_days', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _repetitionCountMeta =
      const VerificationMeta('repetitionCount');
  @override
  late final GeneratedColumn<int> repetitionCount = GeneratedColumn<int>(
      'repetition_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easeFactorMeta =
      const VerificationMeta('easeFactor');
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
      'ease_factor', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(2.5));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        germanWord,
        translation,
        article,
        pluralForm,
        exampleSentence,
        exampleTranslation,
        imageUrl,
        level,
        type,
        tags,
        deckId,
        lastReviewed,
        nextReview,
        intervalDays,
        repetitionCount,
        easeFactor
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_cards';
  @override
  VerificationContext validateIntegrity(Insertable<WordCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('german_word')) {
      context.handle(
          _germanWordMeta,
          germanWord.isAcceptableOrUnknown(
              data['german_word']!, _germanWordMeta));
    } else if (isInserting) {
      context.missing(_germanWordMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('article')) {
      context.handle(_articleMeta,
          article.isAcceptableOrUnknown(data['article']!, _articleMeta));
    } else if (isInserting) {
      context.missing(_articleMeta);
    }
    if (data.containsKey('plural_form')) {
      context.handle(
          _pluralFormMeta,
          pluralForm.isAcceptableOrUnknown(
              data['plural_form']!, _pluralFormMeta));
    } else if (isInserting) {
      context.missing(_pluralFormMeta);
    }
    if (data.containsKey('example_sentence')) {
      context.handle(
          _exampleSentenceMeta,
          exampleSentence.isAcceptableOrUnknown(
              data['example_sentence']!, _exampleSentenceMeta));
    }
    if (data.containsKey('example_translation')) {
      context.handle(
          _exampleTranslationMeta,
          exampleTranslation.isAcceptableOrUnknown(
              data['example_translation']!, _exampleTranslationMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('last_reviewed')) {
      context.handle(
          _lastReviewedMeta,
          lastReviewed.isAcceptableOrUnknown(
              data['last_reviewed']!, _lastReviewedMeta));
    }
    if (data.containsKey('next_review')) {
      context.handle(
          _nextReviewMeta,
          nextReview.isAcceptableOrUnknown(
              data['next_review']!, _nextReviewMeta));
    }
    if (data.containsKey('interval_days')) {
      context.handle(
          _intervalDaysMeta,
          intervalDays.isAcceptableOrUnknown(
              data['interval_days']!, _intervalDaysMeta));
    }
    if (data.containsKey('repetition_count')) {
      context.handle(
          _repetitionCountMeta,
          repetitionCount.isAcceptableOrUnknown(
              data['repetition_count']!, _repetitionCountMeta));
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
          _easeFactorMeta,
          easeFactor.isAcceptableOrUnknown(
              data['ease_factor']!, _easeFactorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordCardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      germanWord: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}german_word'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      article: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}article'])!,
      pluralForm: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plural_form'])!,
      exampleSentence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}example_sentence']),
      exampleTranslation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}example_translation']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck_id'])!,
      lastReviewed: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_reviewed']),
      nextReview: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_review']),
      intervalDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interval_days']),
      repetitionCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetition_count'])!,
      easeFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ease_factor'])!,
    );
  }

  @override
  $WordCardsTable createAlias(String alias) {
    return $WordCardsTable(attachedDatabase, alias);
  }
}

class WordCardData extends DataClass implements Insertable<WordCardData> {
  final String id;
  final String germanWord;
  final String translation;
  final String article;
  final String pluralForm;
  final String? exampleSentence;
  final String? exampleTranslation;
  final String? imageUrl;
  final String level;
  final String type;
  final String tags;
  final String deckId;
  final DateTime? lastReviewed;
  final DateTime? nextReview;
  final int? intervalDays;
  final int repetitionCount;
  final double easeFactor;
  const WordCardData(
      {required this.id,
      required this.germanWord,
      required this.translation,
      required this.article,
      required this.pluralForm,
      this.exampleSentence,
      this.exampleTranslation,
      this.imageUrl,
      required this.level,
      required this.type,
      required this.tags,
      required this.deckId,
      this.lastReviewed,
      this.nextReview,
      this.intervalDays,
      required this.repetitionCount,
      required this.easeFactor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['german_word'] = Variable<String>(germanWord);
    map['translation'] = Variable<String>(translation);
    map['article'] = Variable<String>(article);
    map['plural_form'] = Variable<String>(pluralForm);
    if (!nullToAbsent || exampleSentence != null) {
      map['example_sentence'] = Variable<String>(exampleSentence);
    }
    if (!nullToAbsent || exampleTranslation != null) {
      map['example_translation'] = Variable<String>(exampleTranslation);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['level'] = Variable<String>(level);
    map['type'] = Variable<String>(type);
    map['tags'] = Variable<String>(tags);
    map['deck_id'] = Variable<String>(deckId);
    if (!nullToAbsent || lastReviewed != null) {
      map['last_reviewed'] = Variable<DateTime>(lastReviewed);
    }
    if (!nullToAbsent || nextReview != null) {
      map['next_review'] = Variable<DateTime>(nextReview);
    }
    if (!nullToAbsent || intervalDays != null) {
      map['interval_days'] = Variable<int>(intervalDays);
    }
    map['repetition_count'] = Variable<int>(repetitionCount);
    map['ease_factor'] = Variable<double>(easeFactor);
    return map;
  }

  WordCardsCompanion toCompanion(bool nullToAbsent) {
    return WordCardsCompanion(
      id: Value(id),
      germanWord: Value(germanWord),
      translation: Value(translation),
      article: Value(article),
      pluralForm: Value(pluralForm),
      exampleSentence: exampleSentence == null && nullToAbsent
          ? const Value.absent()
          : Value(exampleSentence),
      exampleTranslation: exampleTranslation == null && nullToAbsent
          ? const Value.absent()
          : Value(exampleTranslation),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      level: Value(level),
      type: Value(type),
      tags: Value(tags),
      deckId: Value(deckId),
      lastReviewed: lastReviewed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewed),
      nextReview: nextReview == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReview),
      intervalDays: intervalDays == null && nullToAbsent
          ? const Value.absent()
          : Value(intervalDays),
      repetitionCount: Value(repetitionCount),
      easeFactor: Value(easeFactor),
    );
  }

  factory WordCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordCardData(
      id: serializer.fromJson<String>(json['id']),
      germanWord: serializer.fromJson<String>(json['germanWord']),
      translation: serializer.fromJson<String>(json['translation']),
      article: serializer.fromJson<String>(json['article']),
      pluralForm: serializer.fromJson<String>(json['pluralForm']),
      exampleSentence: serializer.fromJson<String?>(json['exampleSentence']),
      exampleTranslation:
          serializer.fromJson<String?>(json['exampleTranslation']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      level: serializer.fromJson<String>(json['level']),
      type: serializer.fromJson<String>(json['type']),
      tags: serializer.fromJson<String>(json['tags']),
      deckId: serializer.fromJson<String>(json['deckId']),
      lastReviewed: serializer.fromJson<DateTime?>(json['lastReviewed']),
      nextReview: serializer.fromJson<DateTime?>(json['nextReview']),
      intervalDays: serializer.fromJson<int?>(json['intervalDays']),
      repetitionCount: serializer.fromJson<int>(json['repetitionCount']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'germanWord': serializer.toJson<String>(germanWord),
      'translation': serializer.toJson<String>(translation),
      'article': serializer.toJson<String>(article),
      'pluralForm': serializer.toJson<String>(pluralForm),
      'exampleSentence': serializer.toJson<String?>(exampleSentence),
      'exampleTranslation': serializer.toJson<String?>(exampleTranslation),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'level': serializer.toJson<String>(level),
      'type': serializer.toJson<String>(type),
      'tags': serializer.toJson<String>(tags),
      'deckId': serializer.toJson<String>(deckId),
      'lastReviewed': serializer.toJson<DateTime?>(lastReviewed),
      'nextReview': serializer.toJson<DateTime?>(nextReview),
      'intervalDays': serializer.toJson<int?>(intervalDays),
      'repetitionCount': serializer.toJson<int>(repetitionCount),
      'easeFactor': serializer.toJson<double>(easeFactor),
    };
  }

  WordCardData copyWith(
          {String? id,
          String? germanWord,
          String? translation,
          String? article,
          String? pluralForm,
          Value<String?> exampleSentence = const Value.absent(),
          Value<String?> exampleTranslation = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          String? level,
          String? type,
          String? tags,
          String? deckId,
          Value<DateTime?> lastReviewed = const Value.absent(),
          Value<DateTime?> nextReview = const Value.absent(),
          Value<int?> intervalDays = const Value.absent(),
          int? repetitionCount,
          double? easeFactor}) =>
      WordCardData(
        id: id ?? this.id,
        germanWord: germanWord ?? this.germanWord,
        translation: translation ?? this.translation,
        article: article ?? this.article,
        pluralForm: pluralForm ?? this.pluralForm,
        exampleSentence: exampleSentence.present
            ? exampleSentence.value
            : this.exampleSentence,
        exampleTranslation: exampleTranslation.present
            ? exampleTranslation.value
            : this.exampleTranslation,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        level: level ?? this.level,
        type: type ?? this.type,
        tags: tags ?? this.tags,
        deckId: deckId ?? this.deckId,
        lastReviewed:
            lastReviewed.present ? lastReviewed.value : this.lastReviewed,
        nextReview: nextReview.present ? nextReview.value : this.nextReview,
        intervalDays:
            intervalDays.present ? intervalDays.value : this.intervalDays,
        repetitionCount: repetitionCount ?? this.repetitionCount,
        easeFactor: easeFactor ?? this.easeFactor,
      );
  WordCardData copyWithCompanion(WordCardsCompanion data) {
    return WordCardData(
      id: data.id.present ? data.id.value : this.id,
      germanWord:
          data.germanWord.present ? data.germanWord.value : this.germanWord,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      article: data.article.present ? data.article.value : this.article,
      pluralForm:
          data.pluralForm.present ? data.pluralForm.value : this.pluralForm,
      exampleSentence: data.exampleSentence.present
          ? data.exampleSentence.value
          : this.exampleSentence,
      exampleTranslation: data.exampleTranslation.present
          ? data.exampleTranslation.value
          : this.exampleTranslation,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      level: data.level.present ? data.level.value : this.level,
      type: data.type.present ? data.type.value : this.type,
      tags: data.tags.present ? data.tags.value : this.tags,
      deckId: data.deckId.present ? data.deckId.value : this.deckId,
      lastReviewed: data.lastReviewed.present
          ? data.lastReviewed.value
          : this.lastReviewed,
      nextReview:
          data.nextReview.present ? data.nextReview.value : this.nextReview,
      intervalDays: data.intervalDays.present
          ? data.intervalDays.value
          : this.intervalDays,
      repetitionCount: data.repetitionCount.present
          ? data.repetitionCount.value
          : this.repetitionCount,
      easeFactor:
          data.easeFactor.present ? data.easeFactor.value : this.easeFactor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordCardData(')
          ..write('id: $id, ')
          ..write('germanWord: $germanWord, ')
          ..write('translation: $translation, ')
          ..write('article: $article, ')
          ..write('pluralForm: $pluralForm, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('exampleTranslation: $exampleTranslation, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('level: $level, ')
          ..write('type: $type, ')
          ..write('tags: $tags, ')
          ..write('deckId: $deckId, ')
          ..write('lastReviewed: $lastReviewed, ')
          ..write('nextReview: $nextReview, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitionCount: $repetitionCount, ')
          ..write('easeFactor: $easeFactor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      germanWord,
      translation,
      article,
      pluralForm,
      exampleSentence,
      exampleTranslation,
      imageUrl,
      level,
      type,
      tags,
      deckId,
      lastReviewed,
      nextReview,
      intervalDays,
      repetitionCount,
      easeFactor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordCardData &&
          other.id == this.id &&
          other.germanWord == this.germanWord &&
          other.translation == this.translation &&
          other.article == this.article &&
          other.pluralForm == this.pluralForm &&
          other.exampleSentence == this.exampleSentence &&
          other.exampleTranslation == this.exampleTranslation &&
          other.imageUrl == this.imageUrl &&
          other.level == this.level &&
          other.type == this.type &&
          other.tags == this.tags &&
          other.deckId == this.deckId &&
          other.lastReviewed == this.lastReviewed &&
          other.nextReview == this.nextReview &&
          other.intervalDays == this.intervalDays &&
          other.repetitionCount == this.repetitionCount &&
          other.easeFactor == this.easeFactor);
}

class WordCardsCompanion extends UpdateCompanion<WordCardData> {
  final Value<String> id;
  final Value<String> germanWord;
  final Value<String> translation;
  final Value<String> article;
  final Value<String> pluralForm;
  final Value<String?> exampleSentence;
  final Value<String?> exampleTranslation;
  final Value<String?> imageUrl;
  final Value<String> level;
  final Value<String> type;
  final Value<String> tags;
  final Value<String> deckId;
  final Value<DateTime?> lastReviewed;
  final Value<DateTime?> nextReview;
  final Value<int?> intervalDays;
  final Value<int> repetitionCount;
  final Value<double> easeFactor;
  final Value<int> rowid;
  const WordCardsCompanion({
    this.id = const Value.absent(),
    this.germanWord = const Value.absent(),
    this.translation = const Value.absent(),
    this.article = const Value.absent(),
    this.pluralForm = const Value.absent(),
    this.exampleSentence = const Value.absent(),
    this.exampleTranslation = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.level = const Value.absent(),
    this.type = const Value.absent(),
    this.tags = const Value.absent(),
    this.deckId = const Value.absent(),
    this.lastReviewed = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitionCount = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordCardsCompanion.insert({
    required String id,
    required String germanWord,
    required String translation,
    required String article,
    required String pluralForm,
    this.exampleSentence = const Value.absent(),
    this.exampleTranslation = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required String level,
    required String type,
    required String tags,
    required String deckId,
    this.lastReviewed = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitionCount = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        germanWord = Value(germanWord),
        translation = Value(translation),
        article = Value(article),
        pluralForm = Value(pluralForm),
        level = Value(level),
        type = Value(type),
        tags = Value(tags),
        deckId = Value(deckId);
  static Insertable<WordCardData> custom({
    Expression<String>? id,
    Expression<String>? germanWord,
    Expression<String>? translation,
    Expression<String>? article,
    Expression<String>? pluralForm,
    Expression<String>? exampleSentence,
    Expression<String>? exampleTranslation,
    Expression<String>? imageUrl,
    Expression<String>? level,
    Expression<String>? type,
    Expression<String>? tags,
    Expression<String>? deckId,
    Expression<DateTime>? lastReviewed,
    Expression<DateTime>? nextReview,
    Expression<int>? intervalDays,
    Expression<int>? repetitionCount,
    Expression<double>? easeFactor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (germanWord != null) 'german_word': germanWord,
      if (translation != null) 'translation': translation,
      if (article != null) 'article': article,
      if (pluralForm != null) 'plural_form': pluralForm,
      if (exampleSentence != null) 'example_sentence': exampleSentence,
      if (exampleTranslation != null) 'example_translation': exampleTranslation,
      if (imageUrl != null) 'image_url': imageUrl,
      if (level != null) 'level': level,
      if (type != null) 'type': type,
      if (tags != null) 'tags': tags,
      if (deckId != null) 'deck_id': deckId,
      if (lastReviewed != null) 'last_reviewed': lastReviewed,
      if (nextReview != null) 'next_review': nextReview,
      if (intervalDays != null) 'interval_days': intervalDays,
      if (repetitionCount != null) 'repetition_count': repetitionCount,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordCardsCompanion copyWith(
      {Value<String>? id,
      Value<String>? germanWord,
      Value<String>? translation,
      Value<String>? article,
      Value<String>? pluralForm,
      Value<String?>? exampleSentence,
      Value<String?>? exampleTranslation,
      Value<String?>? imageUrl,
      Value<String>? level,
      Value<String>? type,
      Value<String>? tags,
      Value<String>? deckId,
      Value<DateTime?>? lastReviewed,
      Value<DateTime?>? nextReview,
      Value<int?>? intervalDays,
      Value<int>? repetitionCount,
      Value<double>? easeFactor,
      Value<int>? rowid}) {
    return WordCardsCompanion(
      id: id ?? this.id,
      germanWord: germanWord ?? this.germanWord,
      translation: translation ?? this.translation,
      article: article ?? this.article,
      pluralForm: pluralForm ?? this.pluralForm,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      exampleTranslation: exampleTranslation ?? this.exampleTranslation,
      imageUrl: imageUrl ?? this.imageUrl,
      level: level ?? this.level,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      deckId: deckId ?? this.deckId,
      lastReviewed: lastReviewed ?? this.lastReviewed,
      nextReview: nextReview ?? this.nextReview,
      intervalDays: intervalDays ?? this.intervalDays,
      repetitionCount: repetitionCount ?? this.repetitionCount,
      easeFactor: easeFactor ?? this.easeFactor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (germanWord.present) {
      map['german_word'] = Variable<String>(germanWord.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (article.present) {
      map['article'] = Variable<String>(article.value);
    }
    if (pluralForm.present) {
      map['plural_form'] = Variable<String>(pluralForm.value);
    }
    if (exampleSentence.present) {
      map['example_sentence'] = Variable<String>(exampleSentence.value);
    }
    if (exampleTranslation.present) {
      map['example_translation'] = Variable<String>(exampleTranslation.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<String>(deckId.value);
    }
    if (lastReviewed.present) {
      map['last_reviewed'] = Variable<DateTime>(lastReviewed.value);
    }
    if (nextReview.present) {
      map['next_review'] = Variable<DateTime>(nextReview.value);
    }
    if (intervalDays.present) {
      map['interval_days'] = Variable<int>(intervalDays.value);
    }
    if (repetitionCount.present) {
      map['repetition_count'] = Variable<int>(repetitionCount.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordCardsCompanion(')
          ..write('id: $id, ')
          ..write('germanWord: $germanWord, ')
          ..write('translation: $translation, ')
          ..write('article: $article, ')
          ..write('pluralForm: $pluralForm, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('exampleTranslation: $exampleTranslation, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('level: $level, ')
          ..write('type: $type, ')
          ..write('tags: $tags, ')
          ..write('deckId: $deckId, ')
          ..write('lastReviewed: $lastReviewed, ')
          ..write('nextReview: $nextReview, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitionCount: $repetitionCount, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticleCardsTable extends ArticleCards
    with TableInfo<$ArticleCardsTable, ArticleCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctArticleMeta =
      const VerificationMeta('correctArticle');
  @override
  late final GeneratedColumn<String> correctArticle = GeneratedColumn<String>(
      'correct_article', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionsMeta =
      const VerificationMeta('options');
  @override
  late final GeneratedColumn<String> options = GeneratedColumn<String>(
      'options', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exampleSentenceMeta =
      const VerificationMeta('exampleSentence');
  @override
  late final GeneratedColumn<String> exampleSentence = GeneratedColumn<String>(
      'example_sentence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wordCardIdMeta =
      const VerificationMeta('wordCardId');
  @override
  late final GeneratedColumn<String> wordCardId = GeneratedColumn<String>(
      'word_card_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES word_cards (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        word,
        correctArticle,
        options,
        translation,
        exampleSentence,
        level,
        wordCardId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'article_cards';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('correct_article')) {
      context.handle(
          _correctArticleMeta,
          correctArticle.isAcceptableOrUnknown(
              data['correct_article']!, _correctArticleMeta));
    } else if (isInserting) {
      context.missing(_correctArticleMeta);
    }
    if (data.containsKey('options')) {
      context.handle(_optionsMeta,
          options.isAcceptableOrUnknown(data['options']!, _optionsMeta));
    } else if (isInserting) {
      context.missing(_optionsMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('example_sentence')) {
      context.handle(
          _exampleSentenceMeta,
          exampleSentence.isAcceptableOrUnknown(
              data['example_sentence']!, _exampleSentenceMeta));
    } else if (isInserting) {
      context.missing(_exampleSentenceMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('word_card_id')) {
      context.handle(
          _wordCardIdMeta,
          wordCardId.isAcceptableOrUnknown(
              data['word_card_id']!, _wordCardIdMeta));
    } else if (isInserting) {
      context.missing(_wordCardIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArticleCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleCardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      correctArticle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}correct_article'])!,
      options: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      exampleSentence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}example_sentence'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      wordCardId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word_card_id'])!,
    );
  }

  @override
  $ArticleCardsTable createAlias(String alias) {
    return $ArticleCardsTable(attachedDatabase, alias);
  }
}

class ArticleCardData extends DataClass implements Insertable<ArticleCardData> {
  final String id;
  final String word;
  final String correctArticle;
  final String options;
  final String translation;
  final String exampleSentence;
  final String level;
  final String wordCardId;
  const ArticleCardData(
      {required this.id,
      required this.word,
      required this.correctArticle,
      required this.options,
      required this.translation,
      required this.exampleSentence,
      required this.level,
      required this.wordCardId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['word'] = Variable<String>(word);
    map['correct_article'] = Variable<String>(correctArticle);
    map['options'] = Variable<String>(options);
    map['translation'] = Variable<String>(translation);
    map['example_sentence'] = Variable<String>(exampleSentence);
    map['level'] = Variable<String>(level);
    map['word_card_id'] = Variable<String>(wordCardId);
    return map;
  }

  ArticleCardsCompanion toCompanion(bool nullToAbsent) {
    return ArticleCardsCompanion(
      id: Value(id),
      word: Value(word),
      correctArticle: Value(correctArticle),
      options: Value(options),
      translation: Value(translation),
      exampleSentence: Value(exampleSentence),
      level: Value(level),
      wordCardId: Value(wordCardId),
    );
  }

  factory ArticleCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleCardData(
      id: serializer.fromJson<String>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      correctArticle: serializer.fromJson<String>(json['correctArticle']),
      options: serializer.fromJson<String>(json['options']),
      translation: serializer.fromJson<String>(json['translation']),
      exampleSentence: serializer.fromJson<String>(json['exampleSentence']),
      level: serializer.fromJson<String>(json['level']),
      wordCardId: serializer.fromJson<String>(json['wordCardId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'word': serializer.toJson<String>(word),
      'correctArticle': serializer.toJson<String>(correctArticle),
      'options': serializer.toJson<String>(options),
      'translation': serializer.toJson<String>(translation),
      'exampleSentence': serializer.toJson<String>(exampleSentence),
      'level': serializer.toJson<String>(level),
      'wordCardId': serializer.toJson<String>(wordCardId),
    };
  }

  ArticleCardData copyWith(
          {String? id,
          String? word,
          String? correctArticle,
          String? options,
          String? translation,
          String? exampleSentence,
          String? level,
          String? wordCardId}) =>
      ArticleCardData(
        id: id ?? this.id,
        word: word ?? this.word,
        correctArticle: correctArticle ?? this.correctArticle,
        options: options ?? this.options,
        translation: translation ?? this.translation,
        exampleSentence: exampleSentence ?? this.exampleSentence,
        level: level ?? this.level,
        wordCardId: wordCardId ?? this.wordCardId,
      );
  ArticleCardData copyWithCompanion(ArticleCardsCompanion data) {
    return ArticleCardData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      correctArticle: data.correctArticle.present
          ? data.correctArticle.value
          : this.correctArticle,
      options: data.options.present ? data.options.value : this.options,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      exampleSentence: data.exampleSentence.present
          ? data.exampleSentence.value
          : this.exampleSentence,
      level: data.level.present ? data.level.value : this.level,
      wordCardId:
          data.wordCardId.present ? data.wordCardId.value : this.wordCardId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArticleCardData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('correctArticle: $correctArticle, ')
          ..write('options: $options, ')
          ..write('translation: $translation, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('level: $level, ')
          ..write('wordCardId: $wordCardId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, correctArticle, options,
      translation, exampleSentence, level, wordCardId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleCardData &&
          other.id == this.id &&
          other.word == this.word &&
          other.correctArticle == this.correctArticle &&
          other.options == this.options &&
          other.translation == this.translation &&
          other.exampleSentence == this.exampleSentence &&
          other.level == this.level &&
          other.wordCardId == this.wordCardId);
}

class ArticleCardsCompanion extends UpdateCompanion<ArticleCardData> {
  final Value<String> id;
  final Value<String> word;
  final Value<String> correctArticle;
  final Value<String> options;
  final Value<String> translation;
  final Value<String> exampleSentence;
  final Value<String> level;
  final Value<String> wordCardId;
  final Value<int> rowid;
  const ArticleCardsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.correctArticle = const Value.absent(),
    this.options = const Value.absent(),
    this.translation = const Value.absent(),
    this.exampleSentence = const Value.absent(),
    this.level = const Value.absent(),
    this.wordCardId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticleCardsCompanion.insert({
    required String id,
    required String word,
    required String correctArticle,
    required String options,
    required String translation,
    required String exampleSentence,
    required String level,
    required String wordCardId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        word = Value(word),
        correctArticle = Value(correctArticle),
        options = Value(options),
        translation = Value(translation),
        exampleSentence = Value(exampleSentence),
        level = Value(level),
        wordCardId = Value(wordCardId);
  static Insertable<ArticleCardData> custom({
    Expression<String>? id,
    Expression<String>? word,
    Expression<String>? correctArticle,
    Expression<String>? options,
    Expression<String>? translation,
    Expression<String>? exampleSentence,
    Expression<String>? level,
    Expression<String>? wordCardId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (correctArticle != null) 'correct_article': correctArticle,
      if (options != null) 'options': options,
      if (translation != null) 'translation': translation,
      if (exampleSentence != null) 'example_sentence': exampleSentence,
      if (level != null) 'level': level,
      if (wordCardId != null) 'word_card_id': wordCardId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticleCardsCompanion copyWith(
      {Value<String>? id,
      Value<String>? word,
      Value<String>? correctArticle,
      Value<String>? options,
      Value<String>? translation,
      Value<String>? exampleSentence,
      Value<String>? level,
      Value<String>? wordCardId,
      Value<int>? rowid}) {
    return ArticleCardsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      correctArticle: correctArticle ?? this.correctArticle,
      options: options ?? this.options,
      translation: translation ?? this.translation,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      level: level ?? this.level,
      wordCardId: wordCardId ?? this.wordCardId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (correctArticle.present) {
      map['correct_article'] = Variable<String>(correctArticle.value);
    }
    if (options.present) {
      map['options'] = Variable<String>(options.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (exampleSentence.present) {
      map['example_sentence'] = Variable<String>(exampleSentence.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (wordCardId.present) {
      map['word_card_id'] = Variable<String>(wordCardId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleCardsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('correctArticle: $correctArticle, ')
          ..write('options: $options, ')
          ..write('translation: $translation, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('level: $level, ')
          ..write('wordCardId: $wordCardId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SentenceCardsTable extends SentenceCards
    with TableInfo<$SentenceCardsTable, SentenceCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SentenceCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _incompleteSentenceMeta =
      const VerificationMeta('incompleteSentence');
  @override
  late final GeneratedColumn<String> incompleteSentence =
      GeneratedColumn<String>('incomplete_sentence', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wordOptionsMeta =
      const VerificationMeta('wordOptions');
  @override
  late final GeneratedColumn<String> wordOptions = GeneratedColumn<String>(
      'word_options', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctAnswerMeta =
      const VerificationMeta('correctAnswer');
  @override
  late final GeneratedColumn<String> correctAnswer = GeneratedColumn<String>(
      'correct_answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _completeSentenceMeta =
      const VerificationMeta('completeSentence');
  @override
  late final GeneratedColumn<String> completeSentence = GeneratedColumn<String>(
      'complete_sentence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _grammarTopicMeta =
      const VerificationMeta('grammarTopic');
  @override
  late final GeneratedColumn<String> grammarTopic = GeneratedColumn<String>(
      'grammar_topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  @override
  late final GeneratedColumn<String> deckId = GeneratedColumn<String>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES decks (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        incompleteSentence,
        wordOptions,
        correctAnswer,
        completeSentence,
        translation,
        level,
        grammarTopic,
        deckId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sentence_cards';
  @override
  VerificationContext validateIntegrity(Insertable<SentenceCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('incomplete_sentence')) {
      context.handle(
          _incompleteSentenceMeta,
          incompleteSentence.isAcceptableOrUnknown(
              data['incomplete_sentence']!, _incompleteSentenceMeta));
    } else if (isInserting) {
      context.missing(_incompleteSentenceMeta);
    }
    if (data.containsKey('word_options')) {
      context.handle(
          _wordOptionsMeta,
          wordOptions.isAcceptableOrUnknown(
              data['word_options']!, _wordOptionsMeta));
    } else if (isInserting) {
      context.missing(_wordOptionsMeta);
    }
    if (data.containsKey('correct_answer')) {
      context.handle(
          _correctAnswerMeta,
          correctAnswer.isAcceptableOrUnknown(
              data['correct_answer']!, _correctAnswerMeta));
    } else if (isInserting) {
      context.missing(_correctAnswerMeta);
    }
    if (data.containsKey('complete_sentence')) {
      context.handle(
          _completeSentenceMeta,
          completeSentence.isAcceptableOrUnknown(
              data['complete_sentence']!, _completeSentenceMeta));
    } else if (isInserting) {
      context.missing(_completeSentenceMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('grammar_topic')) {
      context.handle(
          _grammarTopicMeta,
          grammarTopic.isAcceptableOrUnknown(
              data['grammar_topic']!, _grammarTopicMeta));
    } else if (isInserting) {
      context.missing(_grammarTopicMeta);
    }
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SentenceCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SentenceCardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      incompleteSentence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}incomplete_sentence'])!,
      wordOptions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word_options'])!,
      correctAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}correct_answer'])!,
      completeSentence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}complete_sentence'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      grammarTopic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grammar_topic'])!,
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck_id'])!,
    );
  }

  @override
  $SentenceCardsTable createAlias(String alias) {
    return $SentenceCardsTable(attachedDatabase, alias);
  }
}

class SentenceCardData extends DataClass
    implements Insertable<SentenceCardData> {
  final String id;
  final String incompleteSentence;
  final String wordOptions;
  final String correctAnswer;
  final String completeSentence;
  final String translation;
  final String level;
  final String grammarTopic;
  final String deckId;
  const SentenceCardData(
      {required this.id,
      required this.incompleteSentence,
      required this.wordOptions,
      required this.correctAnswer,
      required this.completeSentence,
      required this.translation,
      required this.level,
      required this.grammarTopic,
      required this.deckId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['incomplete_sentence'] = Variable<String>(incompleteSentence);
    map['word_options'] = Variable<String>(wordOptions);
    map['correct_answer'] = Variable<String>(correctAnswer);
    map['complete_sentence'] = Variable<String>(completeSentence);
    map['translation'] = Variable<String>(translation);
    map['level'] = Variable<String>(level);
    map['grammar_topic'] = Variable<String>(grammarTopic);
    map['deck_id'] = Variable<String>(deckId);
    return map;
  }

  SentenceCardsCompanion toCompanion(bool nullToAbsent) {
    return SentenceCardsCompanion(
      id: Value(id),
      incompleteSentence: Value(incompleteSentence),
      wordOptions: Value(wordOptions),
      correctAnswer: Value(correctAnswer),
      completeSentence: Value(completeSentence),
      translation: Value(translation),
      level: Value(level),
      grammarTopic: Value(grammarTopic),
      deckId: Value(deckId),
    );
  }

  factory SentenceCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SentenceCardData(
      id: serializer.fromJson<String>(json['id']),
      incompleteSentence:
          serializer.fromJson<String>(json['incompleteSentence']),
      wordOptions: serializer.fromJson<String>(json['wordOptions']),
      correctAnswer: serializer.fromJson<String>(json['correctAnswer']),
      completeSentence: serializer.fromJson<String>(json['completeSentence']),
      translation: serializer.fromJson<String>(json['translation']),
      level: serializer.fromJson<String>(json['level']),
      grammarTopic: serializer.fromJson<String>(json['grammarTopic']),
      deckId: serializer.fromJson<String>(json['deckId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'incompleteSentence': serializer.toJson<String>(incompleteSentence),
      'wordOptions': serializer.toJson<String>(wordOptions),
      'correctAnswer': serializer.toJson<String>(correctAnswer),
      'completeSentence': serializer.toJson<String>(completeSentence),
      'translation': serializer.toJson<String>(translation),
      'level': serializer.toJson<String>(level),
      'grammarTopic': serializer.toJson<String>(grammarTopic),
      'deckId': serializer.toJson<String>(deckId),
    };
  }

  SentenceCardData copyWith(
          {String? id,
          String? incompleteSentence,
          String? wordOptions,
          String? correctAnswer,
          String? completeSentence,
          String? translation,
          String? level,
          String? grammarTopic,
          String? deckId}) =>
      SentenceCardData(
        id: id ?? this.id,
        incompleteSentence: incompleteSentence ?? this.incompleteSentence,
        wordOptions: wordOptions ?? this.wordOptions,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        completeSentence: completeSentence ?? this.completeSentence,
        translation: translation ?? this.translation,
        level: level ?? this.level,
        grammarTopic: grammarTopic ?? this.grammarTopic,
        deckId: deckId ?? this.deckId,
      );
  SentenceCardData copyWithCompanion(SentenceCardsCompanion data) {
    return SentenceCardData(
      id: data.id.present ? data.id.value : this.id,
      incompleteSentence: data.incompleteSentence.present
          ? data.incompleteSentence.value
          : this.incompleteSentence,
      wordOptions:
          data.wordOptions.present ? data.wordOptions.value : this.wordOptions,
      correctAnswer: data.correctAnswer.present
          ? data.correctAnswer.value
          : this.correctAnswer,
      completeSentence: data.completeSentence.present
          ? data.completeSentence.value
          : this.completeSentence,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      level: data.level.present ? data.level.value : this.level,
      grammarTopic: data.grammarTopic.present
          ? data.grammarTopic.value
          : this.grammarTopic,
      deckId: data.deckId.present ? data.deckId.value : this.deckId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SentenceCardData(')
          ..write('id: $id, ')
          ..write('incompleteSentence: $incompleteSentence, ')
          ..write('wordOptions: $wordOptions, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('completeSentence: $completeSentence, ')
          ..write('translation: $translation, ')
          ..write('level: $level, ')
          ..write('grammarTopic: $grammarTopic, ')
          ..write('deckId: $deckId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      incompleteSentence,
      wordOptions,
      correctAnswer,
      completeSentence,
      translation,
      level,
      grammarTopic,
      deckId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SentenceCardData &&
          other.id == this.id &&
          other.incompleteSentence == this.incompleteSentence &&
          other.wordOptions == this.wordOptions &&
          other.correctAnswer == this.correctAnswer &&
          other.completeSentence == this.completeSentence &&
          other.translation == this.translation &&
          other.level == this.level &&
          other.grammarTopic == this.grammarTopic &&
          other.deckId == this.deckId);
}

class SentenceCardsCompanion extends UpdateCompanion<SentenceCardData> {
  final Value<String> id;
  final Value<String> incompleteSentence;
  final Value<String> wordOptions;
  final Value<String> correctAnswer;
  final Value<String> completeSentence;
  final Value<String> translation;
  final Value<String> level;
  final Value<String> grammarTopic;
  final Value<String> deckId;
  final Value<int> rowid;
  const SentenceCardsCompanion({
    this.id = const Value.absent(),
    this.incompleteSentence = const Value.absent(),
    this.wordOptions = const Value.absent(),
    this.correctAnswer = const Value.absent(),
    this.completeSentence = const Value.absent(),
    this.translation = const Value.absent(),
    this.level = const Value.absent(),
    this.grammarTopic = const Value.absent(),
    this.deckId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SentenceCardsCompanion.insert({
    required String id,
    required String incompleteSentence,
    required String wordOptions,
    required String correctAnswer,
    required String completeSentence,
    required String translation,
    required String level,
    required String grammarTopic,
    required String deckId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        incompleteSentence = Value(incompleteSentence),
        wordOptions = Value(wordOptions),
        correctAnswer = Value(correctAnswer),
        completeSentence = Value(completeSentence),
        translation = Value(translation),
        level = Value(level),
        grammarTopic = Value(grammarTopic),
        deckId = Value(deckId);
  static Insertable<SentenceCardData> custom({
    Expression<String>? id,
    Expression<String>? incompleteSentence,
    Expression<String>? wordOptions,
    Expression<String>? correctAnswer,
    Expression<String>? completeSentence,
    Expression<String>? translation,
    Expression<String>? level,
    Expression<String>? grammarTopic,
    Expression<String>? deckId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (incompleteSentence != null) 'incomplete_sentence': incompleteSentence,
      if (wordOptions != null) 'word_options': wordOptions,
      if (correctAnswer != null) 'correct_answer': correctAnswer,
      if (completeSentence != null) 'complete_sentence': completeSentence,
      if (translation != null) 'translation': translation,
      if (level != null) 'level': level,
      if (grammarTopic != null) 'grammar_topic': grammarTopic,
      if (deckId != null) 'deck_id': deckId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SentenceCardsCompanion copyWith(
      {Value<String>? id,
      Value<String>? incompleteSentence,
      Value<String>? wordOptions,
      Value<String>? correctAnswer,
      Value<String>? completeSentence,
      Value<String>? translation,
      Value<String>? level,
      Value<String>? grammarTopic,
      Value<String>? deckId,
      Value<int>? rowid}) {
    return SentenceCardsCompanion(
      id: id ?? this.id,
      incompleteSentence: incompleteSentence ?? this.incompleteSentence,
      wordOptions: wordOptions ?? this.wordOptions,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      completeSentence: completeSentence ?? this.completeSentence,
      translation: translation ?? this.translation,
      level: level ?? this.level,
      grammarTopic: grammarTopic ?? this.grammarTopic,
      deckId: deckId ?? this.deckId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (incompleteSentence.present) {
      map['incomplete_sentence'] = Variable<String>(incompleteSentence.value);
    }
    if (wordOptions.present) {
      map['word_options'] = Variable<String>(wordOptions.value);
    }
    if (correctAnswer.present) {
      map['correct_answer'] = Variable<String>(correctAnswer.value);
    }
    if (completeSentence.present) {
      map['complete_sentence'] = Variable<String>(completeSentence.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (grammarTopic.present) {
      map['grammar_topic'] = Variable<String>(grammarTopic.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<String>(deckId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SentenceCardsCompanion(')
          ..write('id: $id, ')
          ..write('incompleteSentence: $incompleteSentence, ')
          ..write('wordOptions: $wordOptions, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('completeSentence: $completeSentence, ')
          ..write('translation: $translation, ')
          ..write('level: $level, ')
          ..write('grammarTopic: $grammarTopic, ')
          ..write('deckId: $deckId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningSessionsTable extends LearningSessions
    with TableInfo<$LearningSessionsTable, LearningSessionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  @override
  late final GeneratedColumn<String> deckId = GeneratedColumn<String>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cardsMeta = const VerificationMeta('cards');
  @override
  late final GeneratedColumn<String> cards = GeneratedColumn<String>(
      'cards', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cardsStudiedMeta =
      const VerificationMeta('cardsStudied');
  @override
  late final GeneratedColumn<int> cardsStudied = GeneratedColumn<int>(
      'cards_studied', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _correctAnswersMeta =
      const VerificationMeta('correctAnswers');
  @override
  late final GeneratedColumn<int> correctAnswers = GeneratedColumn<int>(
      'correct_answers', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _xpEarnedMeta =
      const VerificationMeta('xpEarned');
  @override
  late final GeneratedColumn<int> xpEarned = GeneratedColumn<int>(
      'xp_earned', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        deckId,
        userId,
        startedAt,
        completedAt,
        cards,
        cardsStudied,
        correctAnswers,
        xpEarned,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_sessions';
  @override
  VerificationContext validateIntegrity(
      Insertable<LearningSessionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('cards')) {
      context.handle(
          _cardsMeta, cards.isAcceptableOrUnknown(data['cards']!, _cardsMeta));
    } else if (isInserting) {
      context.missing(_cardsMeta);
    }
    if (data.containsKey('cards_studied')) {
      context.handle(
          _cardsStudiedMeta,
          cardsStudied.isAcceptableOrUnknown(
              data['cards_studied']!, _cardsStudiedMeta));
    }
    if (data.containsKey('correct_answers')) {
      context.handle(
          _correctAnswersMeta,
          correctAnswers.isAcceptableOrUnknown(
              data['correct_answers']!, _correctAnswersMeta));
    }
    if (data.containsKey('xp_earned')) {
      context.handle(_xpEarnedMeta,
          xpEarned.isAcceptableOrUnknown(data['xp_earned']!, _xpEarnedMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningSessionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningSessionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      cards: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cards'])!,
      cardsStudied: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cards_studied'])!,
      correctAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_answers'])!,
      xpEarned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}xp_earned'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $LearningSessionsTable createAlias(String alias) {
    return $LearningSessionsTable(attachedDatabase, alias);
  }
}

class LearningSessionData extends DataClass
    implements Insertable<LearningSessionData> {
  final String id;
  final String deckId;
  final String userId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String cards;
  final int cardsStudied;
  final int correctAnswers;
  final int xpEarned;
  final String status;
  const LearningSessionData(
      {required this.id,
      required this.deckId,
      required this.userId,
      required this.startedAt,
      this.completedAt,
      required this.cards,
      required this.cardsStudied,
      required this.correctAnswers,
      required this.xpEarned,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['deck_id'] = Variable<String>(deckId);
    map['user_id'] = Variable<String>(userId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['cards'] = Variable<String>(cards);
    map['cards_studied'] = Variable<int>(cardsStudied);
    map['correct_answers'] = Variable<int>(correctAnswers);
    map['xp_earned'] = Variable<int>(xpEarned);
    map['status'] = Variable<String>(status);
    return map;
  }

  LearningSessionsCompanion toCompanion(bool nullToAbsent) {
    return LearningSessionsCompanion(
      id: Value(id),
      deckId: Value(deckId),
      userId: Value(userId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      cards: Value(cards),
      cardsStudied: Value(cardsStudied),
      correctAnswers: Value(correctAnswers),
      xpEarned: Value(xpEarned),
      status: Value(status),
    );
  }

  factory LearningSessionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningSessionData(
      id: serializer.fromJson<String>(json['id']),
      deckId: serializer.fromJson<String>(json['deckId']),
      userId: serializer.fromJson<String>(json['userId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      cards: serializer.fromJson<String>(json['cards']),
      cardsStudied: serializer.fromJson<int>(json['cardsStudied']),
      correctAnswers: serializer.fromJson<int>(json['correctAnswers']),
      xpEarned: serializer.fromJson<int>(json['xpEarned']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'deckId': serializer.toJson<String>(deckId),
      'userId': serializer.toJson<String>(userId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'cards': serializer.toJson<String>(cards),
      'cardsStudied': serializer.toJson<int>(cardsStudied),
      'correctAnswers': serializer.toJson<int>(correctAnswers),
      'xpEarned': serializer.toJson<int>(xpEarned),
      'status': serializer.toJson<String>(status),
    };
  }

  LearningSessionData copyWith(
          {String? id,
          String? deckId,
          String? userId,
          DateTime? startedAt,
          Value<DateTime?> completedAt = const Value.absent(),
          String? cards,
          int? cardsStudied,
          int? correctAnswers,
          int? xpEarned,
          String? status}) =>
      LearningSessionData(
        id: id ?? this.id,
        deckId: deckId ?? this.deckId,
        userId: userId ?? this.userId,
        startedAt: startedAt ?? this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        cards: cards ?? this.cards,
        cardsStudied: cardsStudied ?? this.cardsStudied,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        xpEarned: xpEarned ?? this.xpEarned,
        status: status ?? this.status,
      );
  LearningSessionData copyWithCompanion(LearningSessionsCompanion data) {
    return LearningSessionData(
      id: data.id.present ? data.id.value : this.id,
      deckId: data.deckId.present ? data.deckId.value : this.deckId,
      userId: data.userId.present ? data.userId.value : this.userId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      cards: data.cards.present ? data.cards.value : this.cards,
      cardsStudied: data.cardsStudied.present
          ? data.cardsStudied.value
          : this.cardsStudied,
      correctAnswers: data.correctAnswers.present
          ? data.correctAnswers.value
          : this.correctAnswers,
      xpEarned: data.xpEarned.present ? data.xpEarned.value : this.xpEarned,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningSessionData(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('userId: $userId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('cards: $cards, ')
          ..write('cardsStudied: $cardsStudied, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('xpEarned: $xpEarned, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deckId, userId, startedAt, completedAt,
      cards, cardsStudied, correctAnswers, xpEarned, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningSessionData &&
          other.id == this.id &&
          other.deckId == this.deckId &&
          other.userId == this.userId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.cards == this.cards &&
          other.cardsStudied == this.cardsStudied &&
          other.correctAnswers == this.correctAnswers &&
          other.xpEarned == this.xpEarned &&
          other.status == this.status);
}

class LearningSessionsCompanion extends UpdateCompanion<LearningSessionData> {
  final Value<String> id;
  final Value<String> deckId;
  final Value<String> userId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String> cards;
  final Value<int> cardsStudied;
  final Value<int> correctAnswers;
  final Value<int> xpEarned;
  final Value<String> status;
  final Value<int> rowid;
  const LearningSessionsCompanion({
    this.id = const Value.absent(),
    this.deckId = const Value.absent(),
    this.userId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.cards = const Value.absent(),
    this.cardsStudied = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.xpEarned = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningSessionsCompanion.insert({
    required String id,
    required String deckId,
    required String userId,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    required String cards,
    this.cardsStudied = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.xpEarned = const Value.absent(),
    required String status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        deckId = Value(deckId),
        userId = Value(userId),
        startedAt = Value(startedAt),
        cards = Value(cards),
        status = Value(status);
  static Insertable<LearningSessionData> custom({
    Expression<String>? id,
    Expression<String>? deckId,
    Expression<String>? userId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? cards,
    Expression<int>? cardsStudied,
    Expression<int>? correctAnswers,
    Expression<int>? xpEarned,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deckId != null) 'deck_id': deckId,
      if (userId != null) 'user_id': userId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (cards != null) 'cards': cards,
      if (cardsStudied != null) 'cards_studied': cardsStudied,
      if (correctAnswers != null) 'correct_answers': correctAnswers,
      if (xpEarned != null) 'xp_earned': xpEarned,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? deckId,
      Value<String>? userId,
      Value<DateTime>? startedAt,
      Value<DateTime?>? completedAt,
      Value<String>? cards,
      Value<int>? cardsStudied,
      Value<int>? correctAnswers,
      Value<int>? xpEarned,
      Value<String>? status,
      Value<int>? rowid}) {
    return LearningSessionsCompanion(
      id: id ?? this.id,
      deckId: deckId ?? this.deckId,
      userId: userId ?? this.userId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      cards: cards ?? this.cards,
      cardsStudied: cardsStudied ?? this.cardsStudied,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      xpEarned: xpEarned ?? this.xpEarned,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<String>(deckId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (cards.present) {
      map['cards'] = Variable<String>(cards.value);
    }
    if (cardsStudied.present) {
      map['cards_studied'] = Variable<int>(cardsStudied.value);
    }
    if (correctAnswers.present) {
      map['correct_answers'] = Variable<int>(correctAnswers.value);
    }
    if (xpEarned.present) {
      map['xp_earned'] = Variable<int>(xpEarned.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningSessionsCompanion(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('userId: $userId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('cards: $cards, ')
          ..write('cardsStudied: $cardsStudied, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('xpEarned: $xpEarned, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _avatarUrlMeta =
      const VerificationMeta('avatarUrl');
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
      'avatar_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _joinedDateMeta =
      const VerificationMeta('joinedDate');
  @override
  late final GeneratedColumn<DateTime> joinedDate = GeneratedColumn<DateTime>(
      'joined_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _settingsMeta =
      const VerificationMeta('settings');
  @override
  late final GeneratedColumn<String> settings = GeneratedColumn<String>(
      'settings', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _learningPrefsMeta =
      const VerificationMeta('learningPrefs');
  @override
  late final GeneratedColumn<String> learningPrefs = GeneratedColumn<String>(
      'learning_prefs', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, name, email, avatarUrl, joinedDate, settings, learningPrefs];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('avatar_url')) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta));
    }
    if (data.containsKey('joined_date')) {
      context.handle(
          _joinedDateMeta,
          joinedDate.isAcceptableOrUnknown(
              data['joined_date']!, _joinedDateMeta));
    } else if (isInserting) {
      context.missing(_joinedDateMeta);
    }
    if (data.containsKey('settings')) {
      context.handle(_settingsMeta,
          settings.isAcceptableOrUnknown(data['settings']!, _settingsMeta));
    } else if (isInserting) {
      context.missing(_settingsMeta);
    }
    if (data.containsKey('learning_prefs')) {
      context.handle(
          _learningPrefsMeta,
          learningPrefs.isAcceptableOrUnknown(
              data['learning_prefs']!, _learningPrefsMeta));
    } else if (isInserting) {
      context.missing(_learningPrefsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      avatarUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar_url']),
      joinedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}joined_date'])!,
      settings: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings'])!,
      learningPrefs: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}learning_prefs'])!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfileData extends DataClass implements Insertable<UserProfileData> {
  final String id;
  final String userId;
  final String name;
  final String? email;
  final String? avatarUrl;
  final DateTime joinedDate;
  final String settings;
  final String learningPrefs;
  const UserProfileData(
      {required this.id,
      required this.userId,
      required this.name,
      this.email,
      this.avatarUrl,
      required this.joinedDate,
      required this.settings,
      required this.learningPrefs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || avatarUrl != null) {
      map['avatar_url'] = Variable<String>(avatarUrl);
    }
    map['joined_date'] = Variable<DateTime>(joinedDate);
    map['settings'] = Variable<String>(settings);
    map['learning_prefs'] = Variable<String>(learningPrefs);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
      joinedDate: Value(joinedDate),
      settings: Value(settings),
      learningPrefs: Value(learningPrefs),
    );
  }

  factory UserProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      avatarUrl: serializer.fromJson<String?>(json['avatarUrl']),
      joinedDate: serializer.fromJson<DateTime>(json['joinedDate']),
      settings: serializer.fromJson<String>(json['settings']),
      learningPrefs: serializer.fromJson<String>(json['learningPrefs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'avatarUrl': serializer.toJson<String?>(avatarUrl),
      'joinedDate': serializer.toJson<DateTime>(joinedDate),
      'settings': serializer.toJson<String>(settings),
      'learningPrefs': serializer.toJson<String>(learningPrefs),
    };
  }

  UserProfileData copyWith(
          {String? id,
          String? userId,
          String? name,
          Value<String?> email = const Value.absent(),
          Value<String?> avatarUrl = const Value.absent(),
          DateTime? joinedDate,
          String? settings,
          String? learningPrefs}) =>
      UserProfileData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        email: email.present ? email.value : this.email,
        avatarUrl: avatarUrl.present ? avatarUrl.value : this.avatarUrl,
        joinedDate: joinedDate ?? this.joinedDate,
        settings: settings ?? this.settings,
        learningPrefs: learningPrefs ?? this.learningPrefs,
      );
  UserProfileData copyWithCompanion(UserProfilesCompanion data) {
    return UserProfileData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      avatarUrl: data.avatarUrl.present ? data.avatarUrl.value : this.avatarUrl,
      joinedDate:
          data.joinedDate.present ? data.joinedDate.value : this.joinedDate,
      settings: data.settings.present ? data.settings.value : this.settings,
      learningPrefs: data.learningPrefs.present
          ? data.learningPrefs.value
          : this.learningPrefs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('joinedDate: $joinedDate, ')
          ..write('settings: $settings, ')
          ..write('learningPrefs: $learningPrefs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, userId, name, email, avatarUrl, joinedDate, settings, learningPrefs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.email == this.email &&
          other.avatarUrl == this.avatarUrl &&
          other.joinedDate == this.joinedDate &&
          other.settings == this.settings &&
          other.learningPrefs == this.learningPrefs);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfileData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> avatarUrl;
  final Value<DateTime> joinedDate;
  final Value<String> settings;
  final Value<String> learningPrefs;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.joinedDate = const Value.absent(),
    this.settings = const Value.absent(),
    this.learningPrefs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String id,
    required String userId,
    required String name,
    this.email = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    required DateTime joinedDate,
    required String settings,
    required String learningPrefs,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        name = Value(name),
        joinedDate = Value(joinedDate),
        settings = Value(settings),
        learningPrefs = Value(learningPrefs);
  static Insertable<UserProfileData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? avatarUrl,
    Expression<DateTime>? joinedDate,
    Expression<String>? settings,
    Expression<String>? learningPrefs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (joinedDate != null) 'joined_date': joinedDate,
      if (settings != null) 'settings': settings,
      if (learningPrefs != null) 'learning_prefs': learningPrefs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? name,
      Value<String?>? email,
      Value<String?>? avatarUrl,
      Value<DateTime>? joinedDate,
      Value<String>? settings,
      Value<String>? learningPrefs,
      Value<int>? rowid}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      joinedDate: joinedDate ?? this.joinedDate,
      settings: settings ?? this.settings,
      learningPrefs: learningPrefs ?? this.learningPrefs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    if (joinedDate.present) {
      map['joined_date'] = Variable<DateTime>(joinedDate.value);
    }
    if (settings.present) {
      map['settings'] = Variable<String>(settings.value);
    }
    if (learningPrefs.present) {
      map['learning_prefs'] = Variable<String>(learningPrefs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('joinedDate: $joinedDate, ')
          ..write('settings: $settings, ')
          ..write('learningPrefs: $learningPrefs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $XpHistoryTable extends XpHistory
    with TableInfo<$XpHistoryTable, XpHistoryEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $XpHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, amount, source, timestamp, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'xp_history';
  @override
  VerificationContext validateIntegrity(Insertable<XpHistoryEntryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  XpHistoryEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return XpHistoryEntryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $XpHistoryTable createAlias(String alias) {
    return $XpHistoryTable(attachedDatabase, alias);
  }
}

class XpHistoryEntryData extends DataClass
    implements Insertable<XpHistoryEntryData> {
  final int id;
  final String userId;
  final int amount;
  final String source;
  final DateTime timestamp;
  final String? description;
  const XpHistoryEntryData(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.source,
      required this.timestamp,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['amount'] = Variable<int>(amount);
    map['source'] = Variable<String>(source);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  XpHistoryCompanion toCompanion(bool nullToAbsent) {
    return XpHistoryCompanion(
      id: Value(id),
      userId: Value(userId),
      amount: Value(amount),
      source: Value(source),
      timestamp: Value(timestamp),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory XpHistoryEntryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return XpHistoryEntryData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      amount: serializer.fromJson<int>(json['amount']),
      source: serializer.fromJson<String>(json['source']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'amount': serializer.toJson<int>(amount),
      'source': serializer.toJson<String>(source),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'description': serializer.toJson<String?>(description),
    };
  }

  XpHistoryEntryData copyWith(
          {int? id,
          String? userId,
          int? amount,
          String? source,
          DateTime? timestamp,
          Value<String?> description = const Value.absent()}) =>
      XpHistoryEntryData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        source: source ?? this.source,
        timestamp: timestamp ?? this.timestamp,
        description: description.present ? description.value : this.description,
      );
  XpHistoryEntryData copyWithCompanion(XpHistoryCompanion data) {
    return XpHistoryEntryData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      amount: data.amount.present ? data.amount.value : this.amount,
      source: data.source.present ? data.source.value : this.source,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('XpHistoryEntryData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('source: $source, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, amount, source, timestamp, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is XpHistoryEntryData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.amount == this.amount &&
          other.source == this.source &&
          other.timestamp == this.timestamp &&
          other.description == this.description);
}

class XpHistoryCompanion extends UpdateCompanion<XpHistoryEntryData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> amount;
  final Value<String> source;
  final Value<DateTime> timestamp;
  final Value<String?> description;
  const XpHistoryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.amount = const Value.absent(),
    this.source = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.description = const Value.absent(),
  });
  XpHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int amount,
    required String source,
    required DateTime timestamp,
    this.description = const Value.absent(),
  })  : userId = Value(userId),
        amount = Value(amount),
        source = Value(source),
        timestamp = Value(timestamp);
  static Insertable<XpHistoryEntryData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? amount,
    Expression<String>? source,
    Expression<DateTime>? timestamp,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (amount != null) 'amount': amount,
      if (source != null) 'source': source,
      if (timestamp != null) 'timestamp': timestamp,
      if (description != null) 'description': description,
    });
  }

  XpHistoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? amount,
      Value<String>? source,
      Value<DateTime>? timestamp,
      Value<String?>? description}) {
    return XpHistoryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      source: source ?? this.source,
      timestamp: timestamp ?? this.timestamp,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('XpHistoryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('source: $source, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $StreakDataTable extends StreakData
    with TableInfo<$StreakDataTable, StreakDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreakDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentStreakMeta =
      const VerificationMeta('currentStreak');
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
      'current_streak', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _longestStreakMeta =
      const VerificationMeta('longestStreak');
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
      'longest_streak', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastStudyDateMeta =
      const VerificationMeta('lastStudyDate');
  @override
  late final GeneratedColumn<DateTime> lastStudyDate =
      GeneratedColumn<DateTime>('last_study_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _studiedTodayMeta =
      const VerificationMeta('studiedToday');
  @override
  late final GeneratedColumn<bool> studiedToday = GeneratedColumn<bool>(
      'studied_today', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("studied_today" IN (0, 1))'));
  static const VerificationMeta _studyDatesMeta =
      const VerificationMeta('studyDates');
  @override
  late final GeneratedColumn<String> studyDates = GeneratedColumn<String>(
      'study_dates', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastMilestoneMeta =
      const VerificationMeta('lastMilestone');
  @override
  late final GeneratedColumn<String> lastMilestone = GeneratedColumn<String>(
      'last_milestone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        currentStreak,
        longestStreak,
        lastStudyDate,
        studiedToday,
        studyDates,
        lastMilestone
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streak_data';
  @override
  VerificationContext validateIntegrity(Insertable<StreakDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('current_streak')) {
      context.handle(
          _currentStreakMeta,
          currentStreak.isAcceptableOrUnknown(
              data['current_streak']!, _currentStreakMeta));
    } else if (isInserting) {
      context.missing(_currentStreakMeta);
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
          _longestStreakMeta,
          longestStreak.isAcceptableOrUnknown(
              data['longest_streak']!, _longestStreakMeta));
    } else if (isInserting) {
      context.missing(_longestStreakMeta);
    }
    if (data.containsKey('last_study_date')) {
      context.handle(
          _lastStudyDateMeta,
          lastStudyDate.isAcceptableOrUnknown(
              data['last_study_date']!, _lastStudyDateMeta));
    } else if (isInserting) {
      context.missing(_lastStudyDateMeta);
    }
    if (data.containsKey('studied_today')) {
      context.handle(
          _studiedTodayMeta,
          studiedToday.isAcceptableOrUnknown(
              data['studied_today']!, _studiedTodayMeta));
    } else if (isInserting) {
      context.missing(_studiedTodayMeta);
    }
    if (data.containsKey('study_dates')) {
      context.handle(
          _studyDatesMeta,
          studyDates.isAcceptableOrUnknown(
              data['study_dates']!, _studyDatesMeta));
    } else if (isInserting) {
      context.missing(_studyDatesMeta);
    }
    if (data.containsKey('last_milestone')) {
      context.handle(
          _lastMilestoneMeta,
          lastMilestone.isAcceptableOrUnknown(
              data['last_milestone']!, _lastMilestoneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StreakDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StreakDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      currentStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_streak'])!,
      longestStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}longest_streak'])!,
      lastStudyDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_study_date'])!,
      studiedToday: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}studied_today'])!,
      studyDates: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}study_dates'])!,
      lastMilestone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_milestone']),
    );
  }

  @override
  $StreakDataTable createAlias(String alias) {
    return $StreakDataTable(attachedDatabase, alias);
  }
}

class StreakDataData extends DataClass implements Insertable<StreakDataData> {
  final int id;
  final String userId;
  final int currentStreak;
  final int longestStreak;
  final DateTime lastStudyDate;
  final bool studiedToday;
  final String studyDates;
  final String? lastMilestone;
  const StreakDataData(
      {required this.id,
      required this.userId,
      required this.currentStreak,
      required this.longestStreak,
      required this.lastStudyDate,
      required this.studiedToday,
      required this.studyDates,
      this.lastMilestone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    map['last_study_date'] = Variable<DateTime>(lastStudyDate);
    map['studied_today'] = Variable<bool>(studiedToday);
    map['study_dates'] = Variable<String>(studyDates);
    if (!nullToAbsent || lastMilestone != null) {
      map['last_milestone'] = Variable<String>(lastMilestone);
    }
    return map;
  }

  StreakDataCompanion toCompanion(bool nullToAbsent) {
    return StreakDataCompanion(
      id: Value(id),
      userId: Value(userId),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      lastStudyDate: Value(lastStudyDate),
      studiedToday: Value(studiedToday),
      studyDates: Value(studyDates),
      lastMilestone: lastMilestone == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMilestone),
    );
  }

  factory StreakDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StreakDataData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      lastStudyDate: serializer.fromJson<DateTime>(json['lastStudyDate']),
      studiedToday: serializer.fromJson<bool>(json['studiedToday']),
      studyDates: serializer.fromJson<String>(json['studyDates']),
      lastMilestone: serializer.fromJson<String?>(json['lastMilestone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'lastStudyDate': serializer.toJson<DateTime>(lastStudyDate),
      'studiedToday': serializer.toJson<bool>(studiedToday),
      'studyDates': serializer.toJson<String>(studyDates),
      'lastMilestone': serializer.toJson<String?>(lastMilestone),
    };
  }

  StreakDataData copyWith(
          {int? id,
          String? userId,
          int? currentStreak,
          int? longestStreak,
          DateTime? lastStudyDate,
          bool? studiedToday,
          String? studyDates,
          Value<String?> lastMilestone = const Value.absent()}) =>
      StreakDataData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        currentStreak: currentStreak ?? this.currentStreak,
        longestStreak: longestStreak ?? this.longestStreak,
        lastStudyDate: lastStudyDate ?? this.lastStudyDate,
        studiedToday: studiedToday ?? this.studiedToday,
        studyDates: studyDates ?? this.studyDates,
        lastMilestone:
            lastMilestone.present ? lastMilestone.value : this.lastMilestone,
      );
  StreakDataData copyWithCompanion(StreakDataCompanion data) {
    return StreakDataData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      lastStudyDate: data.lastStudyDate.present
          ? data.lastStudyDate.value
          : this.lastStudyDate,
      studiedToday: data.studiedToday.present
          ? data.studiedToday.value
          : this.studiedToday,
      studyDates:
          data.studyDates.present ? data.studyDates.value : this.studyDates,
      lastMilestone: data.lastMilestone.present
          ? data.lastMilestone.value
          : this.lastMilestone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StreakDataData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastStudyDate: $lastStudyDate, ')
          ..write('studiedToday: $studiedToday, ')
          ..write('studyDates: $studyDates, ')
          ..write('lastMilestone: $lastMilestone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, currentStreak, longestStreak,
      lastStudyDate, studiedToday, studyDates, lastMilestone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StreakDataData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.lastStudyDate == this.lastStudyDate &&
          other.studiedToday == this.studiedToday &&
          other.studyDates == this.studyDates &&
          other.lastMilestone == this.lastMilestone);
}

class StreakDataCompanion extends UpdateCompanion<StreakDataData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime> lastStudyDate;
  final Value<bool> studiedToday;
  final Value<String> studyDates;
  final Value<String?> lastMilestone;
  const StreakDataCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastStudyDate = const Value.absent(),
    this.studiedToday = const Value.absent(),
    this.studyDates = const Value.absent(),
    this.lastMilestone = const Value.absent(),
  });
  StreakDataCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int currentStreak,
    required int longestStreak,
    required DateTime lastStudyDate,
    required bool studiedToday,
    required String studyDates,
    this.lastMilestone = const Value.absent(),
  })  : userId = Value(userId),
        currentStreak = Value(currentStreak),
        longestStreak = Value(longestStreak),
        lastStudyDate = Value(lastStudyDate),
        studiedToday = Value(studiedToday),
        studyDates = Value(studyDates);
  static Insertable<StreakDataData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? lastStudyDate,
    Expression<bool>? studiedToday,
    Expression<String>? studyDates,
    Expression<String>? lastMilestone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (lastStudyDate != null) 'last_study_date': lastStudyDate,
      if (studiedToday != null) 'studied_today': studiedToday,
      if (studyDates != null) 'study_dates': studyDates,
      if (lastMilestone != null) 'last_milestone': lastMilestone,
    });
  }

  StreakDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? currentStreak,
      Value<int>? longestStreak,
      Value<DateTime>? lastStudyDate,
      Value<bool>? studiedToday,
      Value<String>? studyDates,
      Value<String?>? lastMilestone}) {
    return StreakDataCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastStudyDate: lastStudyDate ?? this.lastStudyDate,
      studiedToday: studiedToday ?? this.studiedToday,
      studyDates: studyDates ?? this.studyDates,
      lastMilestone: lastMilestone ?? this.lastMilestone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (lastStudyDate.present) {
      map['last_study_date'] = Variable<DateTime>(lastStudyDate.value);
    }
    if (studiedToday.present) {
      map['studied_today'] = Variable<bool>(studiedToday.value);
    }
    if (studyDates.present) {
      map['study_dates'] = Variable<String>(studyDates.value);
    }
    if (lastMilestone.present) {
      map['last_milestone'] = Variable<String>(lastMilestone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreakDataCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastStudyDate: $lastStudyDate, ')
          ..write('studiedToday: $studiedToday, ')
          ..write('studyDates: $studyDates, ')
          ..write('lastMilestone: $lastMilestone')
          ..write(')'))
        .toString();
  }
}

class $TestsTable extends Tests with TableInfo<$TestsTable, TestData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionsMeta =
      const VerificationMeta('questions');
  @override
  late final GeneratedColumn<String> questions = GeneratedColumn<String>(
      'questions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _minPassingScoreMeta =
      const VerificationMeta('minPassingScore');
  @override
  late final GeneratedColumn<int> minPassingScore = GeneratedColumn<int>(
      'min_passing_score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, questions, duration, category, minPassingScore];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tests';
  @override
  VerificationContext validateIntegrity(Insertable<TestData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('questions')) {
      context.handle(_questionsMeta,
          questions.isAcceptableOrUnknown(data['questions']!, _questionsMeta));
    } else if (isInserting) {
      context.missing(_questionsMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('min_passing_score')) {
      context.handle(
          _minPassingScoreMeta,
          minPassingScore.isAcceptableOrUnknown(
              data['min_passing_score']!, _minPassingScoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      questions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}questions'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      minPassingScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_passing_score']),
    );
  }

  @override
  $TestsTable createAlias(String alias) {
    return $TestsTable(attachedDatabase, alias);
  }
}

class TestData extends DataClass implements Insertable<TestData> {
  final String id;
  final String title;
  final String description;
  final String questions;
  final int duration;
  final String category;
  final int? minPassingScore;
  const TestData(
      {required this.id,
      required this.title,
      required this.description,
      required this.questions,
      required this.duration,
      required this.category,
      this.minPassingScore});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['questions'] = Variable<String>(questions);
    map['duration'] = Variable<int>(duration);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || minPassingScore != null) {
      map['min_passing_score'] = Variable<int>(minPassingScore);
    }
    return map;
  }

  TestsCompanion toCompanion(bool nullToAbsent) {
    return TestsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      questions: Value(questions),
      duration: Value(duration),
      category: Value(category),
      minPassingScore: minPassingScore == null && nullToAbsent
          ? const Value.absent()
          : Value(minPassingScore),
    );
  }

  factory TestData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      questions: serializer.fromJson<String>(json['questions']),
      duration: serializer.fromJson<int>(json['duration']),
      category: serializer.fromJson<String>(json['category']),
      minPassingScore: serializer.fromJson<int?>(json['minPassingScore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'questions': serializer.toJson<String>(questions),
      'duration': serializer.toJson<int>(duration),
      'category': serializer.toJson<String>(category),
      'minPassingScore': serializer.toJson<int?>(minPassingScore),
    };
  }

  TestData copyWith(
          {String? id,
          String? title,
          String? description,
          String? questions,
          int? duration,
          String? category,
          Value<int?> minPassingScore = const Value.absent()}) =>
      TestData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        questions: questions ?? this.questions,
        duration: duration ?? this.duration,
        category: category ?? this.category,
        minPassingScore: minPassingScore.present
            ? minPassingScore.value
            : this.minPassingScore,
      );
  TestData copyWithCompanion(TestsCompanion data) {
    return TestData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      questions: data.questions.present ? data.questions.value : this.questions,
      duration: data.duration.present ? data.duration.value : this.duration,
      category: data.category.present ? data.category.value : this.category,
      minPassingScore: data.minPassingScore.present
          ? data.minPassingScore.value
          : this.minPassingScore,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('questions: $questions, ')
          ..write('duration: $duration, ')
          ..write('category: $category, ')
          ..write('minPassingScore: $minPassingScore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, questions, duration, category, minPassingScore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.questions == this.questions &&
          other.duration == this.duration &&
          other.category == this.category &&
          other.minPassingScore == this.minPassingScore);
}

class TestsCompanion extends UpdateCompanion<TestData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> questions;
  final Value<int> duration;
  final Value<String> category;
  final Value<int?> minPassingScore;
  final Value<int> rowid;
  const TestsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.questions = const Value.absent(),
    this.duration = const Value.absent(),
    this.category = const Value.absent(),
    this.minPassingScore = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestsCompanion.insert({
    required String id,
    required String title,
    required String description,
    required String questions,
    required int duration,
    required String category,
    this.minPassingScore = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        questions = Value(questions),
        duration = Value(duration),
        category = Value(category);
  static Insertable<TestData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? questions,
    Expression<int>? duration,
    Expression<String>? category,
    Expression<int>? minPassingScore,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (questions != null) 'questions': questions,
      if (duration != null) 'duration': duration,
      if (category != null) 'category': category,
      if (minPassingScore != null) 'min_passing_score': minPassingScore,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? questions,
      Value<int>? duration,
      Value<String>? category,
      Value<int?>? minPassingScore,
      Value<int>? rowid}) {
    return TestsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      questions: questions ?? this.questions,
      duration: duration ?? this.duration,
      category: category ?? this.category,
      minPassingScore: minPassingScore ?? this.minPassingScore,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (questions.present) {
      map['questions'] = Variable<String>(questions.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (minPassingScore.present) {
      map['min_passing_score'] = Variable<int>(minPassingScore.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('questions: $questions, ')
          ..write('duration: $duration, ')
          ..write('category: $category, ')
          ..write('minPassingScore: $minPassingScore, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestSessionsTable extends TestSessions
    with TableInfo<$TestSessionsTable, TestSessionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _testIdMeta = const VerificationMeta('testId');
  @override
  late final GeneratedColumn<String> testId = GeneratedColumn<String>(
      'test_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userAnswersMeta =
      const VerificationMeta('userAnswers');
  @override
  late final GeneratedColumn<String> userAnswers = GeneratedColumn<String>(
      'user_answers', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentQuestionIndexMeta =
      const VerificationMeta('currentQuestionIndex');
  @override
  late final GeneratedColumn<int> currentQuestionIndex = GeneratedColumn<int>(
      'current_question_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _timeLeftMeta =
      const VerificationMeta('timeLeft');
  @override
  late final GeneratedColumn<int> timeLeft = GeneratedColumn<int>(
      'time_left', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _timeElapsedMeta =
      const VerificationMeta('timeElapsed');
  @override
  late final GeneratedColumn<int> timeElapsed = GeneratedColumn<int>(
      'time_elapsed', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isCompleteMeta =
      const VerificationMeta('isComplete');
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
      'is_complete', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_complete" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isPassedMeta =
      const VerificationMeta('isPassed');
  @override
  late final GeneratedColumn<bool> isPassed = GeneratedColumn<bool>(
      'is_passed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_passed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        testId,
        userId,
        userAnswers,
        currentQuestionIndex,
        startTime,
        timeLeft,
        timeElapsed,
        isComplete,
        completedAt,
        score,
        isPassed
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<TestSessionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('test_id')) {
      context.handle(_testIdMeta,
          testId.isAcceptableOrUnknown(data['test_id']!, _testIdMeta));
    } else if (isInserting) {
      context.missing(_testIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_answers')) {
      context.handle(
          _userAnswersMeta,
          userAnswers.isAcceptableOrUnknown(
              data['user_answers']!, _userAnswersMeta));
    } else if (isInserting) {
      context.missing(_userAnswersMeta);
    }
    if (data.containsKey('current_question_index')) {
      context.handle(
          _currentQuestionIndexMeta,
          currentQuestionIndex.isAcceptableOrUnknown(
              data['current_question_index']!, _currentQuestionIndexMeta));
    } else if (isInserting) {
      context.missing(_currentQuestionIndexMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('time_left')) {
      context.handle(_timeLeftMeta,
          timeLeft.isAcceptableOrUnknown(data['time_left']!, _timeLeftMeta));
    }
    if (data.containsKey('time_elapsed')) {
      context.handle(
          _timeElapsedMeta,
          timeElapsed.isAcceptableOrUnknown(
              data['time_elapsed']!, _timeElapsedMeta));
    }
    if (data.containsKey('is_complete')) {
      context.handle(
          _isCompleteMeta,
          isComplete.isAcceptableOrUnknown(
              data['is_complete']!, _isCompleteMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    if (data.containsKey('is_passed')) {
      context.handle(_isPassedMeta,
          isPassed.isAcceptableOrUnknown(data['is_passed']!, _isPassedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestSessionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestSessionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      testId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}test_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      userAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_answers'])!,
      currentQuestionIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_question_index'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      timeLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_left']),
      timeElapsed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_elapsed']),
      isComplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_complete'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score']),
      isPassed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_passed']),
    );
  }

  @override
  $TestSessionsTable createAlias(String alias) {
    return $TestSessionsTable(attachedDatabase, alias);
  }
}

class TestSessionData extends DataClass implements Insertable<TestSessionData> {
  final String id;
  final String testId;
  final String userId;
  final String userAnswers;
  final int currentQuestionIndex;
  final DateTime? startTime;
  final int? timeLeft;
  final int? timeElapsed;
  final bool isComplete;
  final DateTime? completedAt;
  final int? score;
  final bool? isPassed;
  const TestSessionData(
      {required this.id,
      required this.testId,
      required this.userId,
      required this.userAnswers,
      required this.currentQuestionIndex,
      this.startTime,
      this.timeLeft,
      this.timeElapsed,
      required this.isComplete,
      this.completedAt,
      this.score,
      this.isPassed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['test_id'] = Variable<String>(testId);
    map['user_id'] = Variable<String>(userId);
    map['user_answers'] = Variable<String>(userAnswers);
    map['current_question_index'] = Variable<int>(currentQuestionIndex);
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || timeLeft != null) {
      map['time_left'] = Variable<int>(timeLeft);
    }
    if (!nullToAbsent || timeElapsed != null) {
      map['time_elapsed'] = Variable<int>(timeElapsed);
    }
    map['is_complete'] = Variable<bool>(isComplete);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    if (!nullToAbsent || isPassed != null) {
      map['is_passed'] = Variable<bool>(isPassed);
    }
    return map;
  }

  TestSessionsCompanion toCompanion(bool nullToAbsent) {
    return TestSessionsCompanion(
      id: Value(id),
      testId: Value(testId),
      userId: Value(userId),
      userAnswers: Value(userAnswers),
      currentQuestionIndex: Value(currentQuestionIndex),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      timeLeft: timeLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(timeLeft),
      timeElapsed: timeElapsed == null && nullToAbsent
          ? const Value.absent()
          : Value(timeElapsed),
      isComplete: Value(isComplete),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
      isPassed: isPassed == null && nullToAbsent
          ? const Value.absent()
          : Value(isPassed),
    );
  }

  factory TestSessionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestSessionData(
      id: serializer.fromJson<String>(json['id']),
      testId: serializer.fromJson<String>(json['testId']),
      userId: serializer.fromJson<String>(json['userId']),
      userAnswers: serializer.fromJson<String>(json['userAnswers']),
      currentQuestionIndex:
          serializer.fromJson<int>(json['currentQuestionIndex']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      timeLeft: serializer.fromJson<int?>(json['timeLeft']),
      timeElapsed: serializer.fromJson<int?>(json['timeElapsed']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      score: serializer.fromJson<int?>(json['score']),
      isPassed: serializer.fromJson<bool?>(json['isPassed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'testId': serializer.toJson<String>(testId),
      'userId': serializer.toJson<String>(userId),
      'userAnswers': serializer.toJson<String>(userAnswers),
      'currentQuestionIndex': serializer.toJson<int>(currentQuestionIndex),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'timeLeft': serializer.toJson<int?>(timeLeft),
      'timeElapsed': serializer.toJson<int?>(timeElapsed),
      'isComplete': serializer.toJson<bool>(isComplete),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'score': serializer.toJson<int?>(score),
      'isPassed': serializer.toJson<bool?>(isPassed),
    };
  }

  TestSessionData copyWith(
          {String? id,
          String? testId,
          String? userId,
          String? userAnswers,
          int? currentQuestionIndex,
          Value<DateTime?> startTime = const Value.absent(),
          Value<int?> timeLeft = const Value.absent(),
          Value<int?> timeElapsed = const Value.absent(),
          bool? isComplete,
          Value<DateTime?> completedAt = const Value.absent(),
          Value<int?> score = const Value.absent(),
          Value<bool?> isPassed = const Value.absent()}) =>
      TestSessionData(
        id: id ?? this.id,
        testId: testId ?? this.testId,
        userId: userId ?? this.userId,
        userAnswers: userAnswers ?? this.userAnswers,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        startTime: startTime.present ? startTime.value : this.startTime,
        timeLeft: timeLeft.present ? timeLeft.value : this.timeLeft,
        timeElapsed: timeElapsed.present ? timeElapsed.value : this.timeElapsed,
        isComplete: isComplete ?? this.isComplete,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        score: score.present ? score.value : this.score,
        isPassed: isPassed.present ? isPassed.value : this.isPassed,
      );
  TestSessionData copyWithCompanion(TestSessionsCompanion data) {
    return TestSessionData(
      id: data.id.present ? data.id.value : this.id,
      testId: data.testId.present ? data.testId.value : this.testId,
      userId: data.userId.present ? data.userId.value : this.userId,
      userAnswers:
          data.userAnswers.present ? data.userAnswers.value : this.userAnswers,
      currentQuestionIndex: data.currentQuestionIndex.present
          ? data.currentQuestionIndex.value
          : this.currentQuestionIndex,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      timeLeft: data.timeLeft.present ? data.timeLeft.value : this.timeLeft,
      timeElapsed:
          data.timeElapsed.present ? data.timeElapsed.value : this.timeElapsed,
      isComplete:
          data.isComplete.present ? data.isComplete.value : this.isComplete,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      score: data.score.present ? data.score.value : this.score,
      isPassed: data.isPassed.present ? data.isPassed.value : this.isPassed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestSessionData(')
          ..write('id: $id, ')
          ..write('testId: $testId, ')
          ..write('userId: $userId, ')
          ..write('userAnswers: $userAnswers, ')
          ..write('currentQuestionIndex: $currentQuestionIndex, ')
          ..write('startTime: $startTime, ')
          ..write('timeLeft: $timeLeft, ')
          ..write('timeElapsed: $timeElapsed, ')
          ..write('isComplete: $isComplete, ')
          ..write('completedAt: $completedAt, ')
          ..write('score: $score, ')
          ..write('isPassed: $isPassed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      testId,
      userId,
      userAnswers,
      currentQuestionIndex,
      startTime,
      timeLeft,
      timeElapsed,
      isComplete,
      completedAt,
      score,
      isPassed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestSessionData &&
          other.id == this.id &&
          other.testId == this.testId &&
          other.userId == this.userId &&
          other.userAnswers == this.userAnswers &&
          other.currentQuestionIndex == this.currentQuestionIndex &&
          other.startTime == this.startTime &&
          other.timeLeft == this.timeLeft &&
          other.timeElapsed == this.timeElapsed &&
          other.isComplete == this.isComplete &&
          other.completedAt == this.completedAt &&
          other.score == this.score &&
          other.isPassed == this.isPassed);
}

class TestSessionsCompanion extends UpdateCompanion<TestSessionData> {
  final Value<String> id;
  final Value<String> testId;
  final Value<String> userId;
  final Value<String> userAnswers;
  final Value<int> currentQuestionIndex;
  final Value<DateTime?> startTime;
  final Value<int?> timeLeft;
  final Value<int?> timeElapsed;
  final Value<bool> isComplete;
  final Value<DateTime?> completedAt;
  final Value<int?> score;
  final Value<bool?> isPassed;
  final Value<int> rowid;
  const TestSessionsCompanion({
    this.id = const Value.absent(),
    this.testId = const Value.absent(),
    this.userId = const Value.absent(),
    this.userAnswers = const Value.absent(),
    this.currentQuestionIndex = const Value.absent(),
    this.startTime = const Value.absent(),
    this.timeLeft = const Value.absent(),
    this.timeElapsed = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.score = const Value.absent(),
    this.isPassed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestSessionsCompanion.insert({
    required String id,
    required String testId,
    required String userId,
    required String userAnswers,
    required int currentQuestionIndex,
    this.startTime = const Value.absent(),
    this.timeLeft = const Value.absent(),
    this.timeElapsed = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.score = const Value.absent(),
    this.isPassed = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        testId = Value(testId),
        userId = Value(userId),
        userAnswers = Value(userAnswers),
        currentQuestionIndex = Value(currentQuestionIndex);
  static Insertable<TestSessionData> custom({
    Expression<String>? id,
    Expression<String>? testId,
    Expression<String>? userId,
    Expression<String>? userAnswers,
    Expression<int>? currentQuestionIndex,
    Expression<DateTime>? startTime,
    Expression<int>? timeLeft,
    Expression<int>? timeElapsed,
    Expression<bool>? isComplete,
    Expression<DateTime>? completedAt,
    Expression<int>? score,
    Expression<bool>? isPassed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testId != null) 'test_id': testId,
      if (userId != null) 'user_id': userId,
      if (userAnswers != null) 'user_answers': userAnswers,
      if (currentQuestionIndex != null)
        'current_question_index': currentQuestionIndex,
      if (startTime != null) 'start_time': startTime,
      if (timeLeft != null) 'time_left': timeLeft,
      if (timeElapsed != null) 'time_elapsed': timeElapsed,
      if (isComplete != null) 'is_complete': isComplete,
      if (completedAt != null) 'completed_at': completedAt,
      if (score != null) 'score': score,
      if (isPassed != null) 'is_passed': isPassed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? testId,
      Value<String>? userId,
      Value<String>? userAnswers,
      Value<int>? currentQuestionIndex,
      Value<DateTime?>? startTime,
      Value<int?>? timeLeft,
      Value<int?>? timeElapsed,
      Value<bool>? isComplete,
      Value<DateTime?>? completedAt,
      Value<int?>? score,
      Value<bool?>? isPassed,
      Value<int>? rowid}) {
    return TestSessionsCompanion(
      id: id ?? this.id,
      testId: testId ?? this.testId,
      userId: userId ?? this.userId,
      userAnswers: userAnswers ?? this.userAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      startTime: startTime ?? this.startTime,
      timeLeft: timeLeft ?? this.timeLeft,
      timeElapsed: timeElapsed ?? this.timeElapsed,
      isComplete: isComplete ?? this.isComplete,
      completedAt: completedAt ?? this.completedAt,
      score: score ?? this.score,
      isPassed: isPassed ?? this.isPassed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (testId.present) {
      map['test_id'] = Variable<String>(testId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userAnswers.present) {
      map['user_answers'] = Variable<String>(userAnswers.value);
    }
    if (currentQuestionIndex.present) {
      map['current_question_index'] = Variable<int>(currentQuestionIndex.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (timeLeft.present) {
      map['time_left'] = Variable<int>(timeLeft.value);
    }
    if (timeElapsed.present) {
      map['time_elapsed'] = Variable<int>(timeElapsed.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (isPassed.present) {
      map['is_passed'] = Variable<bool>(isPassed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestSessionsCompanion(')
          ..write('id: $id, ')
          ..write('testId: $testId, ')
          ..write('userId: $userId, ')
          ..write('userAnswers: $userAnswers, ')
          ..write('currentQuestionIndex: $currentQuestionIndex, ')
          ..write('startTime: $startTime, ')
          ..write('timeLeft: $timeLeft, ')
          ..write('timeElapsed: $timeElapsed, ')
          ..write('isComplete: $isComplete, ')
          ..write('completedAt: $completedAt, ')
          ..write('score: $score, ')
          ..write('isPassed: $isPassed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StatisticsTable extends Statistics
    with TableInfo<$StatisticsTable, StatisticsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatisticsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cardsLearnedMeta =
      const VerificationMeta('cardsLearned');
  @override
  late final GeneratedColumn<int> cardsLearned = GeneratedColumn<int>(
      'cards_learned', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _cardsReviewedMeta =
      const VerificationMeta('cardsReviewed');
  @override
  late final GeneratedColumn<int> cardsReviewed = GeneratedColumn<int>(
      'cards_reviewed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _testsTakenMeta =
      const VerificationMeta('testsTaken');
  @override
  late final GeneratedColumn<int> testsTaken = GeneratedColumn<int>(
      'tests_taken', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _averageScoreMeta =
      const VerificationMeta('averageScore');
  @override
  late final GeneratedColumn<double> averageScore = GeneratedColumn<double>(
      'average_score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _studyTimeMinutesMeta =
      const VerificationMeta('studyTimeMinutes');
  @override
  late final GeneratedColumn<int> studyTimeMinutes = GeneratedColumn<int>(
      'study_time_minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _xpEarnedMeta =
      const VerificationMeta('xpEarned');
  @override
  late final GeneratedColumn<int> xpEarned = GeneratedColumn<int>(
      'xp_earned', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _retentionCardsMeta =
      const VerificationMeta('retentionCards');
  @override
  late final GeneratedColumn<int> retentionCards = GeneratedColumn<int>(
      'retention_cards', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        date,
        cardsLearned,
        cardsReviewed,
        testsTaken,
        averageScore,
        studyTimeMinutes,
        xpEarned,
        retentionCards
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'statistics';
  @override
  VerificationContext validateIntegrity(Insertable<StatisticsData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('cards_learned')) {
      context.handle(
          _cardsLearnedMeta,
          cardsLearned.isAcceptableOrUnknown(
              data['cards_learned']!, _cardsLearnedMeta));
    }
    if (data.containsKey('cards_reviewed')) {
      context.handle(
          _cardsReviewedMeta,
          cardsReviewed.isAcceptableOrUnknown(
              data['cards_reviewed']!, _cardsReviewedMeta));
    }
    if (data.containsKey('tests_taken')) {
      context.handle(
          _testsTakenMeta,
          testsTaken.isAcceptableOrUnknown(
              data['tests_taken']!, _testsTakenMeta));
    }
    if (data.containsKey('average_score')) {
      context.handle(
          _averageScoreMeta,
          averageScore.isAcceptableOrUnknown(
              data['average_score']!, _averageScoreMeta));
    }
    if (data.containsKey('study_time_minutes')) {
      context.handle(
          _studyTimeMinutesMeta,
          studyTimeMinutes.isAcceptableOrUnknown(
              data['study_time_minutes']!, _studyTimeMinutesMeta));
    }
    if (data.containsKey('xp_earned')) {
      context.handle(_xpEarnedMeta,
          xpEarned.isAcceptableOrUnknown(data['xp_earned']!, _xpEarnedMeta));
    }
    if (data.containsKey('retention_cards')) {
      context.handle(
          _retentionCardsMeta,
          retentionCards.isAcceptableOrUnknown(
              data['retention_cards']!, _retentionCardsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatisticsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatisticsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      cardsLearned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cards_learned'])!,
      cardsReviewed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cards_reviewed'])!,
      testsTaken: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tests_taken'])!,
      averageScore: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}average_score'])!,
      studyTimeMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}study_time_minutes'])!,
      xpEarned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}xp_earned'])!,
      retentionCards: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retention_cards'])!,
    );
  }

  @override
  $StatisticsTable createAlias(String alias) {
    return $StatisticsTable(attachedDatabase, alias);
  }
}

class StatisticsData extends DataClass implements Insertable<StatisticsData> {
  final String id;
  final String userId;
  final DateTime date;
  final int cardsLearned;
  final int cardsReviewed;
  final int testsTaken;
  final double averageScore;
  final int studyTimeMinutes;
  final int xpEarned;
  final int retentionCards;
  const StatisticsData(
      {required this.id,
      required this.userId,
      required this.date,
      required this.cardsLearned,
      required this.cardsReviewed,
      required this.testsTaken,
      required this.averageScore,
      required this.studyTimeMinutes,
      required this.xpEarned,
      required this.retentionCards});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['date'] = Variable<DateTime>(date);
    map['cards_learned'] = Variable<int>(cardsLearned);
    map['cards_reviewed'] = Variable<int>(cardsReviewed);
    map['tests_taken'] = Variable<int>(testsTaken);
    map['average_score'] = Variable<double>(averageScore);
    map['study_time_minutes'] = Variable<int>(studyTimeMinutes);
    map['xp_earned'] = Variable<int>(xpEarned);
    map['retention_cards'] = Variable<int>(retentionCards);
    return map;
  }

  StatisticsCompanion toCompanion(bool nullToAbsent) {
    return StatisticsCompanion(
      id: Value(id),
      userId: Value(userId),
      date: Value(date),
      cardsLearned: Value(cardsLearned),
      cardsReviewed: Value(cardsReviewed),
      testsTaken: Value(testsTaken),
      averageScore: Value(averageScore),
      studyTimeMinutes: Value(studyTimeMinutes),
      xpEarned: Value(xpEarned),
      retentionCards: Value(retentionCards),
    );
  }

  factory StatisticsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatisticsData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
      cardsLearned: serializer.fromJson<int>(json['cardsLearned']),
      cardsReviewed: serializer.fromJson<int>(json['cardsReviewed']),
      testsTaken: serializer.fromJson<int>(json['testsTaken']),
      averageScore: serializer.fromJson<double>(json['averageScore']),
      studyTimeMinutes: serializer.fromJson<int>(json['studyTimeMinutes']),
      xpEarned: serializer.fromJson<int>(json['xpEarned']),
      retentionCards: serializer.fromJson<int>(json['retentionCards']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'date': serializer.toJson<DateTime>(date),
      'cardsLearned': serializer.toJson<int>(cardsLearned),
      'cardsReviewed': serializer.toJson<int>(cardsReviewed),
      'testsTaken': serializer.toJson<int>(testsTaken),
      'averageScore': serializer.toJson<double>(averageScore),
      'studyTimeMinutes': serializer.toJson<int>(studyTimeMinutes),
      'xpEarned': serializer.toJson<int>(xpEarned),
      'retentionCards': serializer.toJson<int>(retentionCards),
    };
  }

  StatisticsData copyWith(
          {String? id,
          String? userId,
          DateTime? date,
          int? cardsLearned,
          int? cardsReviewed,
          int? testsTaken,
          double? averageScore,
          int? studyTimeMinutes,
          int? xpEarned,
          int? retentionCards}) =>
      StatisticsData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        cardsLearned: cardsLearned ?? this.cardsLearned,
        cardsReviewed: cardsReviewed ?? this.cardsReviewed,
        testsTaken: testsTaken ?? this.testsTaken,
        averageScore: averageScore ?? this.averageScore,
        studyTimeMinutes: studyTimeMinutes ?? this.studyTimeMinutes,
        xpEarned: xpEarned ?? this.xpEarned,
        retentionCards: retentionCards ?? this.retentionCards,
      );
  StatisticsData copyWithCompanion(StatisticsCompanion data) {
    return StatisticsData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      cardsLearned: data.cardsLearned.present
          ? data.cardsLearned.value
          : this.cardsLearned,
      cardsReviewed: data.cardsReviewed.present
          ? data.cardsReviewed.value
          : this.cardsReviewed,
      testsTaken:
          data.testsTaken.present ? data.testsTaken.value : this.testsTaken,
      averageScore: data.averageScore.present
          ? data.averageScore.value
          : this.averageScore,
      studyTimeMinutes: data.studyTimeMinutes.present
          ? data.studyTimeMinutes.value
          : this.studyTimeMinutes,
      xpEarned: data.xpEarned.present ? data.xpEarned.value : this.xpEarned,
      retentionCards: data.retentionCards.present
          ? data.retentionCards.value
          : this.retentionCards,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatisticsData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('cardsLearned: $cardsLearned, ')
          ..write('cardsReviewed: $cardsReviewed, ')
          ..write('testsTaken: $testsTaken, ')
          ..write('averageScore: $averageScore, ')
          ..write('studyTimeMinutes: $studyTimeMinutes, ')
          ..write('xpEarned: $xpEarned, ')
          ..write('retentionCards: $retentionCards')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, date, cardsLearned, cardsReviewed,
      testsTaken, averageScore, studyTimeMinutes, xpEarned, retentionCards);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatisticsData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.cardsLearned == this.cardsLearned &&
          other.cardsReviewed == this.cardsReviewed &&
          other.testsTaken == this.testsTaken &&
          other.averageScore == this.averageScore &&
          other.studyTimeMinutes == this.studyTimeMinutes &&
          other.xpEarned == this.xpEarned &&
          other.retentionCards == this.retentionCards);
}

class StatisticsCompanion extends UpdateCompanion<StatisticsData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> date;
  final Value<int> cardsLearned;
  final Value<int> cardsReviewed;
  final Value<int> testsTaken;
  final Value<double> averageScore;
  final Value<int> studyTimeMinutes;
  final Value<int> xpEarned;
  final Value<int> retentionCards;
  final Value<int> rowid;
  const StatisticsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.cardsLearned = const Value.absent(),
    this.cardsReviewed = const Value.absent(),
    this.testsTaken = const Value.absent(),
    this.averageScore = const Value.absent(),
    this.studyTimeMinutes = const Value.absent(),
    this.xpEarned = const Value.absent(),
    this.retentionCards = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StatisticsCompanion.insert({
    required String id,
    required String userId,
    required DateTime date,
    this.cardsLearned = const Value.absent(),
    this.cardsReviewed = const Value.absent(),
    this.testsTaken = const Value.absent(),
    this.averageScore = const Value.absent(),
    this.studyTimeMinutes = const Value.absent(),
    this.xpEarned = const Value.absent(),
    this.retentionCards = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        date = Value(date);
  static Insertable<StatisticsData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? date,
    Expression<int>? cardsLearned,
    Expression<int>? cardsReviewed,
    Expression<int>? testsTaken,
    Expression<double>? averageScore,
    Expression<int>? studyTimeMinutes,
    Expression<int>? xpEarned,
    Expression<int>? retentionCards,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (cardsLearned != null) 'cards_learned': cardsLearned,
      if (cardsReviewed != null) 'cards_reviewed': cardsReviewed,
      if (testsTaken != null) 'tests_taken': testsTaken,
      if (averageScore != null) 'average_score': averageScore,
      if (studyTimeMinutes != null) 'study_time_minutes': studyTimeMinutes,
      if (xpEarned != null) 'xp_earned': xpEarned,
      if (retentionCards != null) 'retention_cards': retentionCards,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StatisticsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<DateTime>? date,
      Value<int>? cardsLearned,
      Value<int>? cardsReviewed,
      Value<int>? testsTaken,
      Value<double>? averageScore,
      Value<int>? studyTimeMinutes,
      Value<int>? xpEarned,
      Value<int>? retentionCards,
      Value<int>? rowid}) {
    return StatisticsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      cardsLearned: cardsLearned ?? this.cardsLearned,
      cardsReviewed: cardsReviewed ?? this.cardsReviewed,
      testsTaken: testsTaken ?? this.testsTaken,
      averageScore: averageScore ?? this.averageScore,
      studyTimeMinutes: studyTimeMinutes ?? this.studyTimeMinutes,
      xpEarned: xpEarned ?? this.xpEarned,
      retentionCards: retentionCards ?? this.retentionCards,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (cardsLearned.present) {
      map['cards_learned'] = Variable<int>(cardsLearned.value);
    }
    if (cardsReviewed.present) {
      map['cards_reviewed'] = Variable<int>(cardsReviewed.value);
    }
    if (testsTaken.present) {
      map['tests_taken'] = Variable<int>(testsTaken.value);
    }
    if (averageScore.present) {
      map['average_score'] = Variable<double>(averageScore.value);
    }
    if (studyTimeMinutes.present) {
      map['study_time_minutes'] = Variable<int>(studyTimeMinutes.value);
    }
    if (xpEarned.present) {
      map['xp_earned'] = Variable<int>(xpEarned.value);
    }
    if (retentionCards.present) {
      map['retention_cards'] = Variable<int>(retentionCards.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatisticsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('cardsLearned: $cardsLearned, ')
          ..write('cardsReviewed: $cardsReviewed, ')
          ..write('testsTaken: $testsTaken, ')
          ..write('averageScore: $averageScore, ')
          ..write('studyTimeMinutes: $studyTimeMinutes, ')
          ..write('xpEarned: $xpEarned, ')
          ..write('retentionCards: $retentionCards, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DecksTable decks = $DecksTable(this);
  late final $WordCardsTable wordCards = $WordCardsTable(this);
  late final $ArticleCardsTable articleCards = $ArticleCardsTable(this);
  late final $SentenceCardsTable sentenceCards = $SentenceCardsTable(this);
  late final $LearningSessionsTable learningSessions =
      $LearningSessionsTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $XpHistoryTable xpHistory = $XpHistoryTable(this);
  late final $StreakDataTable streakData = $StreakDataTable(this);
  late final $TestsTable tests = $TestsTable(this);
  late final $TestSessionsTable testSessions = $TestSessionsTable(this);
  late final $StatisticsTable statistics = $StatisticsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        decks,
        wordCards,
        articleCards,
        sentenceCards,
        learningSessions,
        userProfiles,
        xpHistory,
        streakData,
        tests,
        testSessions,
        statistics
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('decks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('word_cards', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('word_cards',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('article_cards', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('decks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('sentence_cards', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$DecksTableCreateCompanionBuilder = DecksCompanion Function({
  required String id,
  required String name,
  required String description,
  required String category,
  required String level,
  required String cardIds,
  required int totalCards,
  Value<int> cardsLearned,
  Value<double> progress,
  required String thumbnailEmoji,
  required DateTime createdAt,
  Value<DateTime?> lastStudied,
  Value<int> rowid,
});
typedef $$DecksTableUpdateCompanionBuilder = DecksCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> description,
  Value<String> category,
  Value<String> level,
  Value<String> cardIds,
  Value<int> totalCards,
  Value<int> cardsLearned,
  Value<double> progress,
  Value<String> thumbnailEmoji,
  Value<DateTime> createdAt,
  Value<DateTime?> lastStudied,
  Value<int> rowid,
});

final class $$DecksTableReferences
    extends BaseReferences<_$AppDatabase, $DecksTable, DeckData> {
  $$DecksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WordCardsTable, List<WordCardData>>
      _wordCardsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.wordCards,
          aliasName: $_aliasNameGenerator(db.decks.id, db.wordCards.deckId));

  $$WordCardsTableProcessedTableManager get wordCardsRefs {
    final manager = $$WordCardsTableTableManager($_db, $_db.wordCards)
        .filter((f) => f.deckId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_wordCardsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SentenceCardsTable, List<SentenceCardData>>
      _sentenceCardsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.sentenceCards,
              aliasName:
                  $_aliasNameGenerator(db.decks.id, db.sentenceCards.deckId));

  $$SentenceCardsTableProcessedTableManager get sentenceCardsRefs {
    final manager = $$SentenceCardsTableTableManager($_db, $_db.sentenceCards)
        .filter((f) => f.deckId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_sentenceCardsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DecksTableFilterComposer extends Composer<_$AppDatabase, $DecksTable> {
  $$DecksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardIds => $composableBuilder(
      column: $table.cardIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cardsLearned => $composableBuilder(
      column: $table.cardsLearned, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnailEmoji => $composableBuilder(
      column: $table.thumbnailEmoji,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastStudied => $composableBuilder(
      column: $table.lastStudied, builder: (column) => ColumnFilters(column));

  Expression<bool> wordCardsRefs(
      Expression<bool> Function($$WordCardsTableFilterComposer f) f) {
    final $$WordCardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.wordCards,
        getReferencedColumn: (t) => t.deckId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordCardsTableFilterComposer(
              $db: $db,
              $table: $db.wordCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> sentenceCardsRefs(
      Expression<bool> Function($$SentenceCardsTableFilterComposer f) f) {
    final $$SentenceCardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sentenceCards,
        getReferencedColumn: (t) => t.deckId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SentenceCardsTableFilterComposer(
              $db: $db,
              $table: $db.sentenceCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DecksTableOrderingComposer
    extends Composer<_$AppDatabase, $DecksTable> {
  $$DecksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardIds => $composableBuilder(
      column: $table.cardIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cardsLearned => $composableBuilder(
      column: $table.cardsLearned,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnailEmoji => $composableBuilder(
      column: $table.thumbnailEmoji,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastStudied => $composableBuilder(
      column: $table.lastStudied, builder: (column) => ColumnOrderings(column));
}

class $$DecksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecksTable> {
  $$DecksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get cardIds =>
      $composableBuilder(column: $table.cardIds, builder: (column) => column);

  GeneratedColumn<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => column);

  GeneratedColumn<int> get cardsLearned => $composableBuilder(
      column: $table.cardsLearned, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get thumbnailEmoji => $composableBuilder(
      column: $table.thumbnailEmoji, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastStudied => $composableBuilder(
      column: $table.lastStudied, builder: (column) => column);

  Expression<T> wordCardsRefs<T extends Object>(
      Expression<T> Function($$WordCardsTableAnnotationComposer a) f) {
    final $$WordCardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.wordCards,
        getReferencedColumn: (t) => t.deckId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordCardsTableAnnotationComposer(
              $db: $db,
              $table: $db.wordCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> sentenceCardsRefs<T extends Object>(
      Expression<T> Function($$SentenceCardsTableAnnotationComposer a) f) {
    final $$SentenceCardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sentenceCards,
        getReferencedColumn: (t) => t.deckId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SentenceCardsTableAnnotationComposer(
              $db: $db,
              $table: $db.sentenceCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DecksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DecksTable,
    DeckData,
    $$DecksTableFilterComposer,
    $$DecksTableOrderingComposer,
    $$DecksTableAnnotationComposer,
    $$DecksTableCreateCompanionBuilder,
    $$DecksTableUpdateCompanionBuilder,
    (DeckData, $$DecksTableReferences),
    DeckData,
    PrefetchHooks Function({bool wordCardsRefs, bool sentenceCardsRefs})> {
  $$DecksTableTableManager(_$AppDatabase db, $DecksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<String> cardIds = const Value.absent(),
            Value<int> totalCards = const Value.absent(),
            Value<int> cardsLearned = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<String> thumbnailEmoji = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastStudied = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DecksCompanion(
            id: id,
            name: name,
            description: description,
            category: category,
            level: level,
            cardIds: cardIds,
            totalCards: totalCards,
            cardsLearned: cardsLearned,
            progress: progress,
            thumbnailEmoji: thumbnailEmoji,
            createdAt: createdAt,
            lastStudied: lastStudied,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String description,
            required String category,
            required String level,
            required String cardIds,
            required int totalCards,
            Value<int> cardsLearned = const Value.absent(),
            Value<double> progress = const Value.absent(),
            required String thumbnailEmoji,
            required DateTime createdAt,
            Value<DateTime?> lastStudied = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DecksCompanion.insert(
            id: id,
            name: name,
            description: description,
            category: category,
            level: level,
            cardIds: cardIds,
            totalCards: totalCards,
            cardsLearned: cardsLearned,
            progress: progress,
            thumbnailEmoji: thumbnailEmoji,
            createdAt: createdAt,
            lastStudied: lastStudied,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DecksTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {wordCardsRefs = false, sentenceCardsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (wordCardsRefs) db.wordCards,
                if (sentenceCardsRefs) db.sentenceCards
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (wordCardsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DecksTableReferences._wordCardsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DecksTableReferences(db, table, p0).wordCardsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.deckId == item.id),
                        typedResults: items),
                  if (sentenceCardsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DecksTableReferences._sentenceCardsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DecksTableReferences(db, table, p0)
                                .sentenceCardsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.deckId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DecksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DecksTable,
    DeckData,
    $$DecksTableFilterComposer,
    $$DecksTableOrderingComposer,
    $$DecksTableAnnotationComposer,
    $$DecksTableCreateCompanionBuilder,
    $$DecksTableUpdateCompanionBuilder,
    (DeckData, $$DecksTableReferences),
    DeckData,
    PrefetchHooks Function({bool wordCardsRefs, bool sentenceCardsRefs})>;
typedef $$WordCardsTableCreateCompanionBuilder = WordCardsCompanion Function({
  required String id,
  required String germanWord,
  required String translation,
  required String article,
  required String pluralForm,
  Value<String?> exampleSentence,
  Value<String?> exampleTranslation,
  Value<String?> imageUrl,
  required String level,
  required String type,
  required String tags,
  required String deckId,
  Value<DateTime?> lastReviewed,
  Value<DateTime?> nextReview,
  Value<int?> intervalDays,
  Value<int> repetitionCount,
  Value<double> easeFactor,
  Value<int> rowid,
});
typedef $$WordCardsTableUpdateCompanionBuilder = WordCardsCompanion Function({
  Value<String> id,
  Value<String> germanWord,
  Value<String> translation,
  Value<String> article,
  Value<String> pluralForm,
  Value<String?> exampleSentence,
  Value<String?> exampleTranslation,
  Value<String?> imageUrl,
  Value<String> level,
  Value<String> type,
  Value<String> tags,
  Value<String> deckId,
  Value<DateTime?> lastReviewed,
  Value<DateTime?> nextReview,
  Value<int?> intervalDays,
  Value<int> repetitionCount,
  Value<double> easeFactor,
  Value<int> rowid,
});

final class $$WordCardsTableReferences
    extends BaseReferences<_$AppDatabase, $WordCardsTable, WordCardData> {
  $$WordCardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DecksTable _deckIdTable(_$AppDatabase db) => db.decks
      .createAlias($_aliasNameGenerator(db.wordCards.deckId, db.decks.id));

  $$DecksTableProcessedTableManager? get deckId {
    if ($_item.deckId == null) return null;
    final manager = $$DecksTableTableManager($_db, $_db.decks)
        .filter((f) => f.id($_item.deckId!));
    final item = $_typedResult.readTableOrNull(_deckIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ArticleCardsTable, List<ArticleCardData>>
      _articleCardsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.articleCards,
              aliasName: $_aliasNameGenerator(
                  db.wordCards.id, db.articleCards.wordCardId));

  $$ArticleCardsTableProcessedTableManager get articleCardsRefs {
    final manager = $$ArticleCardsTableTableManager($_db, $_db.articleCards)
        .filter((f) => f.wordCardId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_articleCardsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WordCardsTableFilterComposer
    extends Composer<_$AppDatabase, $WordCardsTable> {
  $$WordCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get germanWord => $composableBuilder(
      column: $table.germanWord, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get article => $composableBuilder(
      column: $table.article, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pluralForm => $composableBuilder(
      column: $table.pluralForm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exampleTranslation => $composableBuilder(
      column: $table.exampleTranslation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastReviewed => $composableBuilder(
      column: $table.lastReviewed, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get intervalDays => $composableBuilder(
      column: $table.intervalDays, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repetitionCount => $composableBuilder(
      column: $table.repetitionCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get easeFactor => $composableBuilder(
      column: $table.easeFactor, builder: (column) => ColumnFilters(column));

  $$DecksTableFilterComposer get deckId {
    final $$DecksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableFilterComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> articleCardsRefs(
      Expression<bool> Function($$ArticleCardsTableFilterComposer f) f) {
    final $$ArticleCardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleCards,
        getReferencedColumn: (t) => t.wordCardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleCardsTableFilterComposer(
              $db: $db,
              $table: $db.articleCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WordCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $WordCardsTable> {
  $$WordCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get germanWord => $composableBuilder(
      column: $table.germanWord, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get article => $composableBuilder(
      column: $table.article, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pluralForm => $composableBuilder(
      column: $table.pluralForm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exampleTranslation => $composableBuilder(
      column: $table.exampleTranslation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastReviewed => $composableBuilder(
      column: $table.lastReviewed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get intervalDays => $composableBuilder(
      column: $table.intervalDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repetitionCount => $composableBuilder(
      column: $table.repetitionCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get easeFactor => $composableBuilder(
      column: $table.easeFactor, builder: (column) => ColumnOrderings(column));

  $$DecksTableOrderingComposer get deckId {
    final $$DecksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableOrderingComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WordCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordCardsTable> {
  $$WordCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get germanWord => $composableBuilder(
      column: $table.germanWord, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => column);

  GeneratedColumn<String> get article =>
      $composableBuilder(column: $table.article, builder: (column) => column);

  GeneratedColumn<String> get pluralForm => $composableBuilder(
      column: $table.pluralForm, builder: (column) => column);

  GeneratedColumn<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence, builder: (column) => column);

  GeneratedColumn<String> get exampleTranslation => $composableBuilder(
      column: $table.exampleTranslation, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewed => $composableBuilder(
      column: $table.lastReviewed, builder: (column) => column);

  GeneratedColumn<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => column);

  GeneratedColumn<int> get intervalDays => $composableBuilder(
      column: $table.intervalDays, builder: (column) => column);

  GeneratedColumn<int> get repetitionCount => $composableBuilder(
      column: $table.repetitionCount, builder: (column) => column);

  GeneratedColumn<double> get easeFactor => $composableBuilder(
      column: $table.easeFactor, builder: (column) => column);

  $$DecksTableAnnotationComposer get deckId {
    final $$DecksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableAnnotationComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> articleCardsRefs<T extends Object>(
      Expression<T> Function($$ArticleCardsTableAnnotationComposer a) f) {
    final $$ArticleCardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleCards,
        getReferencedColumn: (t) => t.wordCardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleCardsTableAnnotationComposer(
              $db: $db,
              $table: $db.articleCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WordCardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WordCardsTable,
    WordCardData,
    $$WordCardsTableFilterComposer,
    $$WordCardsTableOrderingComposer,
    $$WordCardsTableAnnotationComposer,
    $$WordCardsTableCreateCompanionBuilder,
    $$WordCardsTableUpdateCompanionBuilder,
    (WordCardData, $$WordCardsTableReferences),
    WordCardData,
    PrefetchHooks Function({bool deckId, bool articleCardsRefs})> {
  $$WordCardsTableTableManager(_$AppDatabase db, $WordCardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> germanWord = const Value.absent(),
            Value<String> translation = const Value.absent(),
            Value<String> article = const Value.absent(),
            Value<String> pluralForm = const Value.absent(),
            Value<String?> exampleSentence = const Value.absent(),
            Value<String?> exampleTranslation = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> deckId = const Value.absent(),
            Value<DateTime?> lastReviewed = const Value.absent(),
            Value<DateTime?> nextReview = const Value.absent(),
            Value<int?> intervalDays = const Value.absent(),
            Value<int> repetitionCount = const Value.absent(),
            Value<double> easeFactor = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WordCardsCompanion(
            id: id,
            germanWord: germanWord,
            translation: translation,
            article: article,
            pluralForm: pluralForm,
            exampleSentence: exampleSentence,
            exampleTranslation: exampleTranslation,
            imageUrl: imageUrl,
            level: level,
            type: type,
            tags: tags,
            deckId: deckId,
            lastReviewed: lastReviewed,
            nextReview: nextReview,
            intervalDays: intervalDays,
            repetitionCount: repetitionCount,
            easeFactor: easeFactor,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String germanWord,
            required String translation,
            required String article,
            required String pluralForm,
            Value<String?> exampleSentence = const Value.absent(),
            Value<String?> exampleTranslation = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            required String level,
            required String type,
            required String tags,
            required String deckId,
            Value<DateTime?> lastReviewed = const Value.absent(),
            Value<DateTime?> nextReview = const Value.absent(),
            Value<int?> intervalDays = const Value.absent(),
            Value<int> repetitionCount = const Value.absent(),
            Value<double> easeFactor = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WordCardsCompanion.insert(
            id: id,
            germanWord: germanWord,
            translation: translation,
            article: article,
            pluralForm: pluralForm,
            exampleSentence: exampleSentence,
            exampleTranslation: exampleTranslation,
            imageUrl: imageUrl,
            level: level,
            type: type,
            tags: tags,
            deckId: deckId,
            lastReviewed: lastReviewed,
            nextReview: nextReview,
            intervalDays: intervalDays,
            repetitionCount: repetitionCount,
            easeFactor: easeFactor,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WordCardsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({deckId = false, articleCardsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (articleCardsRefs) db.articleCards],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (deckId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.deckId,
                    referencedTable:
                        $$WordCardsTableReferences._deckIdTable(db),
                    referencedColumn:
                        $$WordCardsTableReferences._deckIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articleCardsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WordCardsTableReferences
                            ._articleCardsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WordCardsTableReferences(db, table, p0)
                                .articleCardsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.wordCardId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WordCardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WordCardsTable,
    WordCardData,
    $$WordCardsTableFilterComposer,
    $$WordCardsTableOrderingComposer,
    $$WordCardsTableAnnotationComposer,
    $$WordCardsTableCreateCompanionBuilder,
    $$WordCardsTableUpdateCompanionBuilder,
    (WordCardData, $$WordCardsTableReferences),
    WordCardData,
    PrefetchHooks Function({bool deckId, bool articleCardsRefs})>;
typedef $$ArticleCardsTableCreateCompanionBuilder = ArticleCardsCompanion
    Function({
  required String id,
  required String word,
  required String correctArticle,
  required String options,
  required String translation,
  required String exampleSentence,
  required String level,
  required String wordCardId,
  Value<int> rowid,
});
typedef $$ArticleCardsTableUpdateCompanionBuilder = ArticleCardsCompanion
    Function({
  Value<String> id,
  Value<String> word,
  Value<String> correctArticle,
  Value<String> options,
  Value<String> translation,
  Value<String> exampleSentence,
  Value<String> level,
  Value<String> wordCardId,
  Value<int> rowid,
});

final class $$ArticleCardsTableReferences
    extends BaseReferences<_$AppDatabase, $ArticleCardsTable, ArticleCardData> {
  $$ArticleCardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WordCardsTable _wordCardIdTable(_$AppDatabase db) =>
      db.wordCards.createAlias(
          $_aliasNameGenerator(db.articleCards.wordCardId, db.wordCards.id));

  $$WordCardsTableProcessedTableManager? get wordCardId {
    if ($_item.wordCardId == null) return null;
    final manager = $$WordCardsTableTableManager($_db, $_db.wordCards)
        .filter((f) => f.id($_item.wordCardId!));
    final item = $_typedResult.readTableOrNull(_wordCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ArticleCardsTableFilterComposer
    extends Composer<_$AppDatabase, $ArticleCardsTable> {
  $$ArticleCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get correctArticle => $composableBuilder(
      column: $table.correctArticle,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  $$WordCardsTableFilterComposer get wordCardId {
    final $$WordCardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordCardId,
        referencedTable: $db.wordCards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordCardsTableFilterComposer(
              $db: $db,
              $table: $db.wordCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticleCardsTable> {
  $$ArticleCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get correctArticle => $composableBuilder(
      column: $table.correctArticle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  $$WordCardsTableOrderingComposer get wordCardId {
    final $$WordCardsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordCardId,
        referencedTable: $db.wordCards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordCardsTableOrderingComposer(
              $db: $db,
              $table: $db.wordCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticleCardsTable> {
  $$ArticleCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get correctArticle => $composableBuilder(
      column: $table.correctArticle, builder: (column) => column);

  GeneratedColumn<String> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => column);

  GeneratedColumn<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  $$WordCardsTableAnnotationComposer get wordCardId {
    final $$WordCardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordCardId,
        referencedTable: $db.wordCards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordCardsTableAnnotationComposer(
              $db: $db,
              $table: $db.wordCards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleCardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticleCardsTable,
    ArticleCardData,
    $$ArticleCardsTableFilterComposer,
    $$ArticleCardsTableOrderingComposer,
    $$ArticleCardsTableAnnotationComposer,
    $$ArticleCardsTableCreateCompanionBuilder,
    $$ArticleCardsTableUpdateCompanionBuilder,
    (ArticleCardData, $$ArticleCardsTableReferences),
    ArticleCardData,
    PrefetchHooks Function({bool wordCardId})> {
  $$ArticleCardsTableTableManager(_$AppDatabase db, $ArticleCardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticleCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticleCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticleCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<String> correctArticle = const Value.absent(),
            Value<String> options = const Value.absent(),
            Value<String> translation = const Value.absent(),
            Value<String> exampleSentence = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<String> wordCardId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleCardsCompanion(
            id: id,
            word: word,
            correctArticle: correctArticle,
            options: options,
            translation: translation,
            exampleSentence: exampleSentence,
            level: level,
            wordCardId: wordCardId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String word,
            required String correctArticle,
            required String options,
            required String translation,
            required String exampleSentence,
            required String level,
            required String wordCardId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleCardsCompanion.insert(
            id: id,
            word: word,
            correctArticle: correctArticle,
            options: options,
            translation: translation,
            exampleSentence: exampleSentence,
            level: level,
            wordCardId: wordCardId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ArticleCardsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({wordCardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (wordCardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.wordCardId,
                    referencedTable:
                        $$ArticleCardsTableReferences._wordCardIdTable(db),
                    referencedColumn:
                        $$ArticleCardsTableReferences._wordCardIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ArticleCardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArticleCardsTable,
    ArticleCardData,
    $$ArticleCardsTableFilterComposer,
    $$ArticleCardsTableOrderingComposer,
    $$ArticleCardsTableAnnotationComposer,
    $$ArticleCardsTableCreateCompanionBuilder,
    $$ArticleCardsTableUpdateCompanionBuilder,
    (ArticleCardData, $$ArticleCardsTableReferences),
    ArticleCardData,
    PrefetchHooks Function({bool wordCardId})>;
typedef $$SentenceCardsTableCreateCompanionBuilder = SentenceCardsCompanion
    Function({
  required String id,
  required String incompleteSentence,
  required String wordOptions,
  required String correctAnswer,
  required String completeSentence,
  required String translation,
  required String level,
  required String grammarTopic,
  required String deckId,
  Value<int> rowid,
});
typedef $$SentenceCardsTableUpdateCompanionBuilder = SentenceCardsCompanion
    Function({
  Value<String> id,
  Value<String> incompleteSentence,
  Value<String> wordOptions,
  Value<String> correctAnswer,
  Value<String> completeSentence,
  Value<String> translation,
  Value<String> level,
  Value<String> grammarTopic,
  Value<String> deckId,
  Value<int> rowid,
});

final class $$SentenceCardsTableReferences extends BaseReferences<_$AppDatabase,
    $SentenceCardsTable, SentenceCardData> {
  $$SentenceCardsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DecksTable _deckIdTable(_$AppDatabase db) => db.decks
      .createAlias($_aliasNameGenerator(db.sentenceCards.deckId, db.decks.id));

  $$DecksTableProcessedTableManager? get deckId {
    if ($_item.deckId == null) return null;
    final manager = $$DecksTableTableManager($_db, $_db.decks)
        .filter((f) => f.id($_item.deckId!));
    final item = $_typedResult.readTableOrNull(_deckIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SentenceCardsTableFilterComposer
    extends Composer<_$AppDatabase, $SentenceCardsTable> {
  $$SentenceCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get incompleteSentence => $composableBuilder(
      column: $table.incompleteSentence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wordOptions => $composableBuilder(
      column: $table.wordOptions, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get completeSentence => $composableBuilder(
      column: $table.completeSentence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get grammarTopic => $composableBuilder(
      column: $table.grammarTopic, builder: (column) => ColumnFilters(column));

  $$DecksTableFilterComposer get deckId {
    final $$DecksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableFilterComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SentenceCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $SentenceCardsTable> {
  $$SentenceCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get incompleteSentence => $composableBuilder(
      column: $table.incompleteSentence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wordOptions => $composableBuilder(
      column: $table.wordOptions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get completeSentence => $composableBuilder(
      column: $table.completeSentence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get grammarTopic => $composableBuilder(
      column: $table.grammarTopic,
      builder: (column) => ColumnOrderings(column));

  $$DecksTableOrderingComposer get deckId {
    final $$DecksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableOrderingComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SentenceCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SentenceCardsTable> {
  $$SentenceCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get incompleteSentence => $composableBuilder(
      column: $table.incompleteSentence, builder: (column) => column);

  GeneratedColumn<String> get wordOptions => $composableBuilder(
      column: $table.wordOptions, builder: (column) => column);

  GeneratedColumn<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer, builder: (column) => column);

  GeneratedColumn<String> get completeSentence => $composableBuilder(
      column: $table.completeSentence, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get grammarTopic => $composableBuilder(
      column: $table.grammarTopic, builder: (column) => column);

  $$DecksTableAnnotationComposer get deckId {
    final $$DecksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deckId,
        referencedTable: $db.decks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DecksTableAnnotationComposer(
              $db: $db,
              $table: $db.decks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SentenceCardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SentenceCardsTable,
    SentenceCardData,
    $$SentenceCardsTableFilterComposer,
    $$SentenceCardsTableOrderingComposer,
    $$SentenceCardsTableAnnotationComposer,
    $$SentenceCardsTableCreateCompanionBuilder,
    $$SentenceCardsTableUpdateCompanionBuilder,
    (SentenceCardData, $$SentenceCardsTableReferences),
    SentenceCardData,
    PrefetchHooks Function({bool deckId})> {
  $$SentenceCardsTableTableManager(_$AppDatabase db, $SentenceCardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SentenceCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SentenceCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SentenceCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> incompleteSentence = const Value.absent(),
            Value<String> wordOptions = const Value.absent(),
            Value<String> correctAnswer = const Value.absent(),
            Value<String> completeSentence = const Value.absent(),
            Value<String> translation = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<String> grammarTopic = const Value.absent(),
            Value<String> deckId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SentenceCardsCompanion(
            id: id,
            incompleteSentence: incompleteSentence,
            wordOptions: wordOptions,
            correctAnswer: correctAnswer,
            completeSentence: completeSentence,
            translation: translation,
            level: level,
            grammarTopic: grammarTopic,
            deckId: deckId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String incompleteSentence,
            required String wordOptions,
            required String correctAnswer,
            required String completeSentence,
            required String translation,
            required String level,
            required String grammarTopic,
            required String deckId,
            Value<int> rowid = const Value.absent(),
          }) =>
              SentenceCardsCompanion.insert(
            id: id,
            incompleteSentence: incompleteSentence,
            wordOptions: wordOptions,
            correctAnswer: correctAnswer,
            completeSentence: completeSentence,
            translation: translation,
            level: level,
            grammarTopic: grammarTopic,
            deckId: deckId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SentenceCardsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({deckId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (deckId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.deckId,
                    referencedTable:
                        $$SentenceCardsTableReferences._deckIdTable(db),
                    referencedColumn:
                        $$SentenceCardsTableReferences._deckIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SentenceCardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SentenceCardsTable,
    SentenceCardData,
    $$SentenceCardsTableFilterComposer,
    $$SentenceCardsTableOrderingComposer,
    $$SentenceCardsTableAnnotationComposer,
    $$SentenceCardsTableCreateCompanionBuilder,
    $$SentenceCardsTableUpdateCompanionBuilder,
    (SentenceCardData, $$SentenceCardsTableReferences),
    SentenceCardData,
    PrefetchHooks Function({bool deckId})>;
typedef $$LearningSessionsTableCreateCompanionBuilder
    = LearningSessionsCompanion Function({
  required String id,
  required String deckId,
  required String userId,
  required DateTime startedAt,
  Value<DateTime?> completedAt,
  required String cards,
  Value<int> cardsStudied,
  Value<int> correctAnswers,
  Value<int> xpEarned,
  required String status,
  Value<int> rowid,
});
typedef $$LearningSessionsTableUpdateCompanionBuilder
    = LearningSessionsCompanion Function({
  Value<String> id,
  Value<String> deckId,
  Value<String> userId,
  Value<DateTime> startedAt,
  Value<DateTime?> completedAt,
  Value<String> cards,
  Value<int> cardsStudied,
  Value<int> correctAnswers,
  Value<int> xpEarned,
  Value<String> status,
  Value<int> rowid,
});

class $$LearningSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deckId => $composableBuilder(
      column: $table.deckId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cards => $composableBuilder(
      column: $table.cards, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cardsStudied => $composableBuilder(
      column: $table.cardsStudied, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xpEarned => $composableBuilder(
      column: $table.xpEarned, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$LearningSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deckId => $composableBuilder(
      column: $table.deckId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cards => $composableBuilder(
      column: $table.cards, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cardsStudied => $composableBuilder(
      column: $table.cardsStudied,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xpEarned => $composableBuilder(
      column: $table.xpEarned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$LearningSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deckId =>
      $composableBuilder(column: $table.deckId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<String> get cards =>
      $composableBuilder(column: $table.cards, builder: (column) => column);

  GeneratedColumn<int> get cardsStudied => $composableBuilder(
      column: $table.cardsStudied, builder: (column) => column);

  GeneratedColumn<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers, builder: (column) => column);

  GeneratedColumn<int> get xpEarned =>
      $composableBuilder(column: $table.xpEarned, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$LearningSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LearningSessionsTable,
    LearningSessionData,
    $$LearningSessionsTableFilterComposer,
    $$LearningSessionsTableOrderingComposer,
    $$LearningSessionsTableAnnotationComposer,
    $$LearningSessionsTableCreateCompanionBuilder,
    $$LearningSessionsTableUpdateCompanionBuilder,
    (
      LearningSessionData,
      BaseReferences<_$AppDatabase, $LearningSessionsTable, LearningSessionData>
    ),
    LearningSessionData,
    PrefetchHooks Function()> {
  $$LearningSessionsTableTableManager(
      _$AppDatabase db, $LearningSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> deckId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<String> cards = const Value.absent(),
            Value<int> cardsStudied = const Value.absent(),
            Value<int> correctAnswers = const Value.absent(),
            Value<int> xpEarned = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningSessionsCompanion(
            id: id,
            deckId: deckId,
            userId: userId,
            startedAt: startedAt,
            completedAt: completedAt,
            cards: cards,
            cardsStudied: cardsStudied,
            correctAnswers: correctAnswers,
            xpEarned: xpEarned,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String deckId,
            required String userId,
            required DateTime startedAt,
            Value<DateTime?> completedAt = const Value.absent(),
            required String cards,
            Value<int> cardsStudied = const Value.absent(),
            Value<int> correctAnswers = const Value.absent(),
            Value<int> xpEarned = const Value.absent(),
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              LearningSessionsCompanion.insert(
            id: id,
            deckId: deckId,
            userId: userId,
            startedAt: startedAt,
            completedAt: completedAt,
            cards: cards,
            cardsStudied: cardsStudied,
            correctAnswers: correctAnswers,
            xpEarned: xpEarned,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LearningSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LearningSessionsTable,
    LearningSessionData,
    $$LearningSessionsTableFilterComposer,
    $$LearningSessionsTableOrderingComposer,
    $$LearningSessionsTableAnnotationComposer,
    $$LearningSessionsTableCreateCompanionBuilder,
    $$LearningSessionsTableUpdateCompanionBuilder,
    (
      LearningSessionData,
      BaseReferences<_$AppDatabase, $LearningSessionsTable, LearningSessionData>
    ),
    LearningSessionData,
    PrefetchHooks Function()>;
typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  required String id,
  required String userId,
  required String name,
  Value<String?> email,
  Value<String?> avatarUrl,
  required DateTime joinedDate,
  required String settings,
  required String learningPrefs,
  Value<int> rowid,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> name,
  Value<String?> email,
  Value<String?> avatarUrl,
  Value<DateTime> joinedDate,
  Value<String> settings,
  Value<String> learningPrefs,
  Value<int> rowid,
});

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get joinedDate => $composableBuilder(
      column: $table.joinedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get learningPrefs => $composableBuilder(
      column: $table.learningPrefs, builder: (column) => ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get joinedDate => $composableBuilder(
      column: $table.joinedDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get learningPrefs => $composableBuilder(
      column: $table.learningPrefs,
      builder: (column) => ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get avatarUrl =>
      $composableBuilder(column: $table.avatarUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get joinedDate => $composableBuilder(
      column: $table.joinedDate, builder: (column) => column);

  GeneratedColumn<String> get settings =>
      $composableBuilder(column: $table.settings, builder: (column) => column);

  GeneratedColumn<String> get learningPrefs => $composableBuilder(
      column: $table.learningPrefs, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfileData,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfileData,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileData>
    ),
    UserProfileData,
    PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> avatarUrl = const Value.absent(),
            Value<DateTime> joinedDate = const Value.absent(),
            Value<String> settings = const Value.absent(),
            Value<String> learningPrefs = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            userId: userId,
            name: name,
            email: email,
            avatarUrl: avatarUrl,
            joinedDate: joinedDate,
            settings: settings,
            learningPrefs: learningPrefs,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String name,
            Value<String?> email = const Value.absent(),
            Value<String?> avatarUrl = const Value.absent(),
            required DateTime joinedDate,
            required String settings,
            required String learningPrefs,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            email: email,
            avatarUrl: avatarUrl,
            joinedDate: joinedDate,
            settings: settings,
            learningPrefs: learningPrefs,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfileData,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfileData,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileData>
    ),
    UserProfileData,
    PrefetchHooks Function()>;
typedef $$XpHistoryTableCreateCompanionBuilder = XpHistoryCompanion Function({
  Value<int> id,
  required String userId,
  required int amount,
  required String source,
  required DateTime timestamp,
  Value<String?> description,
});
typedef $$XpHistoryTableUpdateCompanionBuilder = XpHistoryCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<int> amount,
  Value<String> source,
  Value<DateTime> timestamp,
  Value<String?> description,
});

class $$XpHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $XpHistoryTable> {
  $$XpHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$XpHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $XpHistoryTable> {
  $$XpHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$XpHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $XpHistoryTable> {
  $$XpHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$XpHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $XpHistoryTable,
    XpHistoryEntryData,
    $$XpHistoryTableFilterComposer,
    $$XpHistoryTableOrderingComposer,
    $$XpHistoryTableAnnotationComposer,
    $$XpHistoryTableCreateCompanionBuilder,
    $$XpHistoryTableUpdateCompanionBuilder,
    (
      XpHistoryEntryData,
      BaseReferences<_$AppDatabase, $XpHistoryTable, XpHistoryEntryData>
    ),
    XpHistoryEntryData,
    PrefetchHooks Function()> {
  $$XpHistoryTableTableManager(_$AppDatabase db, $XpHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$XpHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$XpHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$XpHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              XpHistoryCompanion(
            id: id,
            userId: userId,
            amount: amount,
            source: source,
            timestamp: timestamp,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required int amount,
            required String source,
            required DateTime timestamp,
            Value<String?> description = const Value.absent(),
          }) =>
              XpHistoryCompanion.insert(
            id: id,
            userId: userId,
            amount: amount,
            source: source,
            timestamp: timestamp,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$XpHistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $XpHistoryTable,
    XpHistoryEntryData,
    $$XpHistoryTableFilterComposer,
    $$XpHistoryTableOrderingComposer,
    $$XpHistoryTableAnnotationComposer,
    $$XpHistoryTableCreateCompanionBuilder,
    $$XpHistoryTableUpdateCompanionBuilder,
    (
      XpHistoryEntryData,
      BaseReferences<_$AppDatabase, $XpHistoryTable, XpHistoryEntryData>
    ),
    XpHistoryEntryData,
    PrefetchHooks Function()>;
typedef $$StreakDataTableCreateCompanionBuilder = StreakDataCompanion Function({
  Value<int> id,
  required String userId,
  required int currentStreak,
  required int longestStreak,
  required DateTime lastStudyDate,
  required bool studiedToday,
  required String studyDates,
  Value<String?> lastMilestone,
});
typedef $$StreakDataTableUpdateCompanionBuilder = StreakDataCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<int> currentStreak,
  Value<int> longestStreak,
  Value<DateTime> lastStudyDate,
  Value<bool> studiedToday,
  Value<String> studyDates,
  Value<String?> lastMilestone,
});

class $$StreakDataTableFilterComposer
    extends Composer<_$AppDatabase, $StreakDataTable> {
  $$StreakDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get longestStreak => $composableBuilder(
      column: $table.longestStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastStudyDate => $composableBuilder(
      column: $table.lastStudyDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get studiedToday => $composableBuilder(
      column: $table.studiedToday, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get studyDates => $composableBuilder(
      column: $table.studyDates, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastMilestone => $composableBuilder(
      column: $table.lastMilestone, builder: (column) => ColumnFilters(column));
}

class $$StreakDataTableOrderingComposer
    extends Composer<_$AppDatabase, $StreakDataTable> {
  $$StreakDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get longestStreak => $composableBuilder(
      column: $table.longestStreak,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastStudyDate => $composableBuilder(
      column: $table.lastStudyDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get studiedToday => $composableBuilder(
      column: $table.studiedToday,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get studyDates => $composableBuilder(
      column: $table.studyDates, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastMilestone => $composableBuilder(
      column: $table.lastMilestone,
      builder: (column) => ColumnOrderings(column));
}

class $$StreakDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreakDataTable> {
  $$StreakDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak, builder: (column) => column);

  GeneratedColumn<int> get longestStreak => $composableBuilder(
      column: $table.longestStreak, builder: (column) => column);

  GeneratedColumn<DateTime> get lastStudyDate => $composableBuilder(
      column: $table.lastStudyDate, builder: (column) => column);

  GeneratedColumn<bool> get studiedToday => $composableBuilder(
      column: $table.studiedToday, builder: (column) => column);

  GeneratedColumn<String> get studyDates => $composableBuilder(
      column: $table.studyDates, builder: (column) => column);

  GeneratedColumn<String> get lastMilestone => $composableBuilder(
      column: $table.lastMilestone, builder: (column) => column);
}

class $$StreakDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StreakDataTable,
    StreakDataData,
    $$StreakDataTableFilterComposer,
    $$StreakDataTableOrderingComposer,
    $$StreakDataTableAnnotationComposer,
    $$StreakDataTableCreateCompanionBuilder,
    $$StreakDataTableUpdateCompanionBuilder,
    (
      StreakDataData,
      BaseReferences<_$AppDatabase, $StreakDataTable, StreakDataData>
    ),
    StreakDataData,
    PrefetchHooks Function()> {
  $$StreakDataTableTableManager(_$AppDatabase db, $StreakDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreakDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreakDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreakDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> currentStreak = const Value.absent(),
            Value<int> longestStreak = const Value.absent(),
            Value<DateTime> lastStudyDate = const Value.absent(),
            Value<bool> studiedToday = const Value.absent(),
            Value<String> studyDates = const Value.absent(),
            Value<String?> lastMilestone = const Value.absent(),
          }) =>
              StreakDataCompanion(
            id: id,
            userId: userId,
            currentStreak: currentStreak,
            longestStreak: longestStreak,
            lastStudyDate: lastStudyDate,
            studiedToday: studiedToday,
            studyDates: studyDates,
            lastMilestone: lastMilestone,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required int currentStreak,
            required int longestStreak,
            required DateTime lastStudyDate,
            required bool studiedToday,
            required String studyDates,
            Value<String?> lastMilestone = const Value.absent(),
          }) =>
              StreakDataCompanion.insert(
            id: id,
            userId: userId,
            currentStreak: currentStreak,
            longestStreak: longestStreak,
            lastStudyDate: lastStudyDate,
            studiedToday: studiedToday,
            studyDates: studyDates,
            lastMilestone: lastMilestone,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StreakDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StreakDataTable,
    StreakDataData,
    $$StreakDataTableFilterComposer,
    $$StreakDataTableOrderingComposer,
    $$StreakDataTableAnnotationComposer,
    $$StreakDataTableCreateCompanionBuilder,
    $$StreakDataTableUpdateCompanionBuilder,
    (
      StreakDataData,
      BaseReferences<_$AppDatabase, $StreakDataTable, StreakDataData>
    ),
    StreakDataData,
    PrefetchHooks Function()>;
typedef $$TestsTableCreateCompanionBuilder = TestsCompanion Function({
  required String id,
  required String title,
  required String description,
  required String questions,
  required int duration,
  required String category,
  Value<int?> minPassingScore,
  Value<int> rowid,
});
typedef $$TestsTableUpdateCompanionBuilder = TestsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> description,
  Value<String> questions,
  Value<int> duration,
  Value<String> category,
  Value<int?> minPassingScore,
  Value<int> rowid,
});

class $$TestsTableFilterComposer extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get questions => $composableBuilder(
      column: $table.questions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minPassingScore => $composableBuilder(
      column: $table.minPassingScore,
      builder: (column) => ColumnFilters(column));
}

class $$TestsTableOrderingComposer
    extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get questions => $composableBuilder(
      column: $table.questions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minPassingScore => $composableBuilder(
      column: $table.minPassingScore,
      builder: (column) => ColumnOrderings(column));
}

class $$TestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get questions =>
      $composableBuilder(column: $table.questions, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get minPassingScore => $composableBuilder(
      column: $table.minPassingScore, builder: (column) => column);
}

class $$TestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TestsTable,
    TestData,
    $$TestsTableFilterComposer,
    $$TestsTableOrderingComposer,
    $$TestsTableAnnotationComposer,
    $$TestsTableCreateCompanionBuilder,
    $$TestsTableUpdateCompanionBuilder,
    (TestData, BaseReferences<_$AppDatabase, $TestsTable, TestData>),
    TestData,
    PrefetchHooks Function()> {
  $$TestsTableTableManager(_$AppDatabase db, $TestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> questions = const Value.absent(),
            Value<int> duration = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int?> minPassingScore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TestsCompanion(
            id: id,
            title: title,
            description: description,
            questions: questions,
            duration: duration,
            category: category,
            minPassingScore: minPassingScore,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String description,
            required String questions,
            required int duration,
            required String category,
            Value<int?> minPassingScore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TestsCompanion.insert(
            id: id,
            title: title,
            description: description,
            questions: questions,
            duration: duration,
            category: category,
            minPassingScore: minPassingScore,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TestsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TestsTable,
    TestData,
    $$TestsTableFilterComposer,
    $$TestsTableOrderingComposer,
    $$TestsTableAnnotationComposer,
    $$TestsTableCreateCompanionBuilder,
    $$TestsTableUpdateCompanionBuilder,
    (TestData, BaseReferences<_$AppDatabase, $TestsTable, TestData>),
    TestData,
    PrefetchHooks Function()>;
typedef $$TestSessionsTableCreateCompanionBuilder = TestSessionsCompanion
    Function({
  required String id,
  required String testId,
  required String userId,
  required String userAnswers,
  required int currentQuestionIndex,
  Value<DateTime?> startTime,
  Value<int?> timeLeft,
  Value<int?> timeElapsed,
  Value<bool> isComplete,
  Value<DateTime?> completedAt,
  Value<int?> score,
  Value<bool?> isPassed,
  Value<int> rowid,
});
typedef $$TestSessionsTableUpdateCompanionBuilder = TestSessionsCompanion
    Function({
  Value<String> id,
  Value<String> testId,
  Value<String> userId,
  Value<String> userAnswers,
  Value<int> currentQuestionIndex,
  Value<DateTime?> startTime,
  Value<int?> timeLeft,
  Value<int?> timeElapsed,
  Value<bool> isComplete,
  Value<DateTime?> completedAt,
  Value<int?> score,
  Value<bool?> isPassed,
  Value<int> rowid,
});

class $$TestSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $TestSessionsTable> {
  $$TestSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get testId => $composableBuilder(
      column: $table.testId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userAnswers => $composableBuilder(
      column: $table.userAnswers, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeLeft => $composableBuilder(
      column: $table.timeLeft, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeElapsed => $composableBuilder(
      column: $table.timeElapsed, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPassed => $composableBuilder(
      column: $table.isPassed, builder: (column) => ColumnFilters(column));
}

class $$TestSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TestSessionsTable> {
  $$TestSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get testId => $composableBuilder(
      column: $table.testId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userAnswers => $composableBuilder(
      column: $table.userAnswers, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeLeft => $composableBuilder(
      column: $table.timeLeft, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeElapsed => $composableBuilder(
      column: $table.timeElapsed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPassed => $composableBuilder(
      column: $table.isPassed, builder: (column) => ColumnOrderings(column));
}

class $$TestSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestSessionsTable> {
  $$TestSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get testId =>
      $composableBuilder(column: $table.testId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get userAnswers => $composableBuilder(
      column: $table.userAnswers, builder: (column) => column);

  GeneratedColumn<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get timeLeft =>
      $composableBuilder(column: $table.timeLeft, builder: (column) => column);

  GeneratedColumn<int> get timeElapsed => $composableBuilder(
      column: $table.timeElapsed, builder: (column) => column);

  GeneratedColumn<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<bool> get isPassed =>
      $composableBuilder(column: $table.isPassed, builder: (column) => column);
}

class $$TestSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TestSessionsTable,
    TestSessionData,
    $$TestSessionsTableFilterComposer,
    $$TestSessionsTableOrderingComposer,
    $$TestSessionsTableAnnotationComposer,
    $$TestSessionsTableCreateCompanionBuilder,
    $$TestSessionsTableUpdateCompanionBuilder,
    (
      TestSessionData,
      BaseReferences<_$AppDatabase, $TestSessionsTable, TestSessionData>
    ),
    TestSessionData,
    PrefetchHooks Function()> {
  $$TestSessionsTableTableManager(_$AppDatabase db, $TestSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> testId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> userAnswers = const Value.absent(),
            Value<int> currentQuestionIndex = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<int?> timeLeft = const Value.absent(),
            Value<int?> timeElapsed = const Value.absent(),
            Value<bool> isComplete = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<int?> score = const Value.absent(),
            Value<bool?> isPassed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TestSessionsCompanion(
            id: id,
            testId: testId,
            userId: userId,
            userAnswers: userAnswers,
            currentQuestionIndex: currentQuestionIndex,
            startTime: startTime,
            timeLeft: timeLeft,
            timeElapsed: timeElapsed,
            isComplete: isComplete,
            completedAt: completedAt,
            score: score,
            isPassed: isPassed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String testId,
            required String userId,
            required String userAnswers,
            required int currentQuestionIndex,
            Value<DateTime?> startTime = const Value.absent(),
            Value<int?> timeLeft = const Value.absent(),
            Value<int?> timeElapsed = const Value.absent(),
            Value<bool> isComplete = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<int?> score = const Value.absent(),
            Value<bool?> isPassed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TestSessionsCompanion.insert(
            id: id,
            testId: testId,
            userId: userId,
            userAnswers: userAnswers,
            currentQuestionIndex: currentQuestionIndex,
            startTime: startTime,
            timeLeft: timeLeft,
            timeElapsed: timeElapsed,
            isComplete: isComplete,
            completedAt: completedAt,
            score: score,
            isPassed: isPassed,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TestSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TestSessionsTable,
    TestSessionData,
    $$TestSessionsTableFilterComposer,
    $$TestSessionsTableOrderingComposer,
    $$TestSessionsTableAnnotationComposer,
    $$TestSessionsTableCreateCompanionBuilder,
    $$TestSessionsTableUpdateCompanionBuilder,
    (
      TestSessionData,
      BaseReferences<_$AppDatabase, $TestSessionsTable, TestSessionData>
    ),
    TestSessionData,
    PrefetchHooks Function()>;
typedef $$StatisticsTableCreateCompanionBuilder = StatisticsCompanion Function({
  required String id,
  required String userId,
  required DateTime date,
  Value<int> cardsLearned,
  Value<int> cardsReviewed,
  Value<int> testsTaken,
  Value<double> averageScore,
  Value<int> studyTimeMinutes,
  Value<int> xpEarned,
  Value<int> retentionCards,
  Value<int> rowid,
});
typedef $$StatisticsTableUpdateCompanionBuilder = StatisticsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<DateTime> date,
  Value<int> cardsLearned,
  Value<int> cardsReviewed,
  Value<int> testsTaken,
  Value<double> averageScore,
  Value<int> studyTimeMinutes,
  Value<int> xpEarned,
  Value<int> retentionCards,
  Value<int> rowid,
});

class $$StatisticsTableFilterComposer
    extends Composer<_$AppDatabase, $StatisticsTable> {
  $$StatisticsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cardsLearned => $composableBuilder(
      column: $table.cardsLearned, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cardsReviewed => $composableBuilder(
      column: $table.cardsReviewed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get testsTaken => $composableBuilder(
      column: $table.testsTaken, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get averageScore => $composableBuilder(
      column: $table.averageScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studyTimeMinutes => $composableBuilder(
      column: $table.studyTimeMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xpEarned => $composableBuilder(
      column: $table.xpEarned, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retentionCards => $composableBuilder(
      column: $table.retentionCards,
      builder: (column) => ColumnFilters(column));
}

class $$StatisticsTableOrderingComposer
    extends Composer<_$AppDatabase, $StatisticsTable> {
  $$StatisticsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cardsLearned => $composableBuilder(
      column: $table.cardsLearned,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cardsReviewed => $composableBuilder(
      column: $table.cardsReviewed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get testsTaken => $composableBuilder(
      column: $table.testsTaken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get averageScore => $composableBuilder(
      column: $table.averageScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studyTimeMinutes => $composableBuilder(
      column: $table.studyTimeMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xpEarned => $composableBuilder(
      column: $table.xpEarned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retentionCards => $composableBuilder(
      column: $table.retentionCards,
      builder: (column) => ColumnOrderings(column));
}

class $$StatisticsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatisticsTable> {
  $$StatisticsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get cardsLearned => $composableBuilder(
      column: $table.cardsLearned, builder: (column) => column);

  GeneratedColumn<int> get cardsReviewed => $composableBuilder(
      column: $table.cardsReviewed, builder: (column) => column);

  GeneratedColumn<int> get testsTaken => $composableBuilder(
      column: $table.testsTaken, builder: (column) => column);

  GeneratedColumn<double> get averageScore => $composableBuilder(
      column: $table.averageScore, builder: (column) => column);

  GeneratedColumn<int> get studyTimeMinutes => $composableBuilder(
      column: $table.studyTimeMinutes, builder: (column) => column);

  GeneratedColumn<int> get xpEarned =>
      $composableBuilder(column: $table.xpEarned, builder: (column) => column);

  GeneratedColumn<int> get retentionCards => $composableBuilder(
      column: $table.retentionCards, builder: (column) => column);
}

class $$StatisticsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StatisticsTable,
    StatisticsData,
    $$StatisticsTableFilterComposer,
    $$StatisticsTableOrderingComposer,
    $$StatisticsTableAnnotationComposer,
    $$StatisticsTableCreateCompanionBuilder,
    $$StatisticsTableUpdateCompanionBuilder,
    (
      StatisticsData,
      BaseReferences<_$AppDatabase, $StatisticsTable, StatisticsData>
    ),
    StatisticsData,
    PrefetchHooks Function()> {
  $$StatisticsTableTableManager(_$AppDatabase db, $StatisticsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatisticsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatisticsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatisticsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> cardsLearned = const Value.absent(),
            Value<int> cardsReviewed = const Value.absent(),
            Value<int> testsTaken = const Value.absent(),
            Value<double> averageScore = const Value.absent(),
            Value<int> studyTimeMinutes = const Value.absent(),
            Value<int> xpEarned = const Value.absent(),
            Value<int> retentionCards = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StatisticsCompanion(
            id: id,
            userId: userId,
            date: date,
            cardsLearned: cardsLearned,
            cardsReviewed: cardsReviewed,
            testsTaken: testsTaken,
            averageScore: averageScore,
            studyTimeMinutes: studyTimeMinutes,
            xpEarned: xpEarned,
            retentionCards: retentionCards,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required DateTime date,
            Value<int> cardsLearned = const Value.absent(),
            Value<int> cardsReviewed = const Value.absent(),
            Value<int> testsTaken = const Value.absent(),
            Value<double> averageScore = const Value.absent(),
            Value<int> studyTimeMinutes = const Value.absent(),
            Value<int> xpEarned = const Value.absent(),
            Value<int> retentionCards = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StatisticsCompanion.insert(
            id: id,
            userId: userId,
            date: date,
            cardsLearned: cardsLearned,
            cardsReviewed: cardsReviewed,
            testsTaken: testsTaken,
            averageScore: averageScore,
            studyTimeMinutes: studyTimeMinutes,
            xpEarned: xpEarned,
            retentionCards: retentionCards,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StatisticsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StatisticsTable,
    StatisticsData,
    $$StatisticsTableFilterComposer,
    $$StatisticsTableOrderingComposer,
    $$StatisticsTableAnnotationComposer,
    $$StatisticsTableCreateCompanionBuilder,
    $$StatisticsTableUpdateCompanionBuilder,
    (
      StatisticsData,
      BaseReferences<_$AppDatabase, $StatisticsTable, StatisticsData>
    ),
    StatisticsData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DecksTableTableManager get decks =>
      $$DecksTableTableManager(_db, _db.decks);
  $$WordCardsTableTableManager get wordCards =>
      $$WordCardsTableTableManager(_db, _db.wordCards);
  $$ArticleCardsTableTableManager get articleCards =>
      $$ArticleCardsTableTableManager(_db, _db.articleCards);
  $$SentenceCardsTableTableManager get sentenceCards =>
      $$SentenceCardsTableTableManager(_db, _db.sentenceCards);
  $$LearningSessionsTableTableManager get learningSessions =>
      $$LearningSessionsTableTableManager(_db, _db.learningSessions);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$XpHistoryTableTableManager get xpHistory =>
      $$XpHistoryTableTableManager(_db, _db.xpHistory);
  $$StreakDataTableTableManager get streakData =>
      $$StreakDataTableTableManager(_db, _db.streakData);
  $$TestsTableTableManager get tests =>
      $$TestsTableTableManager(_db, _db.tests);
  $$TestSessionsTableTableManager get testSessions =>
      $$TestSessionsTableTableManager(_db, _db.testSessions);
  $$StatisticsTableTableManager get statistics =>
      $$StatisticsTableTableManager(_db, _db.statistics);
}
