// lib/core/tts/tts_tracker.dart

import 'tts_service.dart';
import 'tts_service_factory.dart';

/// Єдиний TTS сервіс на весь додаток
final TtsService globalTtsService = createTtsService();

/// Трекер автоозвучення — запобігає повторному озвученню
class TtsAutoSpeakTracker {
  TtsAutoSpeakTracker._();

  /// Яке слово вже озвучено на FRONT
  static String? _lastFrontWord;

  /// Яке слово вже озвучено на BACK
  static String? _lastBackWord;

  /// Чи вже озвучено front для цього слова?
  static bool wasFrontSpoken(String? word) {
    if (word == null || word.isEmpty) return true;
    return _lastFrontWord == word;
  }

  /// Чи вже озвучено back для цього слова?
  static bool wasBackSpoken(String? word) {
    if (word == null || word.isEmpty) return true;
    return _lastBackWord == word;
  }

  /// Позначити front як озвучений
  static void markFrontSpoken(String? word) {
    _lastFrontWord = word;
  }

  /// Позначити back як озвучений
  static void markBackSpoken(String? word) {
    _lastBackWord = word;
  }

  /// ✅ Скинути ВСЕ — викликати при свайпі на НОВУ картку
  static void reset() {
    _lastFrontWord = null;
    _lastBackWord = null;
  }

  /// Скинути тільки front (якщо потрібно)
  static void resetFront() {
    _lastFrontWord = null;
  }

  /// Скинути тільки back
  static void resetBack() {
    _lastBackWord = null;
  }
}