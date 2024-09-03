import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';

class GradientForTitles extends StatelessWidget {
  final String title;
  const GradientForTitles({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [AppColors.cyan, AppColors.softPurple, AppColors.deepPurple],
      ).createShader(bounds),
      child: Text(
        title,
        style: AppFonts.styleTitleGradients,
      ),
    );
  }
}
