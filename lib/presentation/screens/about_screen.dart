import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';
import 'package:my_portfolio/presentation/widgets/General/social_media_buttons.dart';

class AboutScreen extends ConsumerWidget {
  final riverpodProvider = MediaProvider();

  AboutScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            top: 0,
            left: -50,
            child: Image.asset("assets/images/design/blob_small_bean_ash.png",
                color: const Color.fromARGB(36, 36, 36, 35).withOpacity(0.2),
                height: MediaQuery.of(context).size.height * 1.2),
          ),
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
                              fontSize: 40,
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
                            text: TextSpan(
                              text: "A Cross-Platform Developer",
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFF00BCD4), // Cyan
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "           working with Flutter to make",
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFF00BCD4), // Cyan
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text:
                                  "                              your ideas come real!",
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFF00BCD4), // Cyan
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SocialMediaButtons(
                              riverpodProvider: riverpodProvider,
                              alignment: MainAxisAlignment.start),
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
  }
}
