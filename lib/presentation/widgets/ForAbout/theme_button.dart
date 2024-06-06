import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/theme/global_theme.dart';

class ThemeIconButton extends ConsumerWidget {
  const ThemeIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return IconButton(
      onPressed: () {
        theme.globalBrightnessisDark
            ? theme.setLightTheme()
            : theme.setDarkTheme();
      },
      icon: theme.globalBrightnessisDark
          ? const Icon(Icons.light_mode)
          : const Icon(Icons.dark_mode),
    );
  }
}
