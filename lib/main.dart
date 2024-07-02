import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/theme/global_theme.dart';
import 'package:my_portfolio/presentation/widgets/screen_loader.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 10));
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      theme:
          theme.globalBrightnessisDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
