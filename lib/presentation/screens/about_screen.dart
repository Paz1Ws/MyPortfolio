import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/presentation/providers/global_provider.dart';

class AboutScreen extends ConsumerWidget {
  final riverpodProvider = RiverpodProvider();

  AboutScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1000) {
      return Scaffold(
        key: NavigationByPages().aboutSection,
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              right: 130.0,
              top: (MediaQuery.of(context).size.height / 2) - 330,
              child: SizedBox(
                  width: 580.0,
                  height: 580.0,
                  child: Lottie.asset(
                    'assets/animations/BackgroundPhoto.json',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )),
            ),
            Positioned(
              right: 290,
              top: (MediaQuery.of(context).size.height / 2) - 170,
              child: const CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage('assets/images/Me.jpg'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 220,
                    width: 200,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 150.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, I'm",
                              style: GoogleFonts.ubuntuMono(
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  Color(0xFF00BCD4),
                                  Color.fromRGBO(156, 39, 176, 1),
                                  Colors.deepPurpleAccent
                                ],
                              ).createShader(bounds),
                              child: Text(
                                "Christopher Paz",
                                style: GoogleFonts.ubuntuMono(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: const TextSpan(
                                text: "A Cross-Platform Developer",
                                style: TextStyle(
                                  color: Color(0xFF00BCD4), // Cyan
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                text: "           working with Flutter to make",
                                style: TextStyle(
                                  color: Color(0xFF00BCD4), // Cyan
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                text:
                                    "                              your ideas come real!",
                                style: TextStyle(
                                  color: Color(0xFF00BCD4), // Cyan
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    riverpodProvider.launchURL(0);
                                  },
                                  icon: const Icon(FontAwesomeIcons.linkedinIn),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    riverpodProvider.launchURL(1);
                                  },
                                  icon: const Icon(FontAwesomeIcons.github),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    riverpodProvider.launchURL(2);
                                  },
                                  icon: const Icon(FontAwesomeIcons.facebook),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    riverpodProvider.launchURL(3);
                                  },
                                  icon: const Icon(FontAwesomeIcons.envelope),
                                ),
                                const SizedBox(width: 25),
                                ElevatedButton(
                                  onPressed: () async {
                                    riverpodProvider.download_CV();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 0,
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    side: const BorderSide(
                                      color: Colors.purple,
                                      width: 2,
                                    ),
                                    minimumSize: const Size(200, 50),
                                  ),
                                  child: const Text('Download CV'),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return const Text("This screen is not available on desktop");
    }
  }
}
