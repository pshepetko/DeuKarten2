import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../features/cards/providers/session_provider.dart';
import '../../features/cards/providers/cards_providers.dart';
import '../../core/database/drift_database.dart';
import '../../core/services/firebase_progress_sync_service.dart';

class SessionResultScreen extends ConsumerStatefulWidget {
  const SessionResultScreen({super.key});

  @override
  ConsumerState<SessionResultScreen> createState() => _SessionResultScreenState();
}

class _SessionResultScreenState extends ConsumerState<SessionResultScreen> {
  bool _isSyncing = false;
  bool _hasSynced = false;
  bool _needsAuth = false;
  String? _syncError;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Ensure we attempt sync first, then refresh session history so the UI
      // picks up the newly completed session from the local DB.
      await _syncSessionIfNeeded();

      // Invalidate the session history provider so the latest completed session
      // (and its stats: Richtig / Zu lernen / XP / Genauigkeit) are re-fetched.
      try {
        ref.invalidate(sessionHistoryProvider);
      } catch (_) {
        // ignore - defensive in case ref isn't available for some reason here
      }
    });
  }

  Future<void> _syncSessionIfNeeded() async {
    if (_hasSynced || _isSyncing) return;

    final dbHistory = await AppDatabase.instance.getSessionHistory();
    debugPrint('🔍 local getSessionHistory returned ${dbHistory.length} entries');
    // getSessionHistory() returns sessions ordered by completedAt DESC (newest first).
    // Use the first entry to ensure we sync the most recent completed session.
    final session = dbHistory.isNotEmpty ? dbHistory.first : null;

    if (session == null) return;

    // Log raw cards JSON stored in the DB row
    debugPrint('🔍 selected session id=${session.id} startedAt=${session.startedAt} completedAt=${session.completedAt}');
    debugPrint('🔍 raw cards JSON: ${session.cards}');

    // Try to parse card ids here for quick diagnostics
    try {
      final parsed = jsonDecode(session.cards);
      if (parsed is List) {
        final ids = parsed.map((e) {
          if (e is Map) return e['cardId']?.toString() ?? e['id']?.toString();
          return null;
        }).whereType<String>().toList();
        debugPrint('🔍 parsed cardIds (${ids.length}): $ids');
      } else {
        debugPrint('🔍 parsed cards is not a List (type=${parsed.runtimeType})');
      }
    } catch (e) {
      debugPrint('⚠️ Failed to decode session.cards JSON: $e');
    }

    setState(() {
      _isSyncing = true;
      _syncError = null;
      _needsAuth = false;
    });

    final syncService = FirebaseProgressSyncService(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
      db: AppDatabase.instance,
    );

    final result = await syncService.syncCompletedSession(session: session);

    if (!mounted) return;

    switch (result) {
      case SessionSyncResult.success:
        setState(() {
          _hasSynced = true;
          _isSyncing = false;
        });
        break;

      case SessionSyncResult.notAuthenticated:
        setState(() {
          _needsAuth = true;
          _isSyncing = false;
        });
        break;

      case SessionSyncResult.failed:
        setState(() {
          _syncError = 'Synchronisierung fehlgeschlagen.';
          _isSyncing = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessionHistoryAsync = ref.watch(sessionHistoryProvider);

    final session = sessionHistoryAsync.when(
      data: (history) => history.isNotEmpty ? history.first : null,
      loading: () => null,
      error: (_, __) => null,
    );

    if (session == null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 64,
                  color: AppColors.textTertiary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Keine Session-Daten gefunden',
                  style: AppTypography.section,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.go('/karten'),
                  child: const Text('Zurück zu den Decks'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final correctAnswers = session.correctAnswers ?? 0;
    final cardsStudied = session.cardsStudied ?? 0;
    final xpEarned = session.xpEarned ?? 0;
    final toLearn = cardsStudied - correctAnswers;
    final accuracy =
    cardsStudied > 0 ? ((correctAnswers / cardsStudied) * 100).round() : 0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              if (_isSyncing)
                _buildInfoBanner(
                  icon: Icons.sync,
                  text: 'Synchronisiere Fortschritt mit Firebase...',
                  color: AppColors.primary,
                ),

              if (_hasSynced)
                _buildInfoBanner(
                  icon: Icons.cloud_done,
                  text: 'Fortschritt erfolgreich in der Cloud gespeichert.',
                  color: AppColors.success,
                ),

              if (_needsAuth)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.lock_outline, color: Colors.orange),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Melde dich an, um deinen Fortschritt in der Cloud zu speichern.',
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/welcome-login'),
                        child: const Text('Anmelden'),
                      ),
                    ],
                  ),
                ),

              if (_syncError != null)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.error.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppColors.error),
                      const SizedBox(width: 12),
                      Expanded(child: Text(_syncError!)),
                      TextButton(
                        onPressed: _syncSessionIfNeeded,
                        child: const Text('Erneut'),
                      ),
                    ],
                  ),
                ),

              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.emoji_events,
                  size: 72,
                  color: AppColors.success,
                )
                    .animate()
                    .scale(duration: 500.ms, curve: Curves.elasticOut)
                    .then()
                    .shake(duration: 400.ms),
              ),

              const SizedBox(height: 20),

              Text(
                'Session beendet!',
                style: AppTypography.title,
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.2, end: 0),

              const SizedBox(height: 8),

              Text(
                'Gut gemacht! Hier ist deine Zusammenfassung:',
                style: AppTypography.body.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 100.ms, duration: 300.ms),

              const SizedBox(height: 24),

              _buildStatCard(
                icon: Icons.check_circle,
                label: 'Richtig',
                value: '$correctAnswers',
                color: AppColors.success,
              ),

              const SizedBox(height: 12),

              _buildStatCard(
                icon: Icons.cancel,
                label: 'Zu lernen',
                value: '$toLearn',
                color: AppColors.error,
              ),

              const SizedBox(height: 12),

              _buildStatCard(
                icon: Icons.star,
                label: 'XP verdient',
                value: '+$xpEarned',
                color: AppColors.xp,
              ),

              const SizedBox(height: 12),

              _buildStatCard(
                icon: Icons.percent,
                label: 'Genauigkeit',
                value: '$accuracy%',
                color: AppColors.primary,
              ),

              const SizedBox(height: 24),

              ElevatedButton.icon(
                onPressed: () {
                  ref.read(currentCardIndexProvider.notifier).state = 0;
                  context.go('/home');
                },
                icon: const Icon(Icons.home),
                label: const Text('Zurück zur Startseite'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextButton.icon(
                onPressed: () {
                  ref.read(currentCardIndexProvider.notifier).state = 0;
                  context.go('/karten');
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Weiter lernen'),
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBanner({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.body.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.section.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}