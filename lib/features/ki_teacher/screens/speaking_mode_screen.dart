// lib/features/speaking/screens/speaking_mode_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/tts/tts_service.dart';
import '../../../core/tts/tts_service_factory.dart';
import '../../../core/tts/tts_segment.dart';
import '../../../core/stt/stt_service.dart';
import '../../../core/stt/stt_service_factory.dart';
import '../../../core/stt/stt_result.dart';
import '../providers/ai_service_provider.dart';

// ─── Глобальні сервіси ──────────────────────────────
final TtsService _ttsService = createTtsService();
final SttService _sttService = createSttService();

class SpeakingModeScreen extends ConsumerStatefulWidget {
  const SpeakingModeScreen({super.key});

  @override
  ConsumerState<SpeakingModeScreen> createState() => _SpeakingModeScreenState();
}

class _SpeakingModeScreenState extends ConsumerState<SpeakingModeScreen> {
  final List<ConversationMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();

  bool _isAIThinking = false;
  bool _isListening = false;
  bool _isSpeaking = false;
  String _interimText = '';
  String _selectedLocale = 'de-DE'; // мова розпізнавання

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkMicPermission();
      _startConversation();
    });
  }

  @override
  void dispose() {
    _sttService.stopListening();
    _ttsService.stop();
    _scrollController.dispose();
    super.dispose();
  }

  // ─── Ініціалізація ──────────────────────────────

  Future<void> _checkMicPermission() async {
    final available = await _sttService.isAvailable();
    if (!available) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('⚠️ Розпізнавання мовлення недоступне в цьому браузері'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  // ─── Початок розмови ────────────────────────────

  void _startConversation() async {
    final aiService = ref.read(aiServiceProvider);
    final response = await aiService.startDialog('Greetings');

    if (mounted) {
      setState(() {
        _messages.add(ConversationMessage(
          text: response.aiMessage,
          isUser: false,
        ));
      });

      _scrollToBottom();

      // Озвучити привітання
      await _speakText(response.aiMessage);
    }
  }

  // ─── TTS — Озвучення ───────────────────────────

  Future<void> _speakText(String text, {String locale = 'de-DE'}) async {
    // Зупиняємо мікрофон на час озвучення (щоб не ловити свій голос)
    if (_isListening) {
      await _stopListening();
    }

    setState(() => _isSpeaking = true);

    try {
      await _ttsService.speak(text, locale: locale, rate: 0.9);
    } catch (e) {
      debugPrint('❌ TTS помилка: $e');
    } finally {
      if (mounted) {
        setState(() => _isSpeaking = false);
      }
    }
  }

  // ─── STT — Мікрофон ────────────────────────────

  Future<void> _startListening() async {
    // Зупиняємо TTS якщо говорить
    if (_isSpeaking) {
      await _ttsService.stop();
      setState(() => _isSpeaking = false);
    }

    // Запитуємо дозвіл
    final hasPermission = await _sttService.requestPermission();
    if (!hasPermission) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('🎤 Дозвольте доступ до мікрофона'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    final started = await _sttService.startListening(
      locale: _selectedLocale,
      continuous: false, // одна фраза за раз
      interimResults: true,
      onResult: (SttResult result) {
        if (!mounted) return;

        if (result.isFinal) {
          // Фінальний результат → відправляємо AI
          setState(() {
            _interimText = '';
            _isListening = false;
          });
          _handleVoiceInput(result.text);
        } else {
          // Проміжний → показуємо
          setState(() => _interimText = result.text);
        }
      },
      onStatus: (SttStatus status) {
        if (!mounted) return;
        setState(() {
          _isListening = status == SttStatus.listening;
        });
      },
      onError: (String error) {
        if (!mounted) return;
        setState(() {
          _isListening = false;
          _interimText = '';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('🎤 $error'),
            backgroundColor: Colors.red,
          ),
        );
      },
    );

    if (started && mounted) {
      setState(() => _isListening = true);
    }
  }

  Future<void> _stopListening() async {
    await _sttService.stopListening();
    if (mounted) {
      setState(() {
        _isListening = false;
      });
    }
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _stopListening();
    } else {
      await _startListening();
    }
  }

  // ─── Обробка голосового вводу ───────────────────

  void _handleVoiceInput(String text) async {
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ConversationMessage(text: text, isUser: true));
      _isAIThinking = true;
    });

    _scrollToBottom();

    // Отримуємо відповідь AI
    try {
      final aiService = ref.read(aiServiceProvider);
      final aiResponse = await aiService.startDialog('Conversation');

      if (mounted) {
        setState(() {
          _isAIThinking = false;
          _messages.add(ConversationMessage(
            text: aiResponse.aiMessage,
            isUser: false,
          ));
        });

        _scrollToBottom();

        // Озвучити відповідь AI
        await _speakText(aiResponse.aiMessage);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isAIThinking = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Помилка AI: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ─── Скрол до останнього повідомлення ───────────

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ─── UI ─────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sprachübung'),
        actions: [
          // Перемикач мови розпізнавання
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            tooltip: 'Мова розпізнавання',
            onSelected: (locale) {
              setState(() => _selectedLocale = locale);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('🎤 Мова: $locale'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'de-DE', child: Text('🇩🇪 Deutsch')),
              const PopupMenuItem(value: 'uk-UA', child: Text('🇺🇦 Українська')),
              const PopupMenuItem(value: 'en-US', child: Text('🇺🇸 English')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: () => _showDiagnostics(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // ─── Історія повідомлень ───
          Expanded(
            child: _messages.isEmpty
                ? const Center(
              child: Text(
                'Розмова почнеться автоматично...',
                style: TextStyle(color: Colors.grey),
              ),
            )
                : ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),

          // ─── AI думає ───
          if (_isAIThinking)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'AI denkt nach...',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

          // ─── Хвильова анімація при слуханні ───
          _VoiceWaveWidget(isListening: _isListening),

          // ─── Розпізнаний текст (проміжний) ───
          if (_interimText.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.mic, color: Colors.red, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _interimText,
                      style: AppTypography.body.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // ─── Кнопка мікрофона ───
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Статус
                Text(
                  _getStatusText(),
                  style: AppTypography.caption.copyWith(
                    color: _isListening ? Colors.red : AppColors.textTertiary,
                  ),
                ),
                const SizedBox(height: 16),

                // Кнопка
                _MicrophoneButton(
                  isListening: _isListening,
                  isSpeaking: _isSpeaking,
                  isAIThinking: _isAIThinking,
                  onPressed: _toggleListening,
                ),

                const SizedBox(height: 8),

                // Підказка мови
                Text(
                  'Мова: $_selectedLocale',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textTertiary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusText() {
    if (_isSpeaking) return '🔊 AI говорить...';
    if (_isAIThinking) return '🤔 AI думає...';
    if (_isListening) return '🔴 Слухаю...';
    return 'Натисніть мікрофон щоб говорити';
  }

  // ─── Бабл повідомлення ──────────────────────────

  Widget _buildMessageBubble(ConversationMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: message.isUser ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(message.isUser ? 16 : 4),
            bottomRight: Radius.circular(message.isUser ? 4 : 16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                message.text,
                style: AppTypography.body.copyWith(
                  color:
                  message.isUser ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ),
            // Кнопка озвучення для повідомлень AI
            if (!message.isUser) ...[
              const SizedBox(width: 4),
              InkWell(
                onTap: () => _speakText(message.text),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    _isSpeaking ? Icons.volume_up : Icons.volume_up_outlined,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ─── Діагностика ────────────────────────────────

  Future<void> _showDiagnostics(BuildContext context) async {
    final sttDiag = await _sttService.diagnose();
    final ttsDiag = await _ttsService.diagnose();

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('🔧 Діагностика'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🎤 STT (мікрофон):',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ...sttDiag.entries.map((e) => Text('  ${e.key}: ${e.value}')),
              const SizedBox(height: 16),
              const Text('🔊 TTS (озвучення):',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ...ttsDiag.entries.map((e) => Text('  ${e.key}: ${e.value}')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// ─── Кнопка мікрофона з анімацією ───────────────────

class _MicrophoneButton extends StatefulWidget {
  final bool isListening;
  final bool isSpeaking;
  final bool isAIThinking;
  final VoidCallback onPressed;

  const _MicrophoneButton({
    required this.isListening,
    required this.isSpeaking,
    required this.isAIThinking,
    required this.onPressed,
  });

  @override
  State<_MicrophoneButton> createState() => _MicrophoneButtonState();
}

class _MicrophoneButtonState extends State<_MicrophoneButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _glowAnimation = Tween<double>(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant _MicrophoneButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isListening && !oldWidget.isListening) {
      _controller.repeat(reverse: true);
    } else if (!widget.isListening && oldWidget.isListening) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isDisabled => widget.isSpeaking || widget.isAIThinking;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.isListening ? _scaleAnimation.value : 1.0,
          child: GestureDetector(
            onTap: _isDisabled ? null : widget.onPressed,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getButtonColor(),
                boxShadow: [
                  if (widget.isListening)
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: _glowAnimation.value,
                      spreadRadius: _glowAnimation.value / 4,
                    ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                _getIcon(),
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getButtonColor() {
    if (_isDisabled) return Colors.grey;
    if (widget.isListening) return Colors.red;
    return AppColors.primary;
  }

  IconData _getIcon() {
    if (widget.isSpeaking) return Icons.volume_up;
    if (widget.isAIThinking) return Icons.hourglass_top;
    if (widget.isListening) return Icons.stop;
    return Icons.mic;
  }
}

// ─── Хвильова анімація ──────────────────────────────

class _VoiceWaveWidget extends StatelessWidget {
  final bool isListening;

  const _VoiceWaveWidget({required this.isListening});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isListening ? 60 : 0,
      child: isListening
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(7, (index) {
          return _WaveBar(
            index: index,
            isAnimating: isListening,
          );
        }),
      )
          : const SizedBox.shrink(),
    );
  }
}

class _WaveBar extends StatefulWidget {
  final int index;
  final bool isAnimating;

  const _WaveBar({required this.index, required this.isAnimating});

  @override
  State<_WaveBar> createState() => _WaveBarState();
}

class _WaveBarState extends State<_WaveBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400 + (widget.index * 100)),
    );
    _heightAnimation = Tween<double>(begin: 8.0, end: 40.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant _WaveBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating && !oldWidget.isAnimating) {
      _controller.repeat(reverse: true);
    } else if (!widget.isAnimating && oldWidget.isAnimating) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _heightAnimation,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: 4,
          height: _heightAnimation.value,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.7),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      },
    );
  }
}

// ─── Модель повідомлення ────────────────────────────

class ConversationMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ConversationMessage({
    required this.text,
    required this.isUser,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}