// lib/core/stt/stt_service_web.dart
import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

import 'stt_result.dart';
import 'stt_service.dart';

// ─── Перевірка наявності SpeechRecognition ──────────

bool _isSpeechRecognitionAvailable() {
  try {
    final hasWebkit = web.window.hasProperty('webkitSpeechRecognition'.toJS);
    final hasStandard = web.window.hasProperty('SpeechRecognition'.toJS);
    return hasWebkit.toDart || hasStandard.toDart;
  } catch (_) {
    return false;
  }
}

/// Створити SpeechRecognition об'єкт через JS
JSObject? _createSpeechRecognition() {
  try {
    // Chrome/Edge використовують webkitSpeechRecognition
    final constructor = web.window['webkitSpeechRecognition'];
    if (constructor != null && constructor.typeofEquals('function')) {
      return (constructor as JSFunction).callAsConstructor();
    }

    // Стандартний SpeechRecognition (Firefox у майбутньому)
    final stdConstructor = web.window['SpeechRecognition'];
    if (stdConstructor != null && stdConstructor.typeofEquals('function')) {
      return (stdConstructor as JSFunction).callAsConstructor();
    }
  } catch (e) {
    print('❌ STT: не вдалось створити SpeechRecognition: $e');
  }
  return null;
}

// ─── Web STT Service ────────────────────────────────

class WebSttService implements SttService {
  JSObject? _recognition;
  SttStatus _status = SttStatus.idle;
  void Function(SttResult)? _onResult;
  void Function(SttStatus)? _onStatus;
  void Function(String)? _onError;
  bool _shouldRestart = false;
  String _currentLocale = 'de-DE';

  @override
  SttStatus get status => _status;

  void _setStatus(SttStatus newStatus) {
    _status = newStatus;
    _onStatus?.call(newStatus);
  }

  @override
  Future<bool> isAvailable() async {
    return _isSpeechRecognitionAvailable();
  }

  @override
  Future<bool> requestPermission() async {
    try {
      final mediaDevices = web.window.navigator.mediaDevices;
      final stream = await mediaDevices
          .getUserMedia(web.MediaStreamConstraints(audio: true.toJS))
          .toDart;

      // Зупиняємо стрім
      final tracks = stream.getAudioTracks().toDart;
      for (final track in tracks) {
        track.stop();
      }

      return true;
    } catch (e) {
      print('❌ STT: Дозвіл на мікрофон відхилено: $e');
      // Навіть якщо getUserMedia впав — дозволяємо спробувати
      // SpeechRecognition може працювати без getUserMedia на деяких браузерах
      return true;
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
    if (!_isSpeechRecognitionAvailable()) {
      onError?.call('SpeechRecognition не підтримується цим браузером');
      return false;
    }

    // Зупиняємо попереднє
    await stopListening();

    _onResult = onResult;
    _onStatus = onStatus;
    _onError = onError;
    _currentLocale = locale;
    _shouldRestart = continuous;

    try {
      _recognition = _createSpeechRecognition();
      if (_recognition == null) {
        onError?.call('Не вдалось створити SpeechRecognition');
        return false;
      }

      final rec = _recognition!;

      // Налаштування
      rec['lang'] = locale.toJS;
      rec['continuous'] = continuous.toJS;
      rec['interimResults'] = interimResults.toJS;
      rec['maxAlternatives'] = 1.toJS;

      // ─── onresult ───
      rec['onresult'] = ((JSObject event) {
        _handleResult(event);
      }).toJS;

      // ─── onstart ───
      rec['onstart'] = ((JSObject event) {
        print('🎤 STT Web: почав слухати [$locale]');
        _setStatus(SttStatus.listening);
      }).toJS;

      // ─── onerror ───
      rec['onerror'] = ((JSObject event) {
        final errorType = (event['error'] as JSString?)?.toDart ?? 'unknown';
        print('❌ STT Web error: $errorType');

        if (errorType == 'not-allowed' ||
            errorType == 'service-not-allowed') {
          _onError?.call(
              'Мікрофон заблоковано. Дозвольте доступ у налаштуваннях браузера.');
          _shouldRestart = false;
        } else if (errorType == 'no-speech') {
          print('   → тиша, чекаємо...');
        } else if (errorType == 'network') {
          _onError?.call('Немає мережі для розпізнавання мовлення');
        } else if (errorType == 'aborted') {
          // Було зупинено вручну
        } else {
          _onError?.call('Помилка розпізнавання: $errorType');
        }

        _setStatus(SttStatus.error);
      }).toJS;

      // ─── onend ───
      rec['onend'] = ((JSObject event) {
        print('🎤 STT Web: зупинився');

        if (_shouldRestart && _status != SttStatus.idle) {
          print('   → перезапуск...');
          Future.delayed(const Duration(milliseconds: 200), () {
            if (_shouldRestart && _recognition != null) {
              try {
                _recognition!.callMethod('start'.toJS);
              } catch (e) {
                print('   → не вдалось перезапустити: $e');
                _setStatus(SttStatus.idle);
              }
            }
          });
        } else {
          _setStatus(SttStatus.idle);
        }
      }).toJS;

      // ─── onspeechstart ───
      rec['onspeechstart'] = ((JSObject event) {
        _setStatus(SttStatus.listening);
      }).toJS;

      // ─── onspeechend ───
      rec['onspeechend'] = ((JSObject event) {
        _setStatus(SttStatus.processing);
      }).toJS;

      // Старт!
      rec.callMethod('start'.toJS);

      return true;
    } catch (e) {
      print('❌ STT Web: не вдалось запустити: $e');
      _onError?.call('Не вдалось запустити розпізнавання: $e');
      _setStatus(SttStatus.error);
      return false;
    }
  }

  void _handleResult(JSObject event) {
    try {
      final results = event['results'] as JSObject;
      final resultIndex = (event['resultIndex'] as JSNumber).toDartInt;
      final resultsLength = (results['length'] as JSNumber).toDartInt;

      for (int i = resultIndex; i < resultsLength; i++) {
        // results[i]
        final result = results.callMethod('item'.toJS, i.toJS) as JSObject;
        final isFinal = (result['isFinal'] as JSBoolean).toDart;

        // result[0] — перша альтернатива
        final alternative =
        result.callMethod('item'.toJS, 0.toJS) as JSObject;
        final transcript =
            (alternative['transcript'] as JSString?)?.toDart ?? '';
        final confidence =
            (alternative['confidence'] as JSNumber?)?.toDartDouble ?? 0.0;

        final trimmed = transcript.trim();
        if (trimmed.isNotEmpty) {
          final sttResult = SttResult(
            text: trimmed,
            isFinal: isFinal,
            confidence: confidence,
            locale: _currentLocale,
          );

          print('🎤 ${isFinal ? "✅" : "..."} "$trimmed" '
              '(${(confidence * 100).toStringAsFixed(0)}%)');
          _onResult?.call(sttResult);
        }
      }
    } catch (e) {
      print('⚠️ STT: помилка обробки результату: $e');
    }
  }

  @override
  Future<void> stopListening() async {
    _shouldRestart = false;
    try {
      _recognition?.callMethod('stop'.toJS);
    } catch (_) {}
    _recognition = null;
    _setStatus(SttStatus.idle);
  }

  @override
  Future<Map<String, dynamic>> diagnose() async {
    return {
      'platform': 'web',
      'speechRecognitionAvailable': _isSpeechRecognitionAvailable(),
      'status': _status.name,
      'browser': web.window.navigator.userAgent,
    };
  }
}

// ─── Фабрична функція ───
SttService createPlatformSttService() => WebSttService();