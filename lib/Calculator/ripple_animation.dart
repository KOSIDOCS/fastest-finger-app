import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math show sqrt;

/// You can use whatever widget as a [child], when you don't need to provide any
/// [child], just provide an empty Container().
/// [delay] is using a [Timer] for delaying the animation, it's zero by default.
/// You can set [repeat] to true for making a paulsing effect.
class RippleAnimation extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double minRadius;
  final Color color;
  final int ripplesCount;
  final Duration duration;
  final bool repeat;
  final bool? isAutoStart;
  final VoidCallback onTap;

  const RippleAnimation({
    Key? key,
    required this.child,
    required this.color,
    this.delay = const Duration(milliseconds: 0),
    this.repeat = false,
    // this.minRadius = 60,
    this.minRadius = 30,
    this.ripplesCount = 3,
    this.isAutoStart = true,
    this.duration = const Duration(milliseconds: 1000),
    required this.onTap,
  }) : super(key: key);

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Timer timer;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // repeating or just forwarding the animation once.
    if (widget.isAutoStart!) {
      timer = Timer(widget.delay, () {
        widget.repeat ? _controller.repeat() : _controller.forward();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter2(
        animation: _controller,
        colors: Colors.black,
        minRadius: widget.minRadius,
        wavesCount: widget.ripplesCount + 2,
      ),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          _controller.forward(from: 0.0);
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }
}

// Creating a Circular painter for clipping the rects and creating circle shapes
class CirclePainter2 extends CustomPainter {
  CirclePainter2({
    required this.animation,
    required this.minRadius,
    required this.wavesCount,
    required this.colors,
  }) : super(repaint: animation);
  final Color colors;
  final double minRadius;
  final int wavesCount;
  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 0; wave <= wavesCount; wave++) {
      circle(canvas, rect, minRadius, wave, animation.value, wavesCount);
    }
  }

  // animating the opacity according to min radius and waves count.
  void circle(Canvas canvas, Rect rect, double minRadius, int wave,
      double value, int length) {
    Color color;
    double r;
    if (wave != 0) {
      double opacity = (1 - ((wave - 1) / length) - value).clamp(0.0, 1.0);
      color = colors.withOpacity(opacity);

      r = minRadius * (1 + ((wave * value))) * value;
      final Paint paint = Paint()..color = color;
      canvas.drawCircle(rect.center, r, paint);
    }
  }

  @override
  bool shouldRepaint(CirclePainter2 oldDelegate) => true;
}

class CirclePainter extends CustomPainter {
  final Color colors;
  final Animation<double> _animation;
  CirclePainter(
    this._animation,
    this.colors,
  ) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color color = colors.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 0; wave <= 4; wave++) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
