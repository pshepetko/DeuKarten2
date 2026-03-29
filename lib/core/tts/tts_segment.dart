// lib/core/tts/tts_segment.dart
class TtsSegment {
  final String text;
  final String locale; // 'de-DE', 'uk-UA', 'fr-FR'
  final double rate;

  const TtsSegment({
    required this.text,
    required this.locale,
    this.rate = 1.0,
  });

  @override
  String toString() => 'TtsSegment("$text", $locale, rate=$rate)';
}