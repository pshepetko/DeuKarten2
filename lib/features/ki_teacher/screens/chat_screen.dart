// lib/features/ki_teacher/screens/chat_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/tts/tts_service.dart';
import '../../../core/tts/tts_service_factory.dart';
import '../../../core/stt/stt_service.dart';
import '../../../core/stt/stt_service_factory.dart';
import '../../../core/stt/stt_result.dart';
import '../providers/ki_teacher_providers.dart';
import '../models/chat_message_model.dart';
import '../services/chat_service.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/chat_bubble_widget.dart';

// ─── Глобальні сервіси ──────────────────────────────
final TtsService _ttsService = createTtsService();
final SttService _sttService = createSttService();

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isListening = false;
  bool _isSpeaking = false;
  String _interimText = '';
  String _sttLocale = 'de-DE';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(chatSessionProvider.notifier).startSession();
    });
  }

  @override
  void dispose() {
    _sttService.stopListening();
    _ttsService.stop();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // ─── TTS — Озвучення ───────────────────────────

  Future<void> _speakText(String text, {String locale = 'de-DE'}) async {
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
    if (_isSpeaking) {
      await _ttsService.stop();
      setState(() => _isSpeaking = false);
    }

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
      locale: _sttLocale,
      continuous: false,
      interimResults: true,
      onResult: (SttResult result) {
        if (!mounted) return;

        if (result.isFinal) {
          setState(() {
            _interimText = '';
            _isListening = false;
          });
          _sendMessage(result.text);
        } else {
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
          SnackBar(content: Text('🎤 $error'), backgroundColor: Colors.red),
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

  // ─── Відправка повідомлення ─────────────────────

  Future<void> _sendMessage(String text) async {
    final messageText = text.trim();
    if (messageText.isEmpty) return;

    ref.read(isAiTypingProvider.notifier).state = true;

    final userMessage = ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: messageText,
      role: ChatMessageRole.user,
      timestamp: DateTime.now(),
    );

    ref.read(chatMessagesProvider.notifier).addMessage(userMessage);
    ref.read(chatSessionProvider.notifier).addMessage(userMessage);

    _messageController.clear();
    _scrollToBottom();

    try {
      final session = ref.read(chatSessionProvider);
      final chatService = ref.read(chatServiceProvider);

      final aiResponse = await chatService.getAIResponse(
        userMessage: messageText,
        session: session!,
      );

      ref.read(chatMessagesProvider.notifier).addMessage(aiResponse);
      ref.read(chatSessionProvider.notifier).addMessage(aiResponse);

      // Озвучити відповідь AI
      await _speakText(aiResponse.content);

      _scrollToBottom();
    } catch (e) {
      final errorMessage = ChatMessageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content:
        'Es tut mir leid, aber ich konnte keine Antwort erhalten. Bitte versuchen Sie es erneut.',
        role: ChatMessageRole.assistant,
        timestamp: DateTime.now(),
        language: 'de',
        type: ChatMessageType.text,
      );

      ref.read(chatMessagesProvider.notifier).addMessage(errorMessage);
      _scrollToBottom();
    } finally {
      ref.read(isAiTypingProvider.notifier).state = false;
    }
  }

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
    final messages = ref.watch(chatMessagesProvider);
    final isAiTyping = ref.watch(isAiTypingProvider);
    final session = ref.watch(chatSessionProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'KI-Lehrer',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        actions: [
          // Перемикач мови STT
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            tooltip: 'Мова розпізнавання',
            onSelected: (locale) {
              setState(() => _sttLocale = locale);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('🎤 Мова: $locale'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                  value: 'de-DE', child: Text('🇩🇪 Deutsch')),
              const PopupMenuItem(
                  value: 'uk-UA', child: Text('🇺🇦 Українська')),
              const PopupMenuItem(
                  value: 'en-US', child: Text('🇺🇸 English')),
            ],
          ),
          if (session != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Center(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${session.durationMinutes}m',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.textSecondary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          QuickActionsWidget(
            onActionSelected: (prompt) {
              _messageController.text = prompt;
              _sendMessage(prompt);
            },
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: messages.length + (isAiTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == messages.length && isAiTyping) {
                  return _buildTypingIndicator();
                }

                final message = messages[index];
                return ChatBubbleWidget(
                  message: message,
                  isUser: message.isUser,
                  onSpeak: message.isUser
                      ? null
                      : () => _speakText(message.content),
                );
              },
            ),
          ),

          // Проміжний текст розпізнавання
          if (_interimText.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.mic, color: Colors.red, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _interimText,
                      style: AppTypography.body.copyWith(
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Хвильова анімація
          _VoiceWaveWidget(isListening: _isListening),

          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 400 + (index * 200)),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: AppColors.textTertiary,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    final isAiTyping = ref.watch(isAiTypingProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 🎤 Кнопка мікрофона
            _ChatMicButton(
              isListening: _isListening,
              isSpeaking: _isSpeaking,
              isDisabled: isAiTyping,
              onPressed: _toggleListening,
            ),
            const SizedBox(width: 8),

            // Текстове поле
            Expanded(
              child: TextField(
                controller: _messageController,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: _isListening
                      ? 'Sprechen Sie...'
                      : 'Schreibe auf Deutsch...',
                  hintStyle: AppTypography.body.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onSubmitted: (_) => _sendMessage(_messageController.text),
              ),
            ),
            const SizedBox(width: 8),

            // Кнопка відправки
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: () => _sendMessage(_messageController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Кнопка мікрофона для чату ──────────────────────

class _ChatMicButton extends StatefulWidget {
  final bool isListening;
  final bool isSpeaking;
  final bool isDisabled;
  final VoidCallback onPressed;

  const _ChatMicButton({
    required this.isListening,
    required this.isSpeaking,
    required this.isDisabled,
    required this.onPressed,
  });

  @override
  State<_ChatMicButton> createState() => _ChatMicButtonState();
}

class _ChatMicButtonState extends State<_ChatMicButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant _ChatMicButton oldWidget) {
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.isListening ? _pulseAnimation.value : 1.0,
          child: child,
        );
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _getColor(),
          boxShadow: widget.isListening
              ? [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ]
              : null,
        ),
        child: IconButton(
          icon: Icon(
            _getIcon(),
            color: Colors.white,
            size: 22,
          ),
          onPressed: widget.isDisabled ? null : widget.onPressed,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Color _getColor() {
    if (widget.isDisabled) return Colors.grey;
    if (widget.isListening) return Colors.red;
    if (widget.isSpeaking) return Colors.orange;
    return AppColors.primary;
  }

  IconData _getIcon() {
    if (widget.isSpeaking) return Icons.volume_up;
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
      height: isListening ? 40 : 0,
      child: isListening
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return _WaveBar(index: index, isAnimating: isListening);
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
      duration: Duration(milliseconds: 300 + (widget.index * 80)),
    );
    _heightAnimation = Tween<double>(begin: 6.0, end: 28.0).animate(
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
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 3,
          height: _heightAnimation.value,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.6),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      },
    );
  }
}