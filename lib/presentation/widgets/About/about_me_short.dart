import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_animations/flutter_easy_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/presentation/providers/show_more_inf_provider.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_large.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_photo.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_short.dart';

import 'package:my_portfolio/presentation/widgets/General/social_media_buttons.dart';

class AboutMeShort extends StatelessWidget {
  const AboutMeShort({
    super.key,
    required AnimationController controller,
    required this.information,
  }) : _controller = controller;

  final AnimationController _controller;
  final Information information;

  @override
  Widget build(BuildContext context) {
    return FlipInX(
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
              children: [
                TextSpan(
                  text:
                      "A Cross-Platform Developer\nworking with Flutter to make\nyour ideas come real!",
                  style: GoogleFonts.josefinSans(
                    color: const Color.fromRGBO(0, 188, 212, 1), // Cyan
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    height: 1.2, // Adjust the line spacing here
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InformationSwitcher(
            controller: _controller,
            text: 'I want to know more about you',
          ),
          const SizedBox(
            height: 15,
          ),
          SocialMediaButtons(
              riverpodProvider: information,
              alignment: MainAxisAlignment.start),
        ],
      ),
    );
  }
}
