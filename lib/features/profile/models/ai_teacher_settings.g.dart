// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_teacher_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AITeacherSettingsImpl _$$AITeacherSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$AITeacherSettingsImpl(
      enabled: json['enabled'] as bool? ?? true,
      personality: json['personality'] as String? ?? 'friendly',
      autoExplainGrammar: json['autoExplainGrammar'] as bool? ?? true,
      autoCorrectSentences: json['autoCorrectSentences'] as bool? ?? true,
      autoSpeakResponses: json['autoSpeakResponses'] as bool? ?? false,
      ttsSpeed: (json['ttsSpeed'] as num?)?.toDouble() ?? 0.7,
      ttsVoice: json['ttsVoice'] as String? ?? 'female',
      showSuggestions: json['showSuggestions'] as bool? ?? true,
      trackMistakes: json['trackMistakes'] as bool? ?? true,
    );

Map<String, dynamic> _$$AITeacherSettingsImplToJson(
        _$AITeacherSettingsImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'personality': instance.personality,
      'autoExplainGrammar': instance.autoExplainGrammar,
      'autoCorrectSentences': instance.autoCorrectSentences,
      'autoSpeakResponses': instance.autoSpeakResponses,
      'ttsSpeed': instance.ttsSpeed,
      'ttsVoice': instance.ttsVoice,
      'showSuggestions': instance.showSuggestions,
      'trackMistakes': instance.trackMistakes,
    };
