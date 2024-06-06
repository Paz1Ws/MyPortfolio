import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/screens/about_screen.dart';
import 'package:my_portfolio/presentation/screens/certifications_screen.dart';
import 'package:my_portfolio/presentation/screens/projects_screen.dart';
import 'package:my_portfolio/presentation/widgets/ForAbout/theme_button.dart';

import '../widgets/ForAbout/audioplayer_button.dart';
import 'exp&tech_screen.dart';

class GlobalScreen extends ConsumerWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> screens = [
      AboutScreen(),
      ProyectsScreen(),
      const ExpAndTech(),
      const CertificationsScreen(),
    ];

    return Scaffold(
        appBar: AppBar(
          actions: [
            const ThemeIconButton(),
            ButtonPlayer(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: screens.map((screen) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: screen,
              );
            }).toList(),
          ),
        ));
  }
}
