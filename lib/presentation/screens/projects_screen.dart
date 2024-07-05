import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';
import 'package:my_portfolio/config/providers/information_projects_prov.dart';
import 'package:my_portfolio/config/providers/navigations_key_prov.dart';
import 'package:my_portfolio/presentation/widgets/ForProyects/information_project_card.dart';
import 'package:my_portfolio/presentation/widgets/ForProyects/projects_swiper.dart';

class ProyectsScreen extends ConsumerWidget {
  final riverpodProvider = MediaProvider();

  ProyectsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectIndex = ref.watch(selectedProjectIndexProvider);

    return Scaffold(
      key: NavigationByPages().projectsSection,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(7),
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
                        "My projects are a testament to my passion for innovation",
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
            padding: const EdgeInsets.only(left: 100, top: 150),
            child: Flexible(
              fit: FlexFit.loose,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).height * 1.2,
                    child: const ProjectsSwiper()),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.32),
            child: Align(
                alignment: Alignment.centerRight,
                child: Flexible(
                  fit: FlexFit.tight,
                  child: InformationCards(index: selectedProjectIndex),
                )),
          )
        ],
      ),
    );
  }
}
