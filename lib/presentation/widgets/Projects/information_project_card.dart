import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/presentation/providers/information_projects_prov.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationCards extends ConsumerWidget {
  final int index;
  const InformationCards({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsLinks = Information().projectsLinks;
    final informationList = ref.watch(informationListProvider);
    final iconsList = ref.watch(iconsListProvider);

    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(36, 36, 36, 35),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      informationList[index],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntuCondensed(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Made with",
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent[400]!,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final iconPath in iconsList[index])
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          child: Image.asset(
                            iconPath,
                            fit: BoxFit.cover,
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => launchUrl(projectsLinks[index]),
                        icon: const Icon(FontAwesomeIcons.github),
                        iconSize: 45,
                        color: Colors.black,
                      ),
                      TextButton(
                        child: Text("See more over here!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            )),
                        onPressed: () => launchUrl(projectsLinks[index]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
