// lib/core/stt/stt_service.dart
import 'stt_result.dart';

/// Стан мікрофона
enum SttStatus {
  idle,       // Не слухає
  listening,  // Активно слухає
  processing, // Обробляє (між фразами)
  error,      // Помилка
}

abstract class SttService {
  /// Почати слухати мікрофон
  /// [locale] — мова розпізнавання ('de-DE', 'uk-UA', 'en-US')
  /// [onResult] — колбек з проміжними та фінальними результатами
  /// [onStatus] — колбек зміни статусу
  Future<bool> startListening({
    required String locale,
    required void Function(SttResult result) onResult,
    void Function(SttStatus status)? onStatus,
    void Function(String error)? onError,
    bool continuous = true,       // продовжувати після паузи
    bool interimResults = true,   // проміжні результати
  });

  /// Зупинити слухання
  Future<void> stopListening();

  /// Поточний статус
  SttStatus get status;

  /// Чи доступний мікрофон
  Future<bool> isAvailable();

  /// Запросити дозвіл на мікрофон
  Future<bool> requestPermission();

  /// Діагностика
  Future<Map<String, dynamic>> diagnose();
}