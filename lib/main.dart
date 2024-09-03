import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/theme/global_theme.dart';
import 'package:my_portfolio/presentation/screens/global_screen.dart';

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
        home: GlobalScreen());
  }
}
