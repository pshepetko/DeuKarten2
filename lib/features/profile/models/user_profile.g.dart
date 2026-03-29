// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      joinedDate: DateTime.parse(json['joinedDate'] as String),
      settings: AppSettings.fromJson(json['settings'] as Map<String, dynamic>),
      learningPrefs: LearningPreferences.fromJson(
          json['learningPrefs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'joinedDate': instance.joinedDate.toIso8601String(),
      'settings': instance.settings,
      'learningPrefs': instance.learningPrefs,
    };

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      language: json['language'] as String? ?? 'de',
      darkMode: json['darkMode'] as bool? ?? false,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      dailyReminder: json['dailyReminder'] as bool? ?? true,
      reminderTime: json['reminderTime'] as String? ?? '09:00',
      soundEffects: json['soundEffects'] as bool? ?? true,
      hapticFeedback: json['hapticFeedback'] as bool? ?? true,
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'darkMode': instance.darkMode,
      'notificationsEnabled': instance.notificationsEnabled,
      'dailyReminder': instance.dailyReminder,
      'reminderTime': instance.reminderTime,
      'soundEffects': instance.soundEffects,
      'hapticFeedback': instance.hapticFeedback,
    };

_$LearningPreferencesImpl _$$LearningPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$LearningPreferencesImpl(
      dailyGoal: (json['dailyGoal'] as num?)?.toInt() ?? 20,
      currentLevel: json['currentLevel'] as String? ?? 'A1',
      autoPlayAudio: json['autoPlayAudio'] as bool? ?? true,
      showTranscription: json['showTranscription'] as bool? ?? false,
      learningMode: json['learningMode'] as String? ?? 'standard',
      nativeLanguage: json['nativeLanguage'] as String? ?? 'uk',
    );

Map<String, dynamic> _$$LearningPreferencesImplToJson(
        _$LearningPreferencesImpl instance) =>
    <String, dynamic>{
      'dailyGoal': instance.dailyGoal,
      'currentLevel': instance.currentLevel,
      'autoPlayAudio': instance.autoPlayAudio,
      'showTranscription': instance.showTranscription,
      'learningMode': instance.learningMode,
      'nativeLanguage': instance.nativeLanguage,
    };
