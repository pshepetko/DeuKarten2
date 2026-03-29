// lib/core/tts/tts_service.dart
import 'tts_segment.dart';

enum VoiceGender { female, male }

abstract class TtsService {
  /// Озвучити список сегментів послідовно
  Future<void> speakSegments(
      List<TtsSegment> segments, {
        bool cancelPrevious = true,
        bool skipIfVoiceUnavailable = true,
      });

  /// Озвучити один текст однією мовою
  Future<void> speak(String text, {String locale = 'de-DE', double rate = 1.0});

  /// Зупинити озвучення
  Future<void> stop();

  /// Перевірити чи є голос для мови
  Future<bool> isLanguageAvailable(String locale);

  /// Отримати список доступних мов
  Future<List<String>> getAvailableLanguages();

  /// Діагностика
  Future<Map<String, dynamic>> diagnose();

  void setVoiceGender(VoiceGender gender);

}