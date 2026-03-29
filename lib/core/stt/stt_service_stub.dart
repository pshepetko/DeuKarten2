// lib/core/stt/stt_service_stub.dart
import 'stt_result.dart';
import 'stt_service.dart';

SttService createPlatformSttService() => _StubSttService();

class _StubSttService implements SttService {
  @override
  SttStatus get status => SttStatus.idle;

  @override
  Future<bool> startListening({
    required String locale,
    required void Function(SttResult) onResult,
    void Function(SttStatus)? onStatus,
    void Function(String)? onError,
    bool continuous = true,
    bool interimResults = true,
  }) async => false;

  @override
  Future<void> stopListening() async {}

  @override
  Future<bool> isAvailable() async => false;

  @override
  Future<bool> requestPermission() async => false;

  @override
  Future<Map<String, dynamic>> diagnose() async => {'platform': 'stub'};
}