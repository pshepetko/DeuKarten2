import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:deu_karten/core/theme/app_colors.dart';
import 'package:deu_karten/core/theme/app_typography.dart';
import 'package:deu_karten/core/widgets/streak_indicator.dart';
import 'package:deu_karten/features/spaced_repetition/spaced_repetition_provider.dart';
import 'package:deu_karten/features/cards/providers/cards_providers_drift.dart';
import 'widgets/hero_learning_card.dart';
import 'widgets/daily_progress_section.dart';
import 'widgets/learning_modes_grid.dart';
import 'widgets/quick_stats_row.dart';
import 'widgets/recent_decks_section.dart';
import 'package:deu_karten/core/database/drift_database.dart';
import 'package:deu_karten/features/profile/providers/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

// ─── Провайдер реальної статистики ──────────────
final homeStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  try {
    final repo = await ref.read(cardsRepositoryDriftProvider.future);
    final allCards = await repo.getWordCards();
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final appDb = AppDatabase.instance;

    int known = 0;
    int learning = 0;
    int newCards = 0;
    int readyToLearn = 0;
    int learnedToday = 0;
    int totalReviewed = 0;

    for (final card in allCards) {
      if (card.repetitionCount >= 3) {
        known++;
      } else if (card.repetitionCount > 0) {
        learning++;
      } else {
        newCards++;
      }

      if (card.repetitionCount == 0 ||
          card.nextReview == null ||
          card.nextReview!.isBefore(now)) {
        readyToLearn++;
      }

      if (card.lastReviewed != null &&
          card.lastReviewed!.isAfter(todayStart)) {
        learnedToday++;
      }

      if (card.repetitionCount > 0) {
        totalReviewed++;
      }
    }

    double successRate = 0.0;
    try {
      final sessionsResult = await appDb.customSelect(
        '''
    SELECT 
      COALESCE(SUM(correct_answers), 0) as correct,
      COALESCE(SUM(cards_studied), 0) as studied
    FROM learning_sessions 
    WHERE status = 'completed'
    ''',
      ).getSingle();

      final correct = sessionsResult.read<int>('correct');
      final studied = sessionsResult.read<int>('studied');

      if (studied > 0) {
        successRate = (correct / studied * 100);
      }
    } catch (e) {
      print('❌ Erfolgsquote error: $e');
    }

    int xpToday = 0;
    try {
      xpToday = await appDb.getTodayXp();
    } catch (e, st) {
      print('❌ Error in getTodayXp: $e');
      print(st);
    }

    int currentStreak = 0;
    try {
      currentStreak = await appDb.getCurrentStreak();
    } catch (e, st) {
      print('❌ Error in getCurrentStreak: $e');
      print(st);
    }

    return {
      'total': allCards.length,
      'known': known,
      'learning': learning,
      'new': newCards,
      'ready': readyToLearn,
      'learnedToday': learnedToday,
      'totalReviewed': totalReviewed,
      'successRate': successRate,
      'xpToday': xpToday,
      'streak': currentStreak,
    };
  } catch (_) {
    return {
      'total': 0, 'known': 0, 'learning': 0, 'new': 0,
      'ready': 0, 'learnedToday': 0, 'totalReviewed': 0,
      'successRate': 0.0, 'xpToday': 0, 'streak': 0,
    };
  }
});

// ✅ НОВИЙ PROVIDER - Auth State Stream
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(homeStatsProvider);
    final stats = statsAsync.valueOrNull ?? {};

    final profile = ref.watch(userProfileProvider).valueOrNull;
    final userName = profile?.name ?? 'Lerner';
    final dailyGoal = profile?.learningPrefs.dailyGoal ?? 20;

    final cardsReady = (stats['ready'] ?? 0) as int;
    final learnedToday = (stats['learnedToday'] ?? 0) as int;
    final totalReviewed = (stats['totalReviewed'] ?? 0) as int;
    final successRate = (stats['successRate'] ?? 0.0) as double;
    final xpToday = (stats['xpToday'] ?? 0) as int;
    final currentStreak = (stats['streak'] ?? 0) as int;

    return Scaffold(
      appBar: _buildAppBar(context, currentStreak, userName, ref),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(homeStatsProvider);
          ref.invalidate(userProfileProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroLearningCard(
                hasOngoingSession: false,
                cardsReady: cardsReady,
                onStart: cardsReady > 0
                    ? () => context.push('/karten/session?deckId=all')
                    : null,
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 0.2, end: 0, duration: 600.ms),

              const SizedBox(height: 24),

              Text('Tagesfortschritt', style: AppTypography.section),
              const SizedBox(height: 12),

              DailyProgressSection(
                cardsLearnedToday: learnedToday,
                dailyGoal: dailyGoal,
                streak: currentStreak,
                xpToday: xpToday,
              )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 100.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms),

              const SizedBox(height: 24),

              QuickStatsRow(
                totalCardsLearned: totalReviewed,
                currentStreak: currentStreak,
                successRate: successRate,
              )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 200.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms),

              const SizedBox(height: 24),

              Text('Lernmodi', style: AppTypography.section),
              const SizedBox(height: 12),

              LearningModesGrid(
                onKartenTap: () => context.push('/karten'),
                onSaetzeTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Coming soon: Sätze bauen')),
                  );
                },
                onHoerenTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Coming soon: Hören')),
                  );
                },
              )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 300.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms),

              const SizedBox(height: 12),

              InkWell(
                onTap: () => context.go('/ki_teacher'),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.psychology_outlined,
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KI-Lehrer',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.cardTitle,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Mit AI chatten und üben',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.caption,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.textTertiary,
                      ),
                    ],
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 350.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms),

              const SizedBox(height: 24),

              Text('Kürzlich gelernt', style: AppTypography.section),
              const SizedBox(height: 12),

              const RecentDecksSection()
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 400.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, int streak, String userName, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    final Color statusColor = authState.when(
      data: (user) => user != null ? Colors.green : Colors.red,
      loading: () => Colors.orange,
      error: (_, __) => Colors.red,
    );

    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hallo, $userName 👋',
            style: AppTypography.section.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Heute lernen wir Deutsch',
            style: AppTypography.caption,
          ),
        ],
      ),
      actions: [
        Center(
          child: StreakIndicator(streak: streak, compact: true),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () async {
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Abmelden'),
                  content: const Text('Möchtest du dich abmelden?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Nein'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Ja'),
                    ),
                  ],
                ),
              );

              if (shouldLogout == true) {
                await FirebaseAuth.instance.signOut();

                if (context.mounted) {
                  context.go('/welcome');

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Erfolgreich abgemeldet'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              }
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: statusColor,
              child: const Icon(Icons.person_outline, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}