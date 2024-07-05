import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';
import 'package:my_portfolio/config/providers/information_projects_prov.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationCards extends ConsumerWidget {
  final int index;
  const InformationCards({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsLinks = MediaProvider().projectsLinks;
    final informationList = ref.watch(informationListProvider);
    final iconsList = ref.watch(iconsListProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Center(
            child: ShaderMask(
              shaderCallback: (bounds) {
                final isDarkTheme =
                    Theme.of(context).brightness == Brightness.dark;
                final colors = isDarkTheme
                    ? [
                        Colors.grey[200]!,
                        Colors.grey[100]!,
                        const Color.fromARGB(255, 255, 255, 255)
                      ]
                    : [
                        const Color.fromARGB(255, 201, 238, 255),
                        const Color.fromARGB(255, 136, 217, 255),
                        const Color.fromARGB(255, 136, 217, 255)
                      ];
                return LinearGradient(colors: colors).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        informationList[index],
                        style: GoogleFonts.ubuntuCondensed(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(colors: [
                        const Color.fromARGB(255, 255, 255, 255),
                        Colors.lightBlueAccent[200]!,
                        Colors.lightBlueAccent[400]!,
                      ]).createShader(bounds),
                      child: Text(
                        "Made with",
                        style: GoogleFonts.josefinSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < iconsList[index].length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: iconsList[index][i],
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => launchUrl(projectsLinks[index]),
                            icon: const Icon(FontAwesomeIcons.github),
                            iconSize: 45,
                            color: Colors.black,
                          ),
                          TextButton(
                            child: const Text("See more over here!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            onPressed: () => launchUrl(projectsLinks[index]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
