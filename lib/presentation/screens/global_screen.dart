import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/screens/about_screen.dart';
import 'package:my_portfolio/presentation/screens/certifications_screen.dart';
import 'package:my_portfolio/presentation/screens/contact_screen.dart';
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
      const CertificationsScreen(),
      ExpAndTech(),
      const ContactScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          const ThemeIconButton(),
          ButtonPlayer(),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: screens.map((screen) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: screen,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
