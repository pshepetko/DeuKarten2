import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwipeableCard extends StatefulWidget {
  final bool isFlipped;
  final Widget front;
  final Widget back;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final VoidCallback onFlip;
  final ValueChanged<double>? onSwipeProgress;

  const SwipeableCard({
    super.key,
    required this.isFlipped,
    required this.front,
    required this.back,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    required this.onFlip,
    this.onSwipeProgress,
  });

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard>
    with TickerProviderStateMixin {
  late AnimationController _flipController;
  late AnimationController _swipeController;
  AnimationController? _positionController;

  Offset _dragPosition = Offset.zero;
  double _dragAngle = 0;
  double _swipeProgress = 0;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _swipeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void didUpdateWidget(SwipeableCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.isFlipped) {
        _flipController.forward();
      } else {
        _flipController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _positionController?.stop();
    _positionController?.dispose();
    _flipController.dispose();
    _swipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onFlip,
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _flipController,
          _swipeController,
          if (_positionController != null) _positionController!,
        ]),
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..translate(_dragPosition.dx, _dragPosition.dy)
              ..rotateZ(_dragAngle),
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _flipController,
              builder: (context, child) {
                final angle = _flipController.value * pi;
                final isFrontVisible = angle < pi / 2;

                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: isFrontVisible
                      ? widget.front
                      : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: widget.back,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _onPanStart(DragStartDetails details) {
    _swipeController.stop();
    _positionController?.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!mounted) return;

    setState(() {
      _dragPosition += details.delta;
      _dragAngle = _dragPosition.dx * 0.001;
      _swipeProgress = (_dragPosition.dx / 150).clamp(-1.0, 1.0);
    });

    widget.onSwipeProgress?.call(_swipeProgress);
  }

  void _onPanEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx;

    if (_dragPosition.dx > 100 || velocity > 300) {
      HapticFeedback.mediumImpact();
      _animateSwipeOut(direction: 1);
    } else if (_dragPosition.dx < -100 || velocity < -300) {
      HapticFeedback.mediumImpact();
      _animateSwipeOut(direction: -1);
    } else {
      _animateSnapBack();
    }
  }

  void _animateSwipeOut({required int direction}) {
    final targetOffset = Offset(direction * 500.0, _dragPosition.dy);

    _swipeController.animateTo(
      1.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    _animatePosition(
      start: _dragPosition,
      end: targetOffset,
      duration: const Duration(milliseconds: 300),
      onComplete: () {
        if (!mounted) return;

        widget.onSwipeProgress?.call(0);

        if (direction > 0) {
          widget.onSwipeRight();
        } else {
          widget.onSwipeLeft();
        }

        // setState тут вже не обов'язковий, бо картка скоріш за все буде прибрана
      },
    );
  }

  void _animateSnapBack() {
    _animatePosition(
      start: _dragPosition,
      end: Offset.zero,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      onComplete: () {
        if (!mounted) return;

        setState(() {
          _dragPosition = Offset.zero;
          _dragAngle = 0;
          _swipeProgress = 0;
        });
        widget.onSwipeProgress?.call(0);
      },
    );
  }

  void _animatePosition({
    required Offset start,
    required Offset end,
    required Duration duration,
    Curve curve = Curves.easeOut,
    VoidCallback? onComplete,
  }) {
    _positionController?.stop();
    _positionController?.dispose();

    _positionController = AnimationController(
      vsync: this,
      duration: duration,
    );

    final animation = Tween<Offset>(
      begin: start,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: _positionController!,
        curve: curve,
      ),
    );

    animation.addListener(() {
      if (!mounted) return;

      setState(() {
        _dragPosition = animation.value;
        _dragAngle = _dragPosition.dx * 0.001;
        _swipeProgress = (_dragPosition.dx / 150).clamp(-1.0, 1.0);
      });

      widget.onSwipeProgress?.call(_swipeProgress);
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onComplete?.call();
      }
    });

    _positionController!.forward();
  }
}