import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/presentation/screens/about_screen.dart';
import 'package:my_portfolio/presentation/screens/certifications_screen.dart';
import 'package:my_portfolio/presentation/screens/contact_screen.dart';
import 'package:my_portfolio/presentation/screens/projects_screen.dart';
import 'package:my_portfolio/presentation/screens/what_I_do.dart';
import 'package:my_portfolio/presentation/widgets/ForAbout/audioplayer_button.dart';
import 'package:my_portfolio/presentation/widgets/ForAbout/theme_button.dart';
import 'package:my_portfolio/presentation/widgets/General/custom_app_bar.dart';
import 'package:my_portfolio/presentation/widgets/General/custom_bottom_shet_navigator.dart';
import 'exp&tech_screen.dart';

class GlobalScreen extends ConsumerWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final List<Widget> screens = [
      FadeIn(child: AboutScreen()),
      ServiceSection(),
      ProyectsScreen(),
      const CertificationsScreen(),
      const ExpAndTech(),
      const ContactScreen(),
    ];

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: CustomAppBar(),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final screen = screens[index];
              return screen != screens[5]
                  ? SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      child: screen,
                    )
                  : SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      height: MediaQuery.sizeOf(context).height / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: screen,
                      ),
                    );
            },
            childCount: screens.length,
          ),
        ),
      ],
    ));
  }
}
