import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/global_theme.dart';

class AppFonts {
  static final TextStyle josefinSans = GoogleFonts.josefinSans(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );
  static final TextStyle josefinSans14 = GoogleFonts.josefinSans(
    color: Colors.white, // Cyan
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle josefinSans24 = GoogleFonts.josefinSans(
    color: AppColors.cyan,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    height: 1.2, // Adjust the line spacing here
  );
  static final TextStyle josefinSans32 = GoogleFonts.josefinSans(
    color: Colors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle styleTitleGradients = GoogleFonts.ubuntuMono(
    decoration: TextDecoration.underline,
    decorationThickness: 2,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
  static TextStyle tangerine(BuildContext context) {
    return GoogleFonts.tangerine(
        shadows: [
          Shadow(
              color: AppColors.brightnessInverse(context),
              offset: const Offset(2, 2),
              blurRadius: 2)
        ],
        fontSize: 40,
        color: AppColors.brightness(context),
        fontWeight: FontWeight.bold);
  }
}
