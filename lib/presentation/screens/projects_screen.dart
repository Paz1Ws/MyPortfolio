import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/providers/global_provider.dart';
import 'package:my_portfolio/presentation/widgets/ForProyects/information_project_card.dart';
import 'package:my_portfolio/presentation/widgets/ForProyects/projects_swiper.dart';

class ProyectsScreen extends ConsumerWidget {
  final riverpodProvider = RiverpodProvider();

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
                    padding: const EdgeInsets.all(5.0),
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
                          Color.fromARGB(255, 193, 172, 172),
                          Color.fromARGB(255, 120, 24, 136),
                          Color.fromARGB(255, 193, 172, 172),
                        ],
                      ).createShader(bounds),
                      child: Text(
                        "From humble beginnings to coding masterpieces, my projects are a testament to my passion for innovation",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntuMono(
                          fontSize: 25,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.values[3],
                          decorationThickness: 5.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 90, right: 500, top: 190),
            child: Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
                width: 600,
                height: 1000,
                child: ProjectsSwiper(),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(left: 700, top: 200),
              child: Center(
                child: InformationCards(index: selectedProjectIndex),
              ),
            ),
          )
        ],
      ),
    );
  }
}
