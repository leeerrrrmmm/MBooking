import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({required this.notchX, this.notchRadius = 7, this.radius = 16});

  final double notchX;
  final double notchRadius;
  final double radius;

  @override
  Path getClip(Size size) {
    final base = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    final notches = Path()
      ..addOval(Rect.fromCircle(center: Offset(notchX, 0), radius: notchRadius))
      ..addOval(
        Rect.fromCircle(
          center: Offset(notchX, size.height),
          radius: notchRadius,
        ),
      );

    return Path.combine(PathOperation.difference, base, notches);
  }

  @override
  bool shouldReclip(covariant TicketClipper oldClipper) =>
      oldClipper.notchX != notchX;
}

class PerforationPainter extends CustomPainter {
  PerforationPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    const dash = 4.0;
    const gap = 4.0;
    final x = size.width / 2;
    double y = 10;

    while (y < size.height - 10) {
      canvas.drawLine(Offset(x, y), Offset(x, y + dash), paint);
      y += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant PerforationPainter oldDelegate) => false;
}
