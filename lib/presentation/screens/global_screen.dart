import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/providers/scroll_provider.dart';
import 'package:my_portfolio/presentation/screens/about_screen.dart';
import 'package:my_portfolio/presentation/screens/certifications_screen.dart';
import 'package:my_portfolio/presentation/screens/contact_screen.dart';
import 'package:my_portfolio/presentation/screens/projects_screen.dart';
import 'package:my_portfolio/presentation/screens/what_I_do.dart';
import 'package:my_portfolio/presentation/widgets/General/custom_app_bar.dart';
import 'exp&tech_screen.dart';

class GlobalScreen extends ConsumerWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ScrollController scrollController =
        ref.watch(scrollControllerProvider);

    final List<Widget> screens = [
      FadeIn(duration: const Duration(seconds: 2), child: const AboutScreen()),
      FadeInRight(
          duration: const Duration(seconds: 2), child: ServiceSection()),
      FadeInLeft(duration: const Duration(seconds: 2), child: ProjectsScreen()),
      BounceInUp(
          duration: const Duration(seconds: 2),
          child: const CertificationsScreen()),
      ElasticInUp(
          duration: const Duration(seconds: 2), child: const ExpAndTech()),
      FlipInX(child: const ContactScreen()),
    ];

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverAppBar(
              expandedHeight: 0.0,
              pinned: false,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              floating: true,
              flexibleSpace: CustomAppBar()),
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
      ),
    );
  }
}
