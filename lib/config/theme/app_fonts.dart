import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';

class AppFonts {
  static final TextStyle josefinSans = GoogleFonts.josefinSans(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );
  static final TextStyle ubuntuMono = GoogleFonts.ubuntuMono(
    fontSize: 40,
  );
  static TextStyle ubuntu20(BuildContext context) {
    return GoogleFonts.ubuntuMono(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.brightness(context));
  }

  static final TextStyle josefinSans14 = GoogleFonts.josefinSans(
    color: Colors.white, // Cyan
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle josefinSans20 = GoogleFonts.josefinSans(
    color: Colors.grey[800],
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static final TextStyle josefinSans24 = GoogleFonts.josefinSans(
    color: AppColors.cyan,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    height: 1.2, // Adjust the line spacing here
  );
  static final TextStyle josefinSans25 = GoogleFonts.josefinSans(
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
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
