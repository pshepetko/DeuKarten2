// lib/core/tts/tts_service_stub.dart
import 'tts_service.dart';
import 'tts_segment.dart';

TtsService createPlatformTtsService() => _StubTtsService();

class _StubTtsService implements TtsService {
  @override
  Future<void> speakSegments(
      List<TtsSegment> segments, {
        bool cancelPrevious = true,
        bool skipIfVoiceUnavailable = true,
      }) async {}

  @override
  Future<void> speak(String text, {String locale = 'de-DE', double rate = 1.0}) async {}

  @override
  Future<void> stop() async {}

  @override
  Future<bool> isLanguageAvailable(String locale) async => false;

  @override
  Future<List<String>> getAvailableLanguages() async => [];

  @override
  void setVoiceGender(VoiceGender gender) {}

  @override
  Future<Map<String, dynamic>> diagnose() async => {'platform': 'unknown'};
}