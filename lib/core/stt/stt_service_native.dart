// lib/core/stt/stt_service_native.dart
import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

import 'stt_result.dart';
import 'stt_service.dart';

class NativeSttService implements SttService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _initialized = false;
  SttStatus _status = SttStatus.idle;
  void Function(SttResult)? _onResult;
  void Function(SttStatus)? _onStatus;
  void Function(String)? _onError;
  String _currentLocale = 'de-DE';

  @override
  SttStatus get status => _status;

  void _setStatus(SttStatus newStatus) {
    _status = newStatus;
    _onStatus?.call(newStatus);
  }

  Future<void> _init() async {
    if (_initialized) return;

    try {
      _initialized = await _speech.initialize(
        onStatus: (status) {
          debugPrint('🎤 STT Native status: $status');
          switch (status) {
            case 'listening':
              _setStatus(SttStatus.listening);
            case 'notListening':
              _setStatus(SttStatus.processing);
            case 'done':
              _setStatus(SttStatus.idle);
            default:
              break;
          }
        },
        onError: (error) {
          debugPrint('❌ STT Native error: ${error.errorMsg}');
          _onError?.call(error.errorMsg);
          _setStatus(SttStatus.error);
        },
      );

      if (_initialized) {
        final locales = await _speech.locales();
        debugPrint('🎤 STT Native: ${locales.length} мов');
        debugPrint('🎤 STT: ініціалізовано на ${Platform.operatingSystem}');
      }
    } catch (e) {
      debugPrint('❌ STT init error: $e');
    }
  }

  @override
  Future<bool> isAvailable() async {
    await _init();
    return _initialized;
  }

  @override
  Future<bool> requestPermission() async {
    try {
      // Спочатку перевіряємо поточний статус
      var status = await Permission.microphone.status;
      debugPrint('🎤 STT: поточний статус мікрофона: $status');

      if (status.isGranted) {
        return true;
      }

      // Запитуємо дозвіл
      status = await Permission.microphone.request();
      debugPrint('🎤 STT: після запиту: $status');

      if (status.isGranted) {
        return true;
      }

      // Якщо відхилено назавжди — відкриваємо налаштування
      if (status.isPermanentlyDenied) {
        debugPrint('🎤 STT: дозвіл відхилено назавжди, відкриваю налаштування...');
        await openAppSettings();
      }

      return false;
    } catch (e) {
      debugPrint('⚠️ STT: помилка запиту дозволу: $e');
      // Якщо permission_handler не працює — пробуємо без нього
      return true; // дозволяємо спробувати запуститися
    }
  }

  @override
  Future<bool> startListening({
    required String locale,
    required void Function(SttResult result) onResult,
    void Function(SttStatus status)? onStatus,
    void Function(String error)? onError,
    bool continuous = true,
    bool interimResults = true,
  }) async {
    // Перевіряємо дозвіл
    final micPermission = await Permission.microphone.status;
    if (!micPermission.isGranted) {
      final granted = await requestPermission();
      if (!granted) {
        onError?.call('Мікрофон не дозволено');
        return false;
      }
    }

    await _init();

    if (!_initialized) {
      onError?.call('Speech-to-Text недоступний');
      return false;
    }

    _onResult = onResult;
    _onStatus = onStatus;
    _onError = onError;
    _currentLocale = locale;

    try {
      await _speech.listen(
        localeId: locale,
        listenMode: continuous
            ? stt.ListenMode.dictation
            : stt.ListenMode.search,
        cancelOnError: false,
        partialResults: interimResults,
        onResult: (result) {
          final sttResult = SttResult(
            text: result.recognizedWords.trim(),
            isFinal: result.finalResult,
            confidence: result.confidence,
            locale: _currentLocale,
          );

          if (sttResult.text.isNotEmpty) {
            debugPrint('🎤 ${result.finalResult ? "✅" : "..."} '
                '"${sttResult.text}" '
                '(${(sttResult.confidence * 100).toStringAsFixed(0)}%)');
            _onResult?.call(sttResult);
          }
        },
      );

      _setStatus(SttStatus.listening);
      return true;
    } catch (e) {
      debugPrint('❌ STT start error: $e');
      onError?.call('Не вдалось запустити: $e');
      return false;
    }
  }

  @override
  Future<void> stopListening() async {
    try {
      await _speech.stop();
    } catch (_) {}
    _setStatus(SttStatus.idle);
  }

  @override
  Future<Map<String, dynamic>> diagnose() async {
    await _init();

    List<String> localeNames = [];
    try {
      final locales = await _speech.locales();
      localeNames = locales.map((l) => '${l.localeId}: ${l.name}').toList();
    } catch (_) {}

    return {
      'platform': Platform.operatingSystem,
      'initialized': _initialized,
      'isListening': _speech.isListening,
      'locales': localeNames,
      'hasGerman': localeNames.any((l) => l.startsWith('de')),
      'hasUkrainian': localeNames.any((l) => l.startsWith('uk')),
    };
  }
}

// ─── Фабрична функція ───
SttService createPlatformSttService() => NativeSttService();