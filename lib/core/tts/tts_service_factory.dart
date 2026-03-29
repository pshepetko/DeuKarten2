// lib/core/tts/tts_service_factory.dart
import 'tts_service.dart';
import 'tts_service_stub.dart'
if (dart.library.js_interop) 'tts_service_web.dart'
if (dart.library.io) 'tts_service_native.dart';

TtsService createTtsService() => createPlatformTtsService();