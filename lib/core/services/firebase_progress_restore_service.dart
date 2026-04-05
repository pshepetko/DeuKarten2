import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' as drift;

import '../database/drift_database.dart';

class FirebaseProgressRestoreService {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final AppDatabase db;

  FirebaseProgressRestoreService({
    required this.firestore,
    required this.auth,
    required this.db,
  });

  Future<int> restoreWordProgressFromCloud({bool forceAll = false}) async {
    final user = auth.currentUser;
    if (user == null) {
      debugPrint('☁️ Restore skipped: user not authenticated');
      return 0;
    }

    final userId = user.uid;
    try {
      // The sync now writes per-card progress into a global `wordProgressHistory`
      // collection with fields suffixed by "After" (e.g. `easeFactorAfter`, `lastReviewedAfter`).
      // Query the global collection for the current user and pick the most recent
      // record per wordCardId (using `lastReviewedAfter` as tie-breaker).
      // Build base query for the user's progress records. If `forceAll` is true
      // we will fetch all records regardless of their status flag; otherwise
      // only fetch records that haven't been marked as restored yet.
      final baseQuery = firestore.collection('wordProgressHistory').where('userId', isEqualTo: userId);
      final snapshot = forceAll
          ? await baseQuery.get()
          : await baseQuery.where('status', isEqualTo: false).get();

      if (snapshot.docs.isEmpty) {
        debugPrint('ℹ️ No wordProgressHistory found in cloud for user $userId');
        return 0;
      }

      // Choose the latest record per wordCardId based on lastReviewedAfter timestamp.
      final Map<String, Map<String, dynamic>> latestByCard = {};

      for (final doc in snapshot.docs) {
        final data = doc.data();
        final wordCardId = (data['wordCardId'] as String?) ?? data['wordCardId'] ?? doc.id;
        if (wordCardId == null) continue;
  
        final existing = latestByCard[wordCardId];
        final tsExisting = existing != null
            ? _toDateTime(existing['lastReviewedAfter'])?.millisecondsSinceEpoch
            : null;
        final tsCandidate = _toDateTime(data['lastReviewedAfter'])?.millisecondsSinceEpoch;
  
        // Keep doc id alongside the record so we can mark it as restored later.
        final withMeta = {...data, '__docId': doc.id};
  
        // Prefer the record with a more recent lastReviewedAfter.
        if (existing == null) {
          latestByCard[wordCardId] = withMeta;
        } else if ((tsCandidate ?? 0) > (tsExisting ?? 0)) {
          latestByCard[wordCardId] = withMeta;
        }
      }

      if (latestByCard.isEmpty) {
        debugPrint('ℹ️ No usable progress records for user $userId');
        return 0;
      }

      int restoredCount = 0;

      for (final entry in latestByCard.entries) {
        final wordCardId = entry.key;
        final data = entry.value;

        final localCard = await db.getWordCardById(wordCardId);
        if (localCard == null) {
          debugPrint('⚠️ Local card not found for cloud progress: $wordCardId');
          continue;
        }

        final easeFactor =
            _toDouble(data['easeFactorAfter'] ?? data['easeFactor']) ?? localCard.easeFactor;
        final intervalDays = data['intervalDaysAfter'] as int? ?? data['intervalDays'] as int?;
        final repetitionCount =
            data['repetitionCountAfter'] as int? ?? data['repetitionCount'] as int? ?? localCard.repetitionCount;

        final lastReviewed = _toDateTime(data['lastReviewedAfter'] ?? data['lastReviewed']);
        final nextReview = _toDateTime(data['nextReviewAfter'] ?? data['nextReview']);

        await (db.update(db.wordCards)
          ..where((tbl) => tbl.id.equals(wordCardId)))
            .write(
          WordCardsCompanion(
            easeFactor: drift.Value(easeFactor),
            intervalDays: drift.Value(intervalDays),
            repetitionCount: drift.Value(repetitionCount),
            lastReviewed: drift.Value(lastReviewed),
            nextReview: drift.Value(nextReview),
          ),
        );
  
        // If we have the originating cloud doc id, mark the cloud record as restored
        final docId = (data['__docId'] as String?) ?? null;
        if (docId != null) {
          try {
            await firestore.collection('wordProgressHistory').doc(docId).update({
              'status': true,
            });
          } catch (e) {
            debugPrint('⚠️ Failed to mark cloud record as restored: $docId — $e');
          }
        }
  
        restoredCount++;
      }

      debugPrint('☁️ Restored word progress for $restoredCount cards (using wordProgressHistory)');
      return restoredCount;
    } catch (e, st) {
      debugPrint('❌ Failed to restore word progress: $e');
      debugPrint('$st');
      rethrow;
    }
  }

  DateTime? _toDateTime(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    return null;
  }

  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString());
  }
}