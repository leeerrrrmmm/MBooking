// core/widgets/futuristic_loader.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';

class FuturisticLoader extends StatefulWidget {
  final double size;
  final String? label;

  const FuturisticLoader({super.key, this.size = 72, this.label});

  @override
  State<FuturisticLoader> createState() => _FuturisticLoaderState();
}

class _FuturisticLoaderState extends State<FuturisticLoader>
    with TickerProviderStateMixin {
  late final AnimationController _spin;
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _spin = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _spin.dispose();
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: AnimatedBuilder(
            animation: Listenable.merge([_spin, _pulse]),
            builder: (context, _) {
              final pulse = 0.85 + (_pulse.value * 0.15);

              return Transform.scale(
                scale: pulse,
                child: CustomPaint(
                  painter: _OrbitLoaderPainter(
                    progress: _spin.value,
                    accent: const Color(0xFFFCC434),
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.label != null) ...[
          const SizedBox(height: 18),
          Text(
            widget.label!,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 13,
              letterSpacing: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

class _OrbitLoaderPainter extends CustomPainter {
  final double progress;
  final Color accent;

  _OrbitLoaderPainter({required this.progress, required this.accent});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.36;

    // Внешнее кольцо (тонкое, приглушённое)
    final ringPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, radius + 10, ringPaint);

    // Основная дуга
    final arcPaint = Paint()
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: math.pi * 2,
        colors: [
          accent.withValues(alpha: 0.05),
          accent.withValues(alpha: 0.9),
          accent,
        ],
        stops: const [0.0, 0.7, 1.0],
        transform: GradientRotation(progress * math.pi * 2),
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.2
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      progress * math.pi * 2,
      math.pi * 1.35,
      false,
      arcPaint,
    );

    // Вторая дуга (обратная, тоньше)
    final arc2 = Paint()
      ..color = accent.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 9),
      -progress * math.pi * 2.4,
      math.pi * 0.9,
      false,
      arc2,
    );

    // Орбитальные точки
    for (var i = 0; i < 3; i++) {
      final angle = (progress * math.pi * 2) + (i * 2.1);
      final r = radius + 10;
      final dx = center.dx + math.cos(angle) * r;
      final dy = center.dy + math.sin(angle) * r;

      final dotPaint = Paint()
        ..color = accent.withValues(alpha: 0.9 - i * 0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);

      canvas.drawCircle(Offset(dx, dy), 2.8 - i * 0.5, dotPaint);
    }

    // Центр — «ядро»
    final corePaint = Paint()
      ..color = accent.withValues(alpha: 0.9)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawCircle(center, 4.5, corePaint);

    final coreInner = Paint()..color = Colors.white.withValues(alpha: 0.95);
    canvas.drawCircle(center, 2.2, coreInner);
  }

  @override
  bool shouldRepaint(covariant _OrbitLoaderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
