import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';

class GradientForSubtitles extends StatelessWidget {
  final String title;
  const GradientForSubtitles({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
              colors: [
                AppColors.deepPurple,
                AppColors.softPurple,
              ],
            ).createShader(bounds),
        child: Text(title,
            textAlign: TextAlign.center,
            style: AppFonts.josefinSans24.copyWith(
              color: AppColors.softPurple,
              fontWeight: FontWeight.bold,
              height: 0,
            )));
  }
}
