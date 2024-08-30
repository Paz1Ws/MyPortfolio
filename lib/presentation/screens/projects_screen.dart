import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/presentation/providers/information_projects_prov.dart';
import 'package:my_portfolio/presentation/widgets/Projects/information_project_card.dart';
import 'package:my_portfolio/presentation/widgets/Projects/projects_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectsScreen extends ConsumerWidget {
  final riverpodProvider = Information();

  ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectIndex = ref.watch(selectedProjectIndexProvider);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.1,
            right: -80,
            child: Image.asset(
              "assets/images/design/blob_femur_ash.png",
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.1)
                  : const Color.fromARGB(36, 36, 36, 35),
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Expanded(
            child: Opacity(
              opacity: 0.5,
              child: SizedBox.expand(
                child: SvgPicture.asset(
                  "assets/images/design/projects_background.svg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF00BCD4),
                      Color.fromRGBO(156, 39, 176, 1),
                      Colors.deepPurpleAccent,
                    ],
                  ).createShader(bounds),
                  child: Text(
                    "All my Projects till the moment",
                    style: GoogleFonts.ubuntuMono(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 120, 24, 136),
                      Color.fromARGB(255, 170, 45, 192),
                    ],
                  ).createShader(bounds),
                  child: Text(
                    "Showcases of my passion for innovation",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const ProjectsSwiper(),
                      ),
                      InformationCards(index: selectedProjectIndex)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
