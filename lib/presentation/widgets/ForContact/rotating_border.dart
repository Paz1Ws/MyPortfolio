import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/widgets/ForContact/rotating_painter.dart';

class RotatingBorder extends AnimatedWidget {
  final AnimationController animationController;
  final Color color1;
  final Color color2;
  final Color color3;

  RotatingBorder({
    required Key key,
    required this.animationController,
    required this.color1,
    required this.color2,
    required this.color3,
  }) : super(key: key, listenable: animationController);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      size: size,
      painter: RotatingBorderPainter(
        color1: color1,
        color2: color2,
        color3: color3,
      ),
    );
  }
}
