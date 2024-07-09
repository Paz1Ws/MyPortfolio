import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/presentation/screens/global_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      animationDuration: const Duration(milliseconds: 2000),
      splash: Expanded(
        child: Center(
          child: Lottie.asset('assets/animations/SplashScreen.json'),
        ),
      ),
      nextScreen: FadeIn(child: const GlobalScreen()),
      duration: 1300,
    );
  }
}
