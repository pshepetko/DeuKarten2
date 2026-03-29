// lib/core/tts/tts_service_mobile.dart
import 'tts_segment.dart';
import 'tts_service.dart';

class MobileTtsService implements TtsService {
  @override
  void setVoiceGender(VoiceGender gender) {
    // TODO: реалізувати коли підключимо flutter_tts
    print('📱 Mobile TTS: setVoiceGender → $gender');
  }

  @override
  Future<void> speakSegments(
      List<TtsSegment> segments, {
        bool cancelPrevious = true,
        bool skipIfVoiceUnavailable = true,
      }) async {
    print('📱 Mobile TTS: not implemented yet');
    for (final seg in segments) {
      print('   → "${seg.text}" [${seg.locale}]');
    }
  }

  @override
  Future<void> speak(String text, {String locale = 'de-DE', double rate = 1.0}) async {
    print('📱 Mobile TTS: "$text" [$locale]');
  }

  @override
  Future<void> stop() async {}

  @override
  Future<bool> isLanguageAvailable(String locale) async => false;

  @override
  Future<List<String>> getAvailableLanguages() async => [];

  @override
  Future<Map<String, dynamic>> diagnose() async => {'platform': 'mobile', 'status': 'not implemented'};
}