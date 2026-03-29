// lib/core/tts/tts_service_native.dart
import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'tts_segment.dart';
import 'tts_service.dart';

VoiceGender _preferredGender = VoiceGender.female;

/// Фабрична функція для conditional import
TtsService createPlatformTtsService() => NativeTtsService();

class NativeTtsService implements TtsService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _initialized = false;
  final Set<String> _availableLanguages = {};
  Completer<void>? _speakCompleter;

  NativeTtsService() {
    _init();
  }

  // ─── Ініціалізація ─────────────────────────────

  Future<void> _init() async {
    if (_initialized) return;

    try {
      // Базові налаштування
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
      await _flutterTts.setSpeechRate(0.5);

      // iOS специфічні налаштування
      if (_isIOS) {
        await _flutterTts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.ambient,
          [
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
            IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
            IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          ],
          IosTextToSpeechAudioMode.voicePrompt,
        );
        // Дозволяє фонове аудіо не зупинятися
        await _flutterTts.setSharedInstance(true);
      }

      // Android специфічні налаштування
      if (_isAndroid) {
        final engines = await _flutterTts.getEngines;
        debugPrint('🔊 TTS engines: $engines');

        // Перевіряємо чи є Google TTS engine (найкраща якість)
        if (engines is List) {
          final googleEngine = engines.firstWhere(
                (e) => e.toString().contains('google'),
            orElse: () => null,
          );
          if (googleEngine != null) {
            await _flutterTts.setEngine(googleEngine.toString());
            debugPrint('🔊 TTS: використовую Google engine');
          }
        }
      }

      // Завантажуємо доступні мови
      await _loadLanguages();

      // Колбеки
      _flutterTts.setCompletionHandler(() {
        if (_speakCompleter != null && !_speakCompleter!.isCompleted) {
          _speakCompleter!.complete();
        }
      });

      _flutterTts.setErrorHandler((msg) {
        debugPrint('❌ TTS error: $msg');
        if (_speakCompleter != null && !_speakCompleter!.isCompleted) {
          _speakCompleter!.complete(); // не блокуємо чергу
        }
      });

      _flutterTts.setCancelHandler(() {
        if (_speakCompleter != null && !_speakCompleter!.isCompleted) {
          _speakCompleter!.complete();
        }
      });

      _initialized = true;
      debugPrint('🔊 TTS Native: ініціалізовано (${_platformName})');
    } catch (e) {
      debugPrint('❌ TTS init error: $e');
    }
  }

  Future<void> _loadLanguages() async {
    try {
      final languages = await _flutterTts.getLanguages;
      if (languages is List) {
        _availableLanguages.clear();
        for (final lang in languages) {
          _availableLanguages.add(lang.toString().toLowerCase());
        }
        debugPrint('🔊 TTS: ${_availableLanguages.length} мов доступно');
      }
    } catch (e) {
      debugPrint('⚠️ TTS: не вдалось завантажити мови: $e');
    }
  }

  // ─── Допоміжні ─────────────────────────────────

  bool get _isIOS => !kIsWeb && Platform.isIOS;
  bool get _isAndroid => !kIsWeb && Platform.isAndroid;
  bool get _isMacOS => !kIsWeb && Platform.isMacOS;

  String get _platformName {
    if (kIsWeb) return 'web';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    if (Platform.isMacOS) return 'macOS';
    if (Platform.isWindows) return 'Windows';
    if (Platform.isLinux) return 'Linux';
    return 'unknown';
  }

  /// Конвертація locale для flutter_tts
  /// flutter_tts приймає формат "uk-UA", "de-DE" тощо
  String _normalizeLocale(String locale) {
    // Забезпечуємо формат "xx-YY"
    final parts = locale.split(RegExp(r'[-_]'));
    if (parts.length >= 2) {
      return '${parts[0].toLowerCase()}-${parts[1].toUpperCase()}';
    }
    // Якщо тільки "uk" → додаємо країну
    switch (parts[0].toLowerCase()) {
      case 'uk':
        return 'uk-UA';
      case 'de':
        return 'de-DE';
      case 'en':
        return 'en-US';
      case 'fr':
        return 'fr-FR';
      case 'it':
        return 'it-IT';
      case 'es':
        return 'es-ES';
      case 'pl':
        return 'pl-PL';
      case 'pt':
        return 'pt-PT';
      case 'tr':
        return 'tr-TR';
      case 'ar':
        return 'ar-SA';
      default:
        return locale;
    }
  }

  String _normalizePrefix(String locale) {
    return locale.split(RegExp(r'[-_]')).first.toLowerCase();
  }

  bool _isLocaleAvailable(String locale) {
    final normalized = _normalizeLocale(locale).toLowerCase();
    final prefix = _normalizePrefix(locale);

    // Точний match
    if (_availableLanguages.contains(normalized)) return true;

    // Prefix match: "uk" in "uk-ua"
    for (final lang in _availableLanguages) {
      if (_normalizePrefix(lang) == prefix) return true;
    }

    return false;
  }

  /// flutter_tts rate: 0.0 - 1.0 (0.5 = нормальна)
  /// наш rate: 0.5 - 2.0 (1.0 = нормальна)
  /// Конвертація: наш 1.0 → flutter_tts 0.5
  double _convertRate(double ourRate) {
    return (ourRate * 0.5).clamp(0.1, 1.0);
  }

  // ─── Озвучення одного сегмента ────────────────

  Future<void> _speakOne(
      TtsSegment segment, {
        required bool skipIfVoiceUnavailable,
      }) async {
    final text = segment.text.trim();
    if (text.isEmpty) return;

    await _init();

    final locale = _normalizeLocale(segment.locale);

    // Перевірка доступності мови
    if (!_isLocaleAvailable(locale)) {
      debugPrint('⚠️ TTS: мова "$locale" недоступна на $_platformName');
      if (skipIfVoiceUnavailable) {
        debugPrint('   → пропускаємо: "$text"');
        return;
      }
    }

    try {
      // Встановлюємо мову
      final langResult = await _flutterTts.setLanguage(locale);
      if (langResult != 1) {
        debugPrint('⚠️ TTS: не вдалось встановити мову $locale');
        // Спробуємо тільки prefix
        final prefix = _normalizePrefix(locale);
        await _flutterTts.setLanguage(prefix);
      }

      // Встановлюємо швидкість
      await _flutterTts.setSpeechRate(_convertRate(segment.rate));

      debugPrint('🗣️ TTS [$_platformName]: "$text" → $locale (rate: ${segment.rate})');

      // Говоримо і чекаємо завершення
      _speakCompleter = Completer<void>();

      await _flutterTts.speak(text);

      // Чекаємо завершення з таймаутом
      await Future.any([
        _speakCompleter!.future,
        Future.delayed(Duration(milliseconds: text.length * 150 + 5000)),
      ]);

      // Мала пауза між сегментами для природності
      await Future.delayed(const Duration(milliseconds: 300));
    } catch (e) {
      debugPrint('❌ TTS speak error: $e');
    }
  }

  // ─── Публічний API ────────────────────────────

  @override
  Future<void> speakSegments(
      List<TtsSegment> segments, {
        bool cancelPrevious = true,
        bool skipIfVoiceUnavailable = true,
      }) async {
    if (cancelPrevious) {
      await _flutterTts.stop();
      await Future.delayed(const Duration(milliseconds: 50));
    }

    for (final seg in segments) {
      await _speakOne(seg, skipIfVoiceUnavailable: skipIfVoiceUnavailable);
    }
  }

  @override
  Future<void> speak(String text, {String locale = 'de-DE', double rate = 1.0}) {
    return speakSegments([
      TtsSegment(text: text, locale: locale, rate: rate),
    ]);
  }

  @override
  Future<void> stop() async {
    try {
      await _flutterTts.stop();
      if (_speakCompleter != null && !_speakCompleter!.isCompleted) {
        _speakCompleter!.complete();
      }
    } catch (e) {
      debugPrint('⚠️ TTS stop error: $e');
    }
  }

  @override
  void setVoiceGender(VoiceGender gender) {
    _preferredGender = gender;
    _applyPreferredVoice();
    debugPrint('🔊 TTS: голос → ${gender == VoiceGender.female ? "👩 жіночий" : "👨 чоловічий"}');
  }

  Future<void> _applyPreferredVoice() async {
    try {
      final voices = await _flutterTts.getVoices as List<dynamic>?;
      if (voices == null) return;

      final femaleKw = ['female', 'anna', 'petra', 'katja', 'marlene', 'vicki', 'hedda', 'polina', 'oksana'];
      final maleKw = ['male', 'hans', 'stefan', 'conrad', 'ostap', 'thomas', 'daniel', 'florian'];
      final keywords = _preferredGender == VoiceGender.female ? femaleKw : maleKw;

      for (final voice in voices) {
        if (voice is Map) {
          final name = (voice['name'] ?? '').toString().toLowerCase();
          for (final kw in keywords) {
            if (name.contains(kw)) {
              await _flutterTts.setVoice({
                'name': voice['name'].toString(),
                'locale': voice['locale'].toString(),
              });
              debugPrint('🗣️ Обрано: "${voice['name']}"');
              return;
            }
          }
        }
      }
    } catch (e) {
      debugPrint('⚠️ TTS voice error: $e');
    }
  }

  @override
  Future<bool> isLanguageAvailable(String locale) async {
    await _init();
    return _isLocaleAvailable(locale);
  }

  @override
  Future<List<String>> getAvailableLanguages() async {
    await _init();
    return _availableLanguages.toList()..sort();
  }

  @override
  Future<Map<String, dynamic>> diagnose() async {
    await _init();

    final hasUk = _isLocaleAvailable('uk-UA');
    final hasDe = _isLocaleAvailable('de-DE');
    final hasEn = _isLocaleAvailable('en-US');

    // Отримуємо голоси (де можливо)
    List<dynamic>? voices;
    try {
      voices = await _flutterTts.getVoices as List<dynamic>?;
    } catch (_) {}

    return {
      'platform': _platformName,
      'initialized': _initialized,
      'totalLanguages': _availableLanguages.length,
      'languages': _availableLanguages.toList()..sort(),
      'hasGerman': hasDe,
      'hasUkrainian': hasUk,
      'hasEnglish': hasEn,
      'totalVoices': voices?.length ?? 'unknown',
    };
  }
}


