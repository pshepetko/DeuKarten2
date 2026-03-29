// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatisticsImpl _$$UserStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatisticsImpl(
      totalCardsLearned: (json['totalCardsLearned'] as num).toInt(),
      totalSessionsCompleted: (json['totalSessionsCompleted'] as num).toInt(),
      totalStudyTimeMinutes: (json['totalStudyTimeMinutes'] as num).toInt(),
      currentStreak: (json['currentStreak'] as num).toInt(),
      longestStreak: (json['longestStreak'] as num).toInt(),
      averageAccuracy: (json['averageAccuracy'] as num).toDouble(),
      totalXp: (json['totalXp'] as num).toInt(),
      currentLevel: (json['currentLevel'] as num).toInt(),
      last30Days: (json['last30Days'] as List<dynamic>)
          .map((e) => DailyActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardsByLevel: Map<String, int>.from(json['cardsByLevel'] as Map),
      weakAreas: Map<String, int>.from(json['weakAreas'] as Map),
    );

Map<String, dynamic> _$$UserStatisticsImplToJson(
        _$UserStatisticsImpl instance) =>
    <String, dynamic>{
      'totalCardsLearned': instance.totalCardsLearned,
      'totalSessionsCompleted': instance.totalSessionsCompleted,
      'totalStudyTimeMinutes': instance.totalStudyTimeMinutes,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'averageAccuracy': instance.averageAccuracy,
      'totalXp': instance.totalXp,
      'currentLevel': instance.currentLevel,
      'last30Days': instance.last30Days,
      'cardsByLevel': instance.cardsByLevel,
      'weakAreas': instance.weakAreas,
    };

_$DailyActivityImpl _$$DailyActivityImplFromJson(Map<String, dynamic> json) =>
    _$DailyActivityImpl(
      date: DateTime.parse(json['date'] as String),
      cardsStudied: (json['cardsStudied'] as num).toInt(),
      xpEarned: (json['xpEarned'] as num).toInt(),
      studyTimeMinutes: (json['studyTimeMinutes'] as num).toInt(),
      accuracy: (json['accuracy'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyActivityImplToJson(_$DailyActivityImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'cardsStudied': instance.cardsStudied,
      'xpEarned': instance.xpEarned,
      'studyTimeMinutes': instance.studyTimeMinutes,
      'accuracy': instance.accuracy,
    };
