import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/theme/global_theme.dart';
import 'package:my_portfolio/presentation/screens/global_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'My Portfolio',
      theme:
          theme.globalBrightnessisDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: ResponsiveBreakpoints.builder(
        child: GlobalScreen(),
        breakpoints: [
          const Breakpoint(start: 0, end: 820, name: 'MOBILE'),
          const Breakpoint(start: 821, end: 980, name: 'TABLET'),
          const Breakpoint(start: 981, end: 1920, name: 'DESKTOP'),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
