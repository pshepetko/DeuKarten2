// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  DateTime get joinedDate => throw _privateConstructorUsedError;
  AppSettings get settings => throw _privateConstructorUsedError;
  LearningPreferences get learningPrefs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? email,
      String? avatarUrl,
      DateTime joinedDate,
      AppSettings settings,
      LearningPreferences learningPrefs});

  $AppSettingsCopyWith<$Res> get settings;
  $LearningPreferencesCopyWith<$Res> get learningPrefs;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? joinedDate = null,
    Object? settings = null,
    Object? learningPrefs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedDate: null == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
      learningPrefs: null == learningPrefs
          ? _value.learningPrefs
          : learningPrefs // ignore: cast_nullable_to_non_nullable
              as LearningPreferences,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<$Res> get settings {
    return $AppSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LearningPreferencesCopyWith<$Res> get learningPrefs {
    return $LearningPreferencesCopyWith<$Res>(_value.learningPrefs, (value) {
      return _then(_value.copyWith(learningPrefs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? email,
      String? avatarUrl,
      DateTime joinedDate,
      AppSettings settings,
      LearningPreferences learningPrefs});

  @override
  $AppSettingsCopyWith<$Res> get settings;
  @override
  $LearningPreferencesCopyWith<$Res> get learningPrefs;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? joinedDate = null,
    Object? settings = null,
    Object? learningPrefs = null,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedDate: null == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
      learningPrefs: null == learningPrefs
          ? _value.learningPrefs
          : learningPrefs // ignore: cast_nullable_to_non_nullable
              as LearningPreferences,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.id,
      required this.name,
      this.email,
      this.avatarUrl,
      required this.joinedDate,
      required this.settings,
      required this.learningPrefs});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? avatarUrl;
  @override
  final DateTime joinedDate;
  @override
  final AppSettings settings;
  @override
  final LearningPreferences learningPrefs;

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, email: $email, avatarUrl: $avatarUrl, joinedDate: $joinedDate, settings: $settings, learningPrefs: $learningPrefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.joinedDate, joinedDate) ||
                other.joinedDate == joinedDate) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.learningPrefs, learningPrefs) ||
                other.learningPrefs == learningPrefs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, avatarUrl,
      joinedDate, settings, learningPrefs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String id,
      required final String name,
      final String? email,
      final String? avatarUrl,
      required final DateTime joinedDate,
      required final AppSettings settings,
      required final LearningPreferences learningPrefs}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get avatarUrl;
  @override
  DateTime get joinedDate;
  @override
  AppSettings get settings;
  @override
  LearningPreferences get learningPrefs;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  String get language => throw _privateConstructorUsedError;
  bool get darkMode => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  bool get dailyReminder => throw _privateConstructorUsedError;
  String get reminderTime => throw _privateConstructorUsedError;
  bool get soundEffects => throw _privateConstructorUsedError;
  bool get hapticFeedback => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {String language,
      bool darkMode,
      bool notificationsEnabled,
      bool dailyReminder,
      String reminderTime,
      bool soundEffects,
      bool hapticFeedback});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? darkMode = null,
    Object? notificationsEnabled = null,
    Object? dailyReminder = null,
    Object? reminderTime = null,
    Object? soundEffects = null,
    Object? hapticFeedback = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyReminder: null == dailyReminder
          ? _value.dailyReminder
          : dailyReminder // ignore: cast_nullable_to_non_nullable
              as bool,
      reminderTime: null == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as String,
      soundEffects: null == soundEffects
          ? _value.soundEffects
          : soundEffects // ignore: cast_nullable_to_non_nullable
              as bool,
      hapticFeedback: null == hapticFeedback
          ? _value.hapticFeedback
          : hapticFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String language,
      bool darkMode,
      bool notificationsEnabled,
      bool dailyReminder,
      String reminderTime,
      bool soundEffects,
      bool hapticFeedback});
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? darkMode = null,
    Object? notificationsEnabled = null,
    Object? dailyReminder = null,
    Object? reminderTime = null,
    Object? soundEffects = null,
    Object? hapticFeedback = null,
  }) {
    return _then(_$AppSettingsImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyReminder: null == dailyReminder
          ? _value.dailyReminder
          : dailyReminder // ignore: cast_nullable_to_non_nullable
              as bool,
      reminderTime: null == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as String,
      soundEffects: null == soundEffects
          ? _value.soundEffects
          : soundEffects // ignore: cast_nullable_to_non_nullable
              as bool,
      hapticFeedback: null == hapticFeedback
          ? _value.hapticFeedback
          : hapticFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl(
      {this.language = 'de',
      this.darkMode = false,
      this.notificationsEnabled = true,
      this.dailyReminder = true,
      this.reminderTime = '09:00',
      this.soundEffects = true,
      this.hapticFeedback = true});

  factory _$AppSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsImplFromJson(json);

  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final bool darkMode;
  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final bool dailyReminder;
  @override
  @JsonKey()
  final String reminderTime;
  @override
  @JsonKey()
  final bool soundEffects;
  @override
  @JsonKey()
  final bool hapticFeedback;

  @override
  String toString() {
    return 'AppSettings(language: $language, darkMode: $darkMode, notificationsEnabled: $notificationsEnabled, dailyReminder: $dailyReminder, reminderTime: $reminderTime, soundEffects: $soundEffects, hapticFeedback: $hapticFeedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.dailyReminder, dailyReminder) ||
                other.dailyReminder == dailyReminder) &&
            (identical(other.reminderTime, reminderTime) ||
                other.reminderTime == reminderTime) &&
            (identical(other.soundEffects, soundEffects) ||
                other.soundEffects == soundEffects) &&
            (identical(other.hapticFeedback, hapticFeedback) ||
                other.hapticFeedback == hapticFeedback));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      language,
      darkMode,
      notificationsEnabled,
      dailyReminder,
      reminderTime,
      soundEffects,
      hapticFeedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsImplToJson(
      this,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {final String language,
      final bool darkMode,
      final bool notificationsEnabled,
      final bool dailyReminder,
      final String reminderTime,
      final bool soundEffects,
      final bool hapticFeedback}) = _$AppSettingsImpl;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$AppSettingsImpl.fromJson;

  @override
  String get language;
  @override
  bool get darkMode;
  @override
  bool get notificationsEnabled;
  @override
  bool get dailyReminder;
  @override
  String get reminderTime;
  @override
  bool get soundEffects;
  @override
  bool get hapticFeedback;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LearningPreferences _$LearningPreferencesFromJson(Map<String, dynamic> json) {
  return _LearningPreferences.fromJson(json);
}

/// @nodoc
mixin _$LearningPreferences {
  int get dailyGoal => throw _privateConstructorUsedError;
  String get currentLevel => throw _privateConstructorUsedError;
  bool get autoPlayAudio => throw _privateConstructorUsedError;
  bool get showTranscription => throw _privateConstructorUsedError;
  String get learningMode => throw _privateConstructorUsedError;
  String get nativeLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearningPreferencesCopyWith<LearningPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningPreferencesCopyWith<$Res> {
  factory $LearningPreferencesCopyWith(
          LearningPreferences value, $Res Function(LearningPreferences) then) =
      _$LearningPreferencesCopyWithImpl<$Res, LearningPreferences>;
  @useResult
  $Res call(
      {int dailyGoal,
      String currentLevel,
      bool autoPlayAudio,
      bool showTranscription,
      String learningMode,
      String nativeLanguage});
}

/// @nodoc
class _$LearningPreferencesCopyWithImpl<$Res, $Val extends LearningPreferences>
    implements $LearningPreferencesCopyWith<$Res> {
  _$LearningPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyGoal = null,
    Object? currentLevel = null,
    Object? autoPlayAudio = null,
    Object? showTranscription = null,
    Object? learningMode = null,
    Object? nativeLanguage = null,
  }) {
    return _then(_value.copyWith(
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      autoPlayAudio: null == autoPlayAudio
          ? _value.autoPlayAudio
          : autoPlayAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      showTranscription: null == showTranscription
          ? _value.showTranscription
          : showTranscription // ignore: cast_nullable_to_non_nullable
              as bool,
      learningMode: null == learningMode
          ? _value.learningMode
          : learningMode // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguage: null == nativeLanguage
          ? _value.nativeLanguage
          : nativeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningPreferencesImplCopyWith<$Res>
    implements $LearningPreferencesCopyWith<$Res> {
  factory _$$LearningPreferencesImplCopyWith(_$LearningPreferencesImpl value,
          $Res Function(_$LearningPreferencesImpl) then) =
      __$$LearningPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dailyGoal,
      String currentLevel,
      bool autoPlayAudio,
      bool showTranscription,
      String learningMode,
      String nativeLanguage});
}

/// @nodoc
class __$$LearningPreferencesImplCopyWithImpl<$Res>
    extends _$LearningPreferencesCopyWithImpl<$Res, _$LearningPreferencesImpl>
    implements _$$LearningPreferencesImplCopyWith<$Res> {
  __$$LearningPreferencesImplCopyWithImpl(_$LearningPreferencesImpl _value,
      $Res Function(_$LearningPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyGoal = null,
    Object? currentLevel = null,
    Object? autoPlayAudio = null,
    Object? showTranscription = null,
    Object? learningMode = null,
    Object? nativeLanguage = null,
  }) {
    return _then(_$LearningPreferencesImpl(
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      autoPlayAudio: null == autoPlayAudio
          ? _value.autoPlayAudio
          : autoPlayAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      showTranscription: null == showTranscription
          ? _value.showTranscription
          : showTranscription // ignore: cast_nullable_to_non_nullable
              as bool,
      learningMode: null == learningMode
          ? _value.learningMode
          : learningMode // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguage: null == nativeLanguage
          ? _value.nativeLanguage
          : nativeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningPreferencesImpl implements _LearningPreferences {
  const _$LearningPreferencesImpl(
      {this.dailyGoal = 20,
      this.currentLevel = 'A1',
      this.autoPlayAudio = true,
      this.showTranscription = false,
      this.learningMode = 'standard',
      this.nativeLanguage = 'uk'});

  factory _$LearningPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final int dailyGoal;
  @override
  @JsonKey()
  final String currentLevel;
  @override
  @JsonKey()
  final bool autoPlayAudio;
  @override
  @JsonKey()
  final bool showTranscription;
  @override
  @JsonKey()
  final String learningMode;
  @override
  @JsonKey()
  final String nativeLanguage;

  @override
  String toString() {
    return 'LearningPreferences(dailyGoal: $dailyGoal, currentLevel: $currentLevel, autoPlayAudio: $autoPlayAudio, showTranscription: $showTranscription, learningMode: $learningMode, nativeLanguage: $nativeLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningPreferencesImpl &&
            (identical(other.dailyGoal, dailyGoal) ||
                other.dailyGoal == dailyGoal) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.autoPlayAudio, autoPlayAudio) ||
                other.autoPlayAudio == autoPlayAudio) &&
            (identical(other.showTranscription, showTranscription) ||
                other.showTranscription == showTranscription) &&
            (identical(other.learningMode, learningMode) ||
                other.learningMode == learningMode) &&
            (identical(other.nativeLanguage, nativeLanguage) ||
                other.nativeLanguage == nativeLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dailyGoal, currentLevel,
      autoPlayAudio, showTranscription, learningMode, nativeLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningPreferencesImplCopyWith<_$LearningPreferencesImpl> get copyWith =>
      __$$LearningPreferencesImplCopyWithImpl<_$LearningPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningPreferencesImplToJson(
      this,
    );
  }
}

abstract class _LearningPreferences implements LearningPreferences {
  const factory _LearningPreferences(
      {final int dailyGoal,
      final String currentLevel,
      final bool autoPlayAudio,
      final bool showTranscription,
      final String learningMode,
      final String nativeLanguage}) = _$LearningPreferencesImpl;

  factory _LearningPreferences.fromJson(Map<String, dynamic> json) =
      _$LearningPreferencesImpl.fromJson;

  @override
  int get dailyGoal;
  @override
  String get currentLevel;
  @override
  bool get autoPlayAudio;
  @override
  bool get showTranscription;
  @override
  String get learningMode;
  @override
  String get nativeLanguage;
  @override
  @JsonKey(ignore: true)
  _$$LearningPreferencesImplCopyWith<_$LearningPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
