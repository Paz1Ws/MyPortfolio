import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skill_list.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_subtitles.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_titles.dart';

class ExpAndTech extends ConsumerWidget {
  const ExpAndTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void precacheImages(BuildContext context) {
      // Precargar las imágenes en caché
      precacheImage(
        AssetImage("assets/images/design/dots_globe_grey.png"),
        context,
      );
      precacheImage(
        AssetImage("assets/images/design/blob_black.png"),
        context,
      );
    }

    precacheImages(context);

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Skills(),
            Positioned(
              top: MediaQuery.of(context).size.height - 500,
              left: -100,
              child: Image.asset(
                "assets/images/design/dots_globe_grey.png",
                color: AppColors.cyan,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              right: -100,
              child: Image.asset(
                "assets/images/design/blob_black.png",
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

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
        const TechsList(),
      ],
    );
  }
}
