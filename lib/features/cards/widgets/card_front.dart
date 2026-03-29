import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/tts/tts_segment.dart';
import '../../../core/tts/tts_tracker.dart';
import '../../../core/utils/text_utils.dart';
import '../models/enums.dart';
import '../providers/session_provider.dart';

class CardFront extends StatefulWidget {
  final CardData card;

  const CardFront({
    super.key,
    required this.card,
  });

  @override
  State<CardFront> createState() => _CardFrontState();
}

class _CardFrontState extends State<CardFront> {
  @override
  void initState() {
    super.initState();
    _autoSpeak();
  }

  @override
  void didUpdateWidget(CardFront oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.card.germanWord != widget.card.germanWord) {
      _autoSpeak();
    }
  }

  Future<void> _autoSpeak() async {
    final currentWord = widget.card.germanWord;

    if (TtsAutoSpeakTracker.wasFrontSpoken(currentWord)) return;

    await Future.delayed(const Duration(milliseconds: 150));
    if (!mounted) return;

    try {
      final germanText = buildGermanTtsText(
        widget.card.article,
        widget.card.germanWord,
      );

      if (germanText.isEmpty) return;

      debugPrint('🔊 AUTO-SPEAK: [$germanText]');

      TtsAutoSpeakTracker.markFrontSpoken(currentWord);

      // ✅ Слово + речення (два сегменти, обидва німецькою)
      final segments = <TtsSegment>[
        TtsSegment(text: germanText, locale: 'de-DE', rate: 0.9),
        if (widget.card.exampleSentence != null &&
            widget.card.exampleSentence!.trim().isNotEmpty)
          TtsSegment(
            text: widget.card.exampleSentence!.trim(),
            locale: 'de-DE',
            rate: 0.9,
          ),
      ];

      await globalTtsService.speakSegments(segments);
    } catch (e) {
      debugPrint('❌ Auto-TTS front: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: 320,
        height: 420,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  cardTypeToGerman(widget.card.type),
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textTertiary,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                _SpeakerButton(card: widget.card),
              ],
            ),
            const Spacer(),
            _buildCardContent(),
            const Spacer(),
            Text(
              'Tippen zum Umkehren',
              style: AppTypography.caption.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    switch (widget.card.type) {
      case CardType.noun:
      case CardType.verb:
      case CardType.adjective:
        return WordCardFrontContent(card: widget.card);
      case CardType.article:
        return ArticleCardFrontContent(card: widget.card);
      case CardType.sentence:
        return SentenceCardFrontContent(card: widget.card);
      default:
        return WordCardFrontContent(card: widget.card);
    }
  }
}

// ─── Кнопка динаміка ────────────────────────────

class _SpeakerButton extends StatefulWidget {
  final CardData card;
  const _SpeakerButton({required this.card});

  @override
  State<_SpeakerButton> createState() => _SpeakerButtonState();
}

class _SpeakerButtonState extends State<_SpeakerButton>
    with SingleTickerProviderStateMixin {
  bool _isSpeaking = false;
  late AnimationController _animController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _onSpeakPressed() async {
    if (_isSpeaking) {
      await globalTtsService.stop();
      _stopAnimation();
      return;
    }

    _startAnimation();

    try {
      final card = widget.card;

      final germanText = buildGermanTtsText(card.article, card.germanWord);

      final segments = <TtsSegment>[
        if (germanText.isNotEmpty)
          TtsSegment(text: germanText, locale: 'de-DE', rate: 1.0),
        if (card.translation.isNotEmpty)
          TtsSegment(text: card.translation, locale: 'uk-UA', rate: 1.0),
        if (card.exampleSentence != null &&
            card.exampleSentence!.trim().isNotEmpty)
          TtsSegment(
            text: card.exampleSentence!.trim(),
            locale: 'de-DE',
            rate: 1.0,
          ),
        if (card.exampleTranslation != null &&
            card.exampleTranslation!.trim().isNotEmpty)
          TtsSegment(
            text: card.exampleTranslation!.trim(),
            locale: 'uk-UA',
            rate: 1.0,
          ),
      ];

      if (segments.isEmpty) {
        _stopAnimation();
        return;
      }

      await globalTtsService.speakSegments(segments);
    } catch (e) {
      debugPrint('❌ TTS помилка: $e');
    } finally {
      _stopAnimation();
    }
  }

  void _startAnimation() {
    setState(() => _isSpeaking = true);
    _animController.repeat(reverse: true);
  }

  void _stopAnimation() {
    if (mounted) {
      setState(() => _isSpeaking = false);
      _animController.stop();
      _animController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _isSpeaking ? _pulseAnimation.value : 1.0,
          child: child,
        );
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _onSpeakPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isSpeaking
                  ? AppColors.primary.withOpacity(0.15)
                  : AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              _isSpeaking ? Icons.volume_up : Icons.volume_up_outlined,
              color:
              _isSpeaking ? AppColors.primary : AppColors.textSecondary,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Контент карток ─────────────────────────────

class WordCardFrontContent extends StatelessWidget {
  final CardData card;
  const WordCardFrontContent({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final displayArticle = normalizeArticle(card.article);

    return Column(
      children: [
        Text(card.imageUrl ?? '📚', style: const TextStyle(fontSize: 80)),
        const SizedBox(height: 24),
        if (card.germanWord != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text.rich(
                  TextSpan(children: [
                    if (displayArticle.isNotEmpty)
                      TextSpan(
                        text: '$displayArticle ',
                        style: AppTypography.section
                            .copyWith(color: AppColors.primary),
                      ),
                    TextSpan(
                      text: card.germanWord!,
                      style: AppTypography.germanWord,
                    ),
                  ]),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        if (card.pluralForm != null && card.pluralForm!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('Pl: ${card.pluralForm}',
                style: AppTypography.caption),
          ),
      ],
    );
  }
}

class ArticleCardFrontContent extends StatelessWidget {
  final CardData card;
  const ArticleCardFrontContent({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (card.germanWord != null)
        Text('___ ${card.germanWord}', style: AppTypography.germanWord),
      const SizedBox(height: 32),
      Text('Wähle den richtigen Artikel',
          style:
          AppTypography.body.copyWith(color: AppColors.textSecondary)),
      const SizedBox(height: 24),
      if (card.articleOptions != null)
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: card.articleOptions!
              .map((o) => ChoiceChip(
              label: Text(o), selected: false, onSelected: (_) {}))
              .toList(),
        ),
    ]);
  }
}

class SentenceCardFrontContent extends StatelessWidget {
  final CardData card;
  const SentenceCardFrontContent({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (card.incompleteSentence != null)
        Text(card.incompleteSentence!,
            style: AppTypography.section, textAlign: TextAlign.center),
      const SizedBox(height: 32),
      if (card.wordOptions != null)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: card.wordOptions!
              .map((w) => ActionChip(label: Text(w), onPressed: () {}))
              .toList(),
        ),
      if (card.grammarTopic != null) ...[
        const SizedBox(height: 24),
        Text(card.grammarTopic!,
            style: AppTypography.caption.copyWith(
                color: AppColors.textTertiary,
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.center),
      ],
    ]);
  }
}