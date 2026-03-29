import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/tts/tts_segment.dart';
import '../../../core/tts/tts_tracker.dart';  // ✅
import '../providers/session_provider.dart';

class CardBack extends StatefulWidget {
  final CardData card;

  const CardBack({
    super.key,
    required this.card,
  });

  @override
  State<CardBack> createState() => _CardBackState();
}

class _CardBackState extends State<CardBack> {
  @override
  void initState() {
    super.initState();
    _autoSpeak();
  }

  @override
  void didUpdateWidget(CardBack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.card.germanWord != widget.card.germanWord) {
      _autoSpeak();
    }
  }

  Future<void> _autoSpeak() async {
    final currentWord = widget.card.germanWord;

    // ✅ Вже озвучували back для цього слова — пропускаємо
    if (TtsAutoSpeakTracker.wasBackSpoken(currentWord)) {
      debugPrint('🔇 Back skip: "$currentWord" already spoken');
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    try {
      final card = widget.card;

      final segments = <TtsSegment>[
        if (card.translation.isNotEmpty)
          TtsSegment(text: card.translation, locale: 'uk-UA', rate: 1.0),
        if (card.exampleTranslation != null &&
            card.exampleTranslation!.isNotEmpty)
          TtsSegment(
              text: card.exampleTranslation!, locale: 'uk-UA', rate: 0.95),
      ];

      if (segments.isEmpty) return;

      // ✅ Позначаємо
      TtsAutoSpeakTracker.markBackSpoken(currentWord);

      await globalTtsService.speakSegments(segments);
    } catch (e) {
      debugPrint('❌ Auto-TTS back: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ... ваш build без змін ...
    return Card(
      elevation: 8,
      color: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: 320,
        height: 420,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.card.completeSentence != null) ...[
              Text('Vollständiger Satz',
                  style: AppTypography.caption
                      .copyWith(color: Colors.white.withOpacity(0.7))),
              const SizedBox(height: 8),
              Text(widget.card.completeSentence!,
                  style: AppTypography.section.copyWith(color: Colors.white),
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
            ],
            if (widget.card.type == 'noun' &&
                widget.card.germanWord != null) ...[
              Text('Richtige Antwort',
                  style: AppTypography.caption
                      .copyWith(color: Colors.white.withOpacity(0.7))),
              const SizedBox(height: 8),
              Text('${widget.card.article} ${widget.card.germanWord}',
                  style: AppTypography.germanWord.copyWith(color: Colors.white),
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
            ],
            Text('Übersetzung',
                style: AppTypography.caption
                    .copyWith(color: Colors.white.withOpacity(0.7))),
            const SizedBox(height: 8),
            Text(widget.card.translation,
                style: AppTypography.cardTitle.copyWith(color: Colors.white),
                textAlign: TextAlign.center),
            const SizedBox(height: 32),
            if (widget.card.exampleSentence != null) ...[
              Text('Beispiel',
                  style: AppTypography.caption
                      .copyWith(color: Colors.white.withOpacity(0.7))),
              const SizedBox(height: 8),
              Text(widget.card.exampleSentence!,
                  style: AppTypography.body.copyWith(color: Colors.white),
                  textAlign: TextAlign.center),
              if (widget.card.exampleTranslation != null) ...[
                const SizedBox(height: 4),
                Text(widget.card.exampleTranslation!,
                    style: AppTypography.caption
                        .copyWith(color: Colors.white.withOpacity(0.7)),
                    textAlign: TextAlign.center),
              ],
            ],
            const Spacer(),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('← Wusste nicht    Wusste →',
                  style: AppTypography.caption
                      .copyWith(color: Colors.white.withOpacity(0.9))),
            ),
          ],
        ),
      ),
    );
  }
}