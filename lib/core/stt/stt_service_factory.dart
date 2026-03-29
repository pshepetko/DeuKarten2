// lib/core/stt/stt_service_factory.dart
import 'stt_service.dart';
import 'stt_service_stub.dart'
if (dart.library.js_interop) 'stt_service_web.dart'
if (dart.library.io) 'stt_service_native.dart';

SttService createSttService() => createPlatformSttService();