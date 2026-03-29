// lib/core/tts/speech_plan_builder.dart
import 'tts_segment.dart';

class SpeechPlanBuilder {

  static String localeForLangCode(String langCode) {
    const map = {
      'de': 'de-DE',
      'uk': 'uk-UA',
      'en': 'en-US',
      'fr': 'fr-FR',
      'it': 'it-IT',
      'es': 'es-ES',
      'pl': 'pl-PL',
      'pt': 'pt-PT',
      'tr': 'tr-TR',
      'ar': 'ar-SA',
    };
    return map[langCode.toLowerCase()] ?? 'en-US';
  }

  /// Картка: німецьке слово → переклад рідною
  static List<TtsSegment> wordCard({
    required String germanWord,
    required String nativeTranslation,
    required String nativeLangCode,
    double germanRate = 0.9,
    double nativeRate = 1.0,
  }) {
    return [
      TtsSegment(text: germanWord, locale: 'de-DE', rate: germanRate),
      TtsSegment(text: nativeTranslation, locale: localeForLangCode(nativeLangCode), rate: nativeRate),
    ];
  }

  /// Приклад речення: тільки німецькою
  static List<TtsSegment> exampleSentence({
    required String sentence,
    double rate = 0.85,
  }) {
    return [
      TtsSegment(text: sentence, locale: 'de-DE', rate: rate),
    ];
  }

  /// ✅ НОВЕ: Повна картка з прикладом
  /// Черговість: слово🇩🇪 → переклад🇺🇦→ приклад🇩🇪  → переклад прикладу🇺🇦
  static List<TtsSegment> fullCardWithExample({
    required String germanWord,
    String? exampleSentenceDe,
    String? nativeTranslation,
    String? exampleTranslationNative,
    String nativeLangCode = 'uk',
  }) {
    final nativeLocale = localeForLangCode(nativeLangCode);

    return [
      // 1) 🇩🇪 Німецьке слово
      if (germanWord.trim().isNotEmpty)
        TtsSegment(text: germanWord.trim(), locale: 'de-DE', rate: 1.0),

      // 2) 🇺🇦 Переклад слова
      if (nativeTranslation != null && nativeTranslation.trim().isNotEmpty)
        TtsSegment(text: nativeTranslation.trim(), locale: nativeLocale, rate: 1.0),

      // 3) 🇩🇪 Приклад речення
      if (exampleSentenceDe != null && exampleSentenceDe.trim().isNotEmpty)
        TtsSegment(text: exampleSentenceDe.trim(), locale: 'de-DE', rate: 1.0),

      // 4) 🇺🇦 Переклад прикладу
      if (exampleTranslationNative != null && exampleTranslationNative.trim().isNotEmpty)
        TtsSegment(text: exampleTranslationNative.trim(), locale: nativeLocale, rate: 1.0),
    ];
  }

  /// Діалог: почергове озвучення реплік
  static List<TtsSegment> dialogue(List<Map<String, String>> lines) {
    return lines.map((line) => TtsSegment(
      text: line['text'] ?? '',
      locale: localeForLangCode(line['lang'] ?? 'de'),
      rate: 0.9,
    )).toList();
  }
}