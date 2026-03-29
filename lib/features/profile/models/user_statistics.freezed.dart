// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStatistics _$UserStatisticsFromJson(Map<String, dynamic> json) {
  return _UserStatistics.fromJson(json);
}

/// @nodoc
mixin _$UserStatistics {
  int get totalCardsLearned => throw _privateConstructorUsedError;
  int get totalSessionsCompleted => throw _privateConstructorUsedError;
  int get totalStudyTimeMinutes => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  double get averageAccuracy => throw _privateConstructorUsedError;
  int get totalXp => throw _privateConstructorUsedError;
  int get currentLevel => throw _privateConstructorUsedError;
  List<DailyActivity> get last30Days => throw _privateConstructorUsedError;
  Map<String, int> get cardsByLevel => throw _privateConstructorUsedError;
  Map<String, int> get weakAreas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatisticsCopyWith<UserStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsCopyWith<$Res> {
  factory $UserStatisticsCopyWith(
          UserStatistics value, $Res Function(UserStatistics) then) =
      _$UserStatisticsCopyWithImpl<$Res, UserStatistics>;
  @useResult
  $Res call(
      {int totalCardsLearned,
      int totalSessionsCompleted,
      int totalStudyTimeMinutes,
      int currentStreak,
      int longestStreak,
      double averageAccuracy,
      int totalXp,
      int currentLevel,
      List<DailyActivity> last30Days,
      Map<String, int> cardsByLevel,
      Map<String, int> weakAreas});
}

/// @nodoc
class _$UserStatisticsCopyWithImpl<$Res, $Val extends UserStatistics>
    implements $UserStatisticsCopyWith<$Res> {
  _$UserStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCardsLearned = null,
    Object? totalSessionsCompleted = null,
    Object? totalStudyTimeMinutes = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? averageAccuracy = null,
    Object? totalXp = null,
    Object? currentLevel = null,
    Object? last30Days = null,
    Object? cardsByLevel = null,
    Object? weakAreas = null,
  }) {
    return _then(_value.copyWith(
      totalCardsLearned: null == totalCardsLearned
          ? _value.totalCardsLearned
          : totalCardsLearned // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessionsCompleted: null == totalSessionsCompleted
          ? _value.totalSessionsCompleted
          : totalSessionsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalStudyTimeMinutes: null == totalStudyTimeMinutes
          ? _value.totalStudyTimeMinutes
          : totalStudyTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      averageAccuracy: null == averageAccuracy
          ? _value.averageAccuracy
          : averageAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      last30Days: null == last30Days
          ? _value.last30Days
          : last30Days // ignore: cast_nullable_to_non_nullable
              as List<DailyActivity>,
      cardsByLevel: null == cardsByLevel
          ? _value.cardsByLevel
          : cardsByLevel // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      weakAreas: null == weakAreas
          ? _value.weakAreas
          : weakAreas // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatisticsImplCopyWith<$Res>
    implements $UserStatisticsCopyWith<$Res> {
  factory _$$UserStatisticsImplCopyWith(_$UserStatisticsImpl value,
          $Res Function(_$UserStatisticsImpl) then) =
      __$$UserStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCardsLearned,
      int totalSessionsCompleted,
      int totalStudyTimeMinutes,
      int currentStreak,
      int longestStreak,
      double averageAccuracy,
      int totalXp,
      int currentLevel,
      List<DailyActivity> last30Days,
      Map<String, int> cardsByLevel,
      Map<String, int> weakAreas});
}

/// @nodoc
class __$$UserStatisticsImplCopyWithImpl<$Res>
    extends _$UserStatisticsCopyWithImpl<$Res, _$UserStatisticsImpl>
    implements _$$UserStatisticsImplCopyWith<$Res> {
  __$$UserStatisticsImplCopyWithImpl(
      _$UserStatisticsImpl _value, $Res Function(_$UserStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCardsLearned = null,
    Object? totalSessionsCompleted = null,
    Object? totalStudyTimeMinutes = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? averageAccuracy = null,
    Object? totalXp = null,
    Object? currentLevel = null,
    Object? last30Days = null,
    Object? cardsByLevel = null,
    Object? weakAreas = null,
  }) {
    return _then(_$UserStatisticsImpl(
      totalCardsLearned: null == totalCardsLearned
          ? _value.totalCardsLearned
          : totalCardsLearned // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessionsCompleted: null == totalSessionsCompleted
          ? _value.totalSessionsCompleted
          : totalSessionsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalStudyTimeMinutes: null == totalStudyTimeMinutes
          ? _value.totalStudyTimeMinutes
          : totalStudyTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      averageAccuracy: null == averageAccuracy
          ? _value.averageAccuracy
          : averageAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      last30Days: null == last30Days
          ? _value._last30Days
          : last30Days // ignore: cast_nullable_to_non_nullable
              as List<DailyActivity>,
      cardsByLevel: null == cardsByLevel
          ? _value._cardsByLevel
          : cardsByLevel // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      weakAreas: null == weakAreas
          ? _value._weakAreas
          : weakAreas // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatisticsImpl implements _UserStatistics {
  const _$UserStatisticsImpl(
      {required this.totalCardsLearned,
      required this.totalSessionsCompleted,
      required this.totalStudyTimeMinutes,
      required this.currentStreak,
      required this.longestStreak,
      required this.averageAccuracy,
      required this.totalXp,
      required this.currentLevel,
      required final List<DailyActivity> last30Days,
      required final Map<String, int> cardsByLevel,
      required final Map<String, int> weakAreas})
      : _last30Days = last30Days,
        _cardsByLevel = cardsByLevel,
        _weakAreas = weakAreas;

  factory _$UserStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatisticsImplFromJson(json);

  @override
  final int totalCardsLearned;
  @override
  final int totalSessionsCompleted;
  @override
  final int totalStudyTimeMinutes;
  @override
  final int currentStreak;
  @override
  final int longestStreak;
  @override
  final double averageAccuracy;
  @override
  final int totalXp;
  @override
  final int currentLevel;
  final List<DailyActivity> _last30Days;
  @override
  List<DailyActivity> get last30Days {
    if (_last30Days is EqualUnmodifiableListView) return _last30Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_last30Days);
  }

  final Map<String, int> _cardsByLevel;
  @override
  Map<String, int> get cardsByLevel {
    if (_cardsByLevel is EqualUnmodifiableMapView) return _cardsByLevel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cardsByLevel);
  }

  final Map<String, int> _weakAreas;
  @override
  Map<String, int> get weakAreas {
    if (_weakAreas is EqualUnmodifiableMapView) return _weakAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weakAreas);
  }

  @override
  String toString() {
    return 'UserStatistics(totalCardsLearned: $totalCardsLearned, totalSessionsCompleted: $totalSessionsCompleted, totalStudyTimeMinutes: $totalStudyTimeMinutes, currentStreak: $currentStreak, longestStreak: $longestStreak, averageAccuracy: $averageAccuracy, totalXp: $totalXp, currentLevel: $currentLevel, last30Days: $last30Days, cardsByLevel: $cardsByLevel, weakAreas: $weakAreas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsImpl &&
            (identical(other.totalCardsLearned, totalCardsLearned) ||
                other.totalCardsLearned == totalCardsLearned) &&
            (identical(other.totalSessionsCompleted, totalSessionsCompleted) ||
                other.totalSessionsCompleted == totalSessionsCompleted) &&
            (identical(other.totalStudyTimeMinutes, totalStudyTimeMinutes) ||
                other.totalStudyTimeMinutes == totalStudyTimeMinutes) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.averageAccuracy, averageAccuracy) ||
                other.averageAccuracy == averageAccuracy) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            const DeepCollectionEquality()
                .equals(other._last30Days, _last30Days) &&
            const DeepCollectionEquality()
                .equals(other._cardsByLevel, _cardsByLevel) &&
            const DeepCollectionEquality()
                .equals(other._weakAreas, _weakAreas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCardsLearned,
      totalSessionsCompleted,
      totalStudyTimeMinutes,
      currentStreak,
      longestStreak,
      averageAccuracy,
      totalXp,
      currentLevel,
      const DeepCollectionEquality().hash(_last30Days),
      const DeepCollectionEquality().hash(_cardsByLevel),
      const DeepCollectionEquality().hash(_weakAreas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      __$$UserStatisticsImplCopyWithImpl<_$UserStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatisticsImplToJson(
      this,
    );
  }
}

abstract class _UserStatistics implements UserStatistics {
  const factory _UserStatistics(
      {required final int totalCardsLearned,
      required final int totalSessionsCompleted,
      required final int totalStudyTimeMinutes,
      required final int currentStreak,
      required final int longestStreak,
      required final double averageAccuracy,
      required final int totalXp,
      required final int currentLevel,
      required final List<DailyActivity> last30Days,
      required final Map<String, int> cardsByLevel,
      required final Map<String, int> weakAreas}) = _$UserStatisticsImpl;

  factory _UserStatistics.fromJson(Map<String, dynamic> json) =
      _$UserStatisticsImpl.fromJson;

  @override
  int get totalCardsLearned;
  @override
  int get totalSessionsCompleted;
  @override
  int get totalStudyTimeMinutes;
  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  double get averageAccuracy;
  @override
  int get totalXp;
  @override
  int get currentLevel;
  @override
  List<DailyActivity> get last30Days;
  @override
  Map<String, int> get cardsByLevel;
  @override
  Map<String, int> get weakAreas;
  @override
  @JsonKey(ignore: true)
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyActivity _$DailyActivityFromJson(Map<String, dynamic> json) {
  return _DailyActivity.fromJson(json);
}

/// @nodoc
mixin _$DailyActivity {
  DateTime get date => throw _privateConstructorUsedError;
  int get cardsStudied => throw _privateConstructorUsedError;
  int get xpEarned => throw _privateConstructorUsedError;
  int get studyTimeMinutes => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyActivityCopyWith<DailyActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyActivityCopyWith<$Res> {
  factory $DailyActivityCopyWith(
          DailyActivity value, $Res Function(DailyActivity) then) =
      _$DailyActivityCopyWithImpl<$Res, DailyActivity>;
  @useResult
  $Res call(
      {DateTime date,
      int cardsStudied,
      int xpEarned,
      int studyTimeMinutes,
      double accuracy});
}

/// @nodoc
class _$DailyActivityCopyWithImpl<$Res, $Val extends DailyActivity>
    implements $DailyActivityCopyWith<$Res> {
  _$DailyActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? cardsStudied = null,
    Object? xpEarned = null,
    Object? studyTimeMinutes = null,
    Object? accuracy = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cardsStudied: null == cardsStudied
          ? _value.cardsStudied
          : cardsStudied // ignore: cast_nullable_to_non_nullable
              as int,
      xpEarned: null == xpEarned
          ? _value.xpEarned
          : xpEarned // ignore: cast_nullable_to_non_nullable
              as int,
      studyTimeMinutes: null == studyTimeMinutes
          ? _value.studyTimeMinutes
          : studyTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyActivityImplCopyWith<$Res>
    implements $DailyActivityCopyWith<$Res> {
  factory _$$DailyActivityImplCopyWith(
          _$DailyActivityImpl value, $Res Function(_$DailyActivityImpl) then) =
      __$$DailyActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int cardsStudied,
      int xpEarned,
      int studyTimeMinutes,
      double accuracy});
}

/// @nodoc
class __$$DailyActivityImplCopyWithImpl<$Res>
    extends _$DailyActivityCopyWithImpl<$Res, _$DailyActivityImpl>
    implements _$$DailyActivityImplCopyWith<$Res> {
  __$$DailyActivityImplCopyWithImpl(
      _$DailyActivityImpl _value, $Res Function(_$DailyActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? cardsStudied = null,
    Object? xpEarned = null,
    Object? studyTimeMinutes = null,
    Object? accuracy = null,
  }) {
    return _then(_$DailyActivityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cardsStudied: null == cardsStudied
          ? _value.cardsStudied
          : cardsStudied // ignore: cast_nullable_to_non_nullable
              as int,
      xpEarned: null == xpEarned
          ? _value.xpEarned
          : xpEarned // ignore: cast_nullable_to_non_nullable
              as int,
      studyTimeMinutes: null == studyTimeMinutes
          ? _value.studyTimeMinutes
          : studyTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyActivityImpl implements _DailyActivity {
  const _$DailyActivityImpl(
      {required this.date,
      required this.cardsStudied,
      required this.xpEarned,
      required this.studyTimeMinutes,
      required this.accuracy});

  factory _$DailyActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyActivityImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int cardsStudied;
  @override
  final int xpEarned;
  @override
  final int studyTimeMinutes;
  @override
  final double accuracy;

  @override
  String toString() {
    return 'DailyActivity(date: $date, cardsStudied: $cardsStudied, xpEarned: $xpEarned, studyTimeMinutes: $studyTimeMinutes, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyActivityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.cardsStudied, cardsStudied) ||
                other.cardsStudied == cardsStudied) &&
            (identical(other.xpEarned, xpEarned) ||
                other.xpEarned == xpEarned) &&
            (identical(other.studyTimeMinutes, studyTimeMinutes) ||
                other.studyTimeMinutes == studyTimeMinutes) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, cardsStudied, xpEarned, studyTimeMinutes, accuracy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyActivityImplCopyWith<_$DailyActivityImpl> get copyWith =>
      __$$DailyActivityImplCopyWithImpl<_$DailyActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyActivityImplToJson(
      this,
    );
  }
}

abstract class _DailyActivity implements DailyActivity {
  const factory _DailyActivity(
      {required final DateTime date,
      required final int cardsStudied,
      required final int xpEarned,
      required final int studyTimeMinutes,
      required final double accuracy}) = _$DailyActivityImpl;

  factory _DailyActivity.fromJson(Map<String, dynamic> json) =
      _$DailyActivityImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get cardsStudied;
  @override
  int get xpEarned;
  @override
  int get studyTimeMinutes;
  @override
  double get accuracy;
  @override
  @JsonKey(ignore: true)
  _$$DailyActivityImplCopyWith<_$DailyActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
