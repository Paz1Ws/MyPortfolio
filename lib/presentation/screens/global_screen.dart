import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      const ExpAndTech(),
      const ContactScreen(),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            flexibleSpace: CustomAppBar(),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final screen = screens[index];
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 80,
                  child: screen,
                );
              },
              childCount: screens.length,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width / 3,
        left: MediaQuery.sizeOf(context).width / 3,
      ),
      child: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
        ),
        actions: [
          const ThemeIconButton(),
          ButtonPlayer(),
        ],
      ),
    );
  }
}
