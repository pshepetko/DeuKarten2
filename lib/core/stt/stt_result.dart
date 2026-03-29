// lib/core/stt/stt_result.dart

/// Результат розпізнавання мовлення
class SttResult {
  final String text;
  final bool isFinal;
  final double confidence; // 0.0 - 1.0
  final String locale;

  const SttResult({
    required this.text,
    required this.isFinal,
    this.confidence = 0.0,
    this.locale = 'de-DE',
  });

  @override
  String toString() =>
      'SttResult("$text", final=$isFinal, conf=${(confidence * 100).toStringAsFixed(0)}%)';
}