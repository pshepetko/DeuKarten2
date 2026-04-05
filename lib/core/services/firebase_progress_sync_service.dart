import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../database/drift_database.dart';

enum SessionSyncResult {
  success,
  notAuthenticated,
  failed,
}

class FirebaseProgressSyncService {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final AppDatabase db;

  FirebaseProgressSyncService({
    required this.firestore,
    required this.auth,
    required this.db,
  });

  Future<SessionSyncResult> syncCompletedSession({
    required LearningSessionData session,
  }) async {
    final user = auth.currentUser;
    if (user == null) {
      debugPrint('☁️ Sync skipped: user not authenticated');
      return SessionSyncResult.notAuthenticated;
    }

    try {
      final userId = user.uid;

      // Re-fetch the session row from local DB to ensure we have the latest cards JSON
      final query = db.select(db.learningSessions)
        ..where((t) => t.id.equals(session.id));
      final freshSession = await query.getSingleOrNull() ?? session;

      debugPrint('☁️ Syncing session ${freshSession.id} — cards JSON: ${freshSession.cards}');

      await _uploadSessionSummary(
        userId: userId,
        session: freshSession,
      );

      await _uploadWordProgressHistory(
        userId: userId,
        session: freshSession,
      );

      debugPrint('✅ Session synced: ${freshSession.id}');
      return SessionSyncResult.success;
    } catch (e, st) {
      debugPrint('❌ Session sync failed for ${session.id}: $e');
      debugPrint('$st');
      return SessionSyncResult.failed;
    }
  }

  Future<void> _uploadSessionSummary({
    required String userId,
    required LearningSessionData session,
  }) async {
    // Global collection: store every session summary across all users for analytics
    final docRef = firestore.collection('learningSessionsHistory').doc(session.id);

    final payload = {
      'userId': userId,
      'cardsStudied': session.cardsStudied,
      'correctAnswers': session.correctAnswers,
      'xpEarned': session.xpEarned,
      'startedAt': Timestamp.fromDate(session.startedAt),
      'completedAt': session.completedAt != null
          ? Timestamp.fromDate(session.completedAt!)
          : null,
    };

    // Write to the global top-level collection used for cross-user analytics
    await docRef.set(payload, SetOptions(merge: true));
  }

  Future<void> _uploadWordProgressHistory({
    required String userId,
    required LearningSessionData session,
  }) async {
    // Parse card ids and deduplicate them to avoid duplicate uploads/counting
    final sessionCardIds = _extractCardIdsFromSession(session.cards);
    final uniqueCardIds = sessionCardIds.toSet().toList();

    if (uniqueCardIds.isEmpty) {
      debugPrint('ℹ️ No card ids found in session ${session.id}');
      return;
    }

    if (uniqueCardIds.length != sessionCardIds.length) {
      debugPrint(
          '⚠️ Duplicate cardIds detected in session ${session.id}: original=${sessionCardIds.length} unique=${uniqueCardIds.length}');
    }

    final batch = firestore.batch();
    int savedCount = 0;

    for (final cardId in uniqueCardIds) {
      final localCard = await db.getWordCardById(cardId);
      if (localCard == null) {
        debugPrint('⚠️ Local word card not found for id $cardId (session ${session.id})');
        continue;
      }

      // Diagnostic: show lastReviewed/nextReview values we will upload
      debugPrint(
          '☁️ Preparing wordHistory: cardId=$cardId lastReviewed=${localCard.lastReviewed} '
          'nextReview=${localCard.nextReview} repetitionCount=${localCard.repetitionCount} '
          'easeFactor=${localCard.easeFactor}');

      final recordId = '${session.id}_$cardId';
      
      // Global collection: store per-card progress for analytics across all users
      final docRef = firestore.collection('wordProgressHistory').doc(recordId);
      
      // Resolve deck name for better analytics (keep empty string if not found)
      final deckData = await db.getDeckById(localCard.deckId);
      final deckName = deckData?.name ?? '';
      
      batch.set(docRef, {
        'userId': userId,
        'sessionId': session.id,
        'wordCardId': localCard.id,
        'deckId': localCard.deckId,
        'deckname': deckName,
        'easeFactorAfter': localCard.easeFactor,
        'intervalDaysAfter': localCard.intervalDays,
        'repetitionCountAfter': localCard.repetitionCount,
        'lastReviewedAfter': localCard.lastReviewed != null
            ? Timestamp.fromDate(localCard.lastReviewed!)
            : null,
        'nextReviewAfter': localCard.nextReview != null
            ? Timestamp.fromDate(localCard.nextReview!)
            : null,
        // Status flag: mark as not-yet-restored by default. Restore will set this to true.
        'status': false,
      }, SetOptions(merge: true));
      
      savedCount++;
    }

    if (savedCount == 0) {
      debugPrint('ℹ️ No word history items saved for session ${session.id}');
      return;
    }

    await batch.commit();
    debugPrint('☁️ Word history synced: $savedCount items (unique ids: ${uniqueCardIds.length})');
  }

  List<String> _extractCardIdsFromSession(String rawCardsJson) {
    try {
      final decoded = jsonDecode(rawCardsJson);

      if (decoded is List) {
        return decoded.map((e) {
          if (e is Map<String, dynamic>) {
            return e['cardId']?.toString() ??
                e['id']?.toString() ??
                e['wordCardId']?.toString();
          }
          if (e is Map) {
            return e['cardId']?.toString() ??
                e['id']?.toString() ??
                e['wordCardId']?.toString();
          }
          return null;
        }).whereType<String>().toList();
      }

      return [];
    } catch (e) {
      debugPrint('⚠️ Failed to parse session cards JSON: $e');
      return [];
    }
  }
}