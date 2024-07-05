import 'dart:math';

import 'package:flutter/material.dart';

class RotatingBorderPainter extends CustomPainter {
  final Color color1;
  final Color color2;
  final Color color3;

  RotatingBorderPainter({
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the radius based on the size
    final radius = size.width / 2;

    // Paint the three rotating border elements
    for (int i = 0; i < 3; i++) {
      final angle = (i * 120) * (pi / 180); // Calculate the angle for each element
      final paint = Paint()
        ..color = i == 0 ? color1 : i == 1 ? color2 : color3 // Set color based on index
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke; // Set stroke style

      // Calculate the offset based on the animation progress
      final offset = Offset(radius * cos(angle), radius * sin(angle));

      // Draw the arc
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        angle,
        2 * pi / 3, // Arc coverage
        false, // Do not fill
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
