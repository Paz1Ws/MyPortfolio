import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skill_list.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skills_list_mobile.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_subtitles.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_titles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ExpAndTech extends ConsumerWidget {
  const ExpAndTech({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Positioned(
            top: MediaQuery.sizeOf(context).height / 2,
            right: -100,
            child: Image.asset(
              "assets/images/design/blob_black.png",
              height: MediaQuery.sizeOf(context).height / 3,
            ),
          ),
          Skills(),
          Positioned(
            top: MediaQuery.sizeOf(context).height - 500,
            left: -100,
            child: Image.asset("assets/images/design/dots_globe_grey.png",
                color: AppColors.cyan),
          ),
        ]),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientForTitles(
          title: "My Skills: ",
        ),
        const SizedBox(height: 20),
        GradientForSubtitles(
          title: "I have experience with the following technologies",
        ),
        const SizedBox(height: 20),
        ResponsiveBreakpoints.of(context).isMobile
            ? TechsListMobile()
            : TechsListDesktop()
      ],
    );
  }
}
