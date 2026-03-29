import 'package:deu_karten/features/cards/models/deck.dart';
import 'package:deu_karten/features/cards/models/word_card.dart';
import 'package:deu_karten/features/cards/providers/cards_providers_drift.dart';
import 'package:deu_karten/features/cards/services/cloud_sync_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/cards/repositories/cards_repository_drift.dart';

class KartenScreen extends ConsumerStatefulWidget {
  const KartenScreen({super.key});

  @override
  ConsumerState<KartenScreen> createState() => _KartenScreenState();
}

class _KartenScreenState extends ConsumerState<KartenScreen> {
  static const String _allCardsValue = '__all_cards__';
  String _selectedDeckId = _allCardsValue;

  void _showCloudSyncDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.cloud_sync_outlined, size: 28),
            const SizedBox(width: 12),
            const Flexible(
              child: Text(
                'Cloud-Synchronisation',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Wähle eine Aktion:',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(ctx, rootNavigator: true).pop();
                _handleImportFromCloud();
              },
              icon: const Icon(Icons.cloud_download_outlined),
              label: const Text('Import aus der Cloud'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(ctx, rootNavigator: true).pop();
                _handleExportToCloud();
              },
              icon: const Icon(Icons.cloud_upload_outlined),
              label: const Text('Export in die Cloud'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(),
            child: const Text('Abbrechen'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleExportToCloud() async {
    try {
      final decks = await ref.read(allDecksDriftProvider.future);

      if (decks.isEmpty) {
        if (!mounted) return;
        _showSnack('Keine Decks zum Exportieren vorhanden.', isError: true);
        return;
      }

      final selectedId = await _showLocalDeckPicker(decks);
      if (selectedId == null || !mounted) return;

      final progressText = ValueNotifier<String>('Starte Export…');
      final progressFraction = ValueNotifier<double?>(null);

      _showProgressDialog('Exportiere…', progressText, progressFraction);

      try {
        await CloudSyncService.exportDeck(
          selectedId,
          onProgress: (processed, total) {
            progressFraction.value = total > 0 ? processed / total : null;
            progressText.value = '$processed / $total Karten';
          },
        );

        if (!mounted) return;
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }

        _showSnack('Erfolgreich exportiert!');
      } catch (e) {
        if (!mounted) return;
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        _showSnack('Export-Fehler: $e', isError: true);
      } finally {
        progressText.dispose();
        progressFraction.dispose();
      }
    } catch (e) {
      if (!mounted) return;
      _showSnack('Fehler: $e', isError: true);
    }
  }

  Future<void> _handleImportFromCloud() async {
    try {
      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Expanded(child: Text('Lade Cloud-Decks…')),
            ],
          ),
        ),
      );

      List<CloudDeckInfo> cloudDecks;
      try {
        cloudDecks = await CloudSyncService.getCloudDecks();
      } catch (e) {
        if (!mounted) return;
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        _showSnack('Fehler beim Laden der Cloud-Decks: $e', isError: true);
        return;
      }

      if (!mounted) return;
      if (Navigator.of(context, rootNavigator: true).canPop()) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      if (cloudDecks.isEmpty) {
        _showSnack('Keine Cloud-Decks verfügbar.');
        return;
      }

      final selectedCloudId = await _showCloudDeckPicker(cloudDecks);
      if (selectedCloudId == null || !mounted) return;

      final progressText = ValueNotifier<String>('Starte Import…');
      final progressFraction = ValueNotifier<double?>(null);

      _showProgressDialog('Importiere…', progressText, progressFraction);

      try {
        final deckName = await CloudSyncService.importDeck(
          selectedCloudId,
          onProgress: (processed, total) {
            progressFraction.value = total > 0 ? processed / total : null;
            progressText.value = '$processed / $total Karten';
          },
        );

        if (!mounted) return;
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }

        ref.invalidate(allDecksDriftProvider);

        setState(() {
          _selectedDeckId = _allCardsValue;
        });

        _showSnack('Deck „$deckName" erfolgreich importiert!');
      } catch (e) {
        if (!mounted) return;
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        _showSnack('Import-Fehler: $e', isError: true);
      } finally {
        progressText.dispose();
        progressFraction.dispose();
      }
    } catch (e) {
      if (!mounted) return;
      _showSnack('Fehler: $e', isError: true);
    }
  }

  Future<String?> _showLocalDeckPicker(List<Deck> decks) {
    String? selected;

    return showDialog<String>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Deck zum Export wählen'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: decks.length,
              itemBuilder: (_, i) {
                final deck = decks[i];
                return RadioListTile<String>(
                  title: Text(deck.name),
                  subtitle: Text(
                    '${deck.level.name} · ${deck.totalCards} Karten',
                  ),
                  value: deck.id,
                  groupValue: selected,
                  onChanged: (v) => setDialogState(() => selected = v),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(),
              child: const Text('Abbrechen'),
            ),
            ElevatedButton(
              onPressed: selected == null
                  ? null
                  : () => Navigator.of(ctx, rootNavigator: true).pop(selected),
              child: const Text('Exportieren'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showCloudDeckPicker(List<CloudDeckInfo> decks) {
    String? selected;

    return showDialog<String>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Cloud-Deck importieren'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: decks.length,
              itemBuilder: (_, i) {
                final deck = decks[i];
                return RadioListTile<String>(
                  title: Text('📚 ${deck.name}'),
                  subtitle: Text('${deck.level} · ${deck.totalCards} Karten'),
                  value: deck.cloudId,
                  groupValue: selected,
                  onChanged: (v) => setDialogState(() => selected = v),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(),
              child: const Text('Abbrechen'),
            ),
            ElevatedButton(
              onPressed: selected == null
                  ? null
                  : () => Navigator.of(ctx, rootNavigator: true).pop(selected),
              child: const Text('Importieren'),
            ),
          ],
        ),
      ),
    );
  }

  void _showProgressDialog(
      String title,
      ValueNotifier<String> text,
      ValueNotifier<double?> fraction,
      ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<double?>(
              valueListenable: fraction,
              builder: (_, val, __) => LinearProgressIndicator(value: val),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<String>(
              valueListenable: text,
              builder: (_, txt, __) => Text(txt),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnack(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : null,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final decksAsync = ref.watch(allDecksDriftProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Karten'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_sync_outlined),
            tooltip: 'Cloud-Synchronisation',
            onPressed: _showCloudSyncDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: decksAsync.when(
          data: (decks) {
            final items = <DropdownMenuItem<String>>[
              const DropdownMenuItem<String>(
                value: _allCardsValue,
                child: Text('Alle Decks'),
              ),
              ...decks.map(
                    (deck) => DropdownMenuItem<String>(
                  value: deck.id,
                  child: Text(deck.name),
                ),
              ),
            ];

            final validValues =
            items.map((e) => e.value).whereType<String>().toSet();

            if (!validValues.contains(_selectedDeckId)) {
              _selectedDeckId = _allCardsValue;
            }

            Deck? selectedDeck;
            if (_selectedDeckId != _allCardsValue) {
              for (final deck in decks) {
                if (deck.id == _selectedDeckId) {
                  selectedDeck = deck;
                  break;
                }
              }
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedDeckId,
                  decoration: const InputDecoration(
                    labelText: 'Deck auswählen',
                    border: OutlineInputBorder(),
                  ),
                  items: items,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedDeckId = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: decks.isEmpty
                      ? const Center(
                    child: Text('Keine Decks vorhanden.'),
                  )
                      : _selectedDeckId == _allCardsValue
                      ? // ─── Alle Decks ───
                  FutureBuilder<List<WordCard>>(
                    future: ref
                        .read(cardsRepositoryDriftProvider.future)
                        .then((repo) => repo.getWordCards()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              'Fehler beim Laden der Karten: ${snapshot.error}'),
                        );
                      }
                      final cards = snapshot.data ?? [];
                      if (cards.isEmpty) {
                        return const Center(
                          child: Text('Keine Karten vorhanden.'),
                        );
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: cards.length,
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          final titleText =
                          (card.article != null &&
                              card.article.isNotEmpty)
                              ? '${card.article} ${card.germanWord}'
                              : card.germanWord;
                          return Card(
                            child: ListTile(
                              leading: Text(
                                card.imageUrl ?? '📘',
                                style:
                                const TextStyle(fontSize: 24),
                              ),
                              title: Text(titleText),
                              subtitle: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(card.translation),
                                  if (card.pluralForm != null &&
                                      card.pluralForm!.isNotEmpty)
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          top: 4),
                                      child: Text(
                                          'Plural: ${card.pluralForm}'),
                                    ),
                                  if (card.exampleSentence !=
                                      null &&
                                      card.exampleSentence!
                                          .isNotEmpty)
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          top: 4),
                                      child: Text(card
                                          .exampleSentence!),
                                    ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          );
                        },
                      );
                    },
                  )
                      : // ─── Einzelnes Deck ───
                  selectedDeck == null
                      ? const Center(
                    child: Text('Deck nicht gefunden.'),
                  )
                      : _buildSelectedDeckView(selectedDeck!),
                ),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, _) => Center(
            child: Text('Fehler beim Laden der Decks: $error'),
          ),
        ),
      ),
    );
  }

  // ─── Вид вибраного деку з кнопкою "Start Session" ───
  Widget _buildSelectedDeckView(Deck deck) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Назва деку + кнопка Start Session з лічильником
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  deck.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              // ✅ Кнопка з лічильником due карток
              FutureBuilder<int>(
                future: _getReadyCount(deck.id),
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 0;
                  final isLoading = snapshot.connectionState ==
                      ConnectionState.waiting;

                  if (isLoading) {
                    return const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }

                  return ElevatedButton(
                    onPressed: count > 0
                        ? () => context.go(
                        '/karten/session?deckId=${deck.id}')
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                    child: Text(
                      count > 0
                          ? 'Start Session ($count)'
                          : 'Alles gelernt ✓',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Список карток
        Expanded(
          child: FutureBuilder<List<WordCard>>(
            future: ref
                .read(cardsRepositoryDriftProvider.future)
                .then((repo) => repo.getWordCardsByDeck(deck.id)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      'Fehler beim Laden der Karten: ${snapshot.error}'),
                );
              }
              final cards = snapshot.data ?? [];
              if (cards.isEmpty) {
                return const Center(
                  child: Text('Keine Karten vorhanden.'),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.only(top: 8),
                itemCount: cards.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final card = cards[index];

                  // Визначаємо статус картки для візуального індикатора
                  final isKnown = card.repetitionCount >= 3;
                  final isLearning = card.repetitionCount > 0 && !isKnown;
                  final isNew = card.repetitionCount == 0;

                  String statusText;
                  Color statusColor;
                  if (isNew) {
                    statusText = 'Neu';
                    statusColor = Colors.blue;
                  } else if (isLearning) {
                    statusText = 'Lernen';
                    statusColor = Colors.orange;
                  } else {
                    statusText = 'Gelernt';
                    statusColor = Colors.green;
                  }

                  return Card(
                    child: ListTile(
                      leading: Text(
                        card.imageUrl ?? '📘',
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(card.germanWord),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(card.translation),
                          if (card.pluralForm != null &&
                              card.pluralForm!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text('Plural: ${card.pluralForm}'),
                            ),
                          if (card.exampleSentence != null &&
                              card.exampleSentence!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(card.exampleSentence!),
                            ),
                        ],
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          statusText,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
  Future<int> _getReadyCount(String deckId) async {
    try {
      final db = await ref.read(cardsRepositoryDriftProvider.future);
      if (db is CardsRepositoryDrift) {
        return await db.getReadyCardsCount(deckId);
      }
    } catch (_) {}

    // Фолбек — рахуємо вручну
    try {
      final repo = await ref.read(cardsRepositoryDriftProvider.future);
      final cards = await repo.getWordCardsByDeck(deckId);
      return cards.where((c) =>
      c.repetitionCount == 0 ||
          c.nextReview == null ||
          c.nextReview!.isBefore(DateTime.now())
      ).length;
    } catch (_) {
      return 0;
    }
  }
}