import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';
import 'package:my_portfolio/config/providers/information_projects_prov.dart';
import 'package:my_portfolio/presentation/widgets/Projects/information_project_card.dart';
import 'package:my_portfolio/presentation/widgets/Projects/projects_swiper.dart';

class ProyectsScreen extends ConsumerWidget {
  final riverpodProvider = MediaProvider();

  ProyectsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectIndex = ref.watch(selectedProjectIndexProvider);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.1,
            right: -80,
            child: Image.asset("assets/images/design/blob_femur_ash.png",
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.1)
                    : const Color.fromARGB(36, 36, 36, 35),
                height: MediaQuery.of(context).size.height * 0.4),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFF00BCD4),
                          Color.fromRGBO(156, 39, 176, 1),
                          Colors.deepPurpleAccent
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
                  ),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: ShaderMask(
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
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.25,
              left: MediaQuery.sizeOf(context).width * 0.1,
            ),
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3,
                child: const ProjectsSwiper()),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.35,
                right: MediaQuery.sizeOf(context).width * 0.1),
            child: Align(
                alignment: Alignment.centerRight,
                child: Flexible(
                  fit: FlexFit.loose,
                  child: InformationCards(index: selectedProjectIndex),
                )),
          )
        ],
      ),
    );
  }
}
