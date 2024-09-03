import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:my_portfolio/config/theme/global_theme.dart';

class AvailableToWork extends StatefulWidget {
  const AvailableToWork({super.key});

  @override
  _AvailableToWorkState createState() => _AvailableToWorkState();
}

class _AvailableToWorkState extends State<AvailableToWork>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withOpacity(0.5 * _animation.value),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(width: 8),
          Text('Available To Work',
              style: AppFonts.josefinSans.copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              )),
        ],
      ),
    );
  }
}
