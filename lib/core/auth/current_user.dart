// Simple current-user helper for local mode.
// Placed under lib/core/auth so it can be replaced by a real auth integration later.
// lib/core/auth/current_user.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Повертає поточний userId:
/// - Firebase UID якщо залогінений
/// - 'local_user' якщо гість
String getCurrentUserId() {
  final user = FirebaseAuth.instance.currentUser;
  return user?.uid ?? 'local_user';
}

/// Riverpod провайдер для userId
final currentUserIdProvider = Provider<String>((ref) {
  return getCurrentUserId();
});
