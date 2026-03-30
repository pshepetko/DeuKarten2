// lib/core/auth/current_user.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/drift_database.dart';

/// Повертає поточний userId:
/// - Firebase UID якщо залогінений
/// - 'local_user' якщо гість
String getCurrentUserId() {
  final user = FirebaseAuth.instance.currentUser;
  final uid = user?.uid ?? 'local_user';
  print('🔍 getCurrentUserId() = $uid');
  print('🔍 Firebase.currentUser = ${user?.email}');
  return uid;
}

/// ✅ Реактивний провайдер — слухає зміни Firebase Auth
final currentUserIdProvider = StreamProvider<String>((ref) {
  return FirebaseAuth.instance.authStateChanges().map((user) {
    final uid = user?.uid ?? 'local_user';
    print('🔄 Auth state changed: uid=$uid, email=${user?.email}');
    return uid;
  });
});

/// ✅ Провайдер профілю — оновлюється коли змінюється userId
final userProfileProvider = FutureProvider<UserProfileInfo>((ref) async {
  final userIdAsync = ref.watch(currentUserIdProvider);

  return userIdAsync.when(
    data: (userId) async {
      final db = AppDatabase.instance;

      // Шукаємо профіль за поточним userId
      var profile = await (db.select(db.userProfiles)
        ..where((t) => t.userId.equals(userId)))
          .getSingleOrNull();

      // Якщо не знайшли за uid — пробуємо local_user
      if (profile == null && userId != 'local_user') {
        profile = await (db.select(db.userProfiles)
          ..where((t) => t.userId.equals('local_user')))
            .getSingleOrNull();
      }

      if (profile != null) {
        return UserProfileInfo(
          name: profile.name,
          email: profile.email ?? '',
          userId: userId,
        );
      }

      // Дефолт
      return UserProfileInfo(
        name: 'Lerner',
        email: '',
        userId: userId,
      );
    },
    loading: () => UserProfileInfo(
      name: 'Lerner',
      email: '',
      userId: 'local_user',
    ),
    error: (_, __) => UserProfileInfo(
      name: 'Lerner',
      email: '',
      userId: 'local_user',
    ),
  );
});

/// Простий клас для даних профілю
class UserProfileInfo {
  final String name;
  final String email;
  final String userId;

  UserProfileInfo({
    required this.name,
    required this.email,
    required this.userId,
  });
}