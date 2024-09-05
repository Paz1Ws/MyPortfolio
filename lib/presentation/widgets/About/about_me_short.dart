import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easy_animations/flutter_easy_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_large.dart';

import 'package:my_portfolio/presentation/widgets/Contact/social_media_buttons.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_titles.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    return ResponsiveBreakpoints.of(context).isMobile
        ? MobileView(controller: _controller, information: information)
        : DesktopView(controller: _controller, information: information);
  }
}

class MobileView extends StatelessWidget {
  const MobileView({
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello, I'm", style: AppFonts.ubuntuMono),
          const SizedBox(
            height: 5,
          ),
          GradientForTitles(
            title: "Christopher Paz",
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "A Cross-Platform Developer\nworking with Flutter to make\nyour ideas come real!",
            textAlign: TextAlign.center,
            style: AppFonts.josefinSans24,
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
          Column(
            children: [
              SocialMediaButtons(
                  linksProvider: information,
                  alignment: MainAxisAlignment.start),
              Padding(
                padding: EdgeInsets.only(
                    right:
                        ResponsiveBreakpoints.of(context).isMobile ? 120 : 220),
                child: FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("flutterize1@gmail.com",
                          style: AppFonts.josefinSans14.copyWith(
                            color: AppColors.brightness(context),
                          )),
                      Image.asset(
                        'assets/images/design/arrow.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                        color: AppColors.softPurple,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({
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
          Text("Hello, I'm", style: AppFonts.ubuntuMono),
          const SizedBox(
            height: 5,
          ),
          GradientForTitles(
            title: "Christopher Paz",
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
                  style: AppFonts.josefinSans24,
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
          Column(
            children: [
              SocialMediaButtons(
                  linksProvider: information,
                  alignment: MainAxisAlignment.start),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("flutterize1@gmail.com",
                        style: AppFonts.josefinSans14.copyWith(
                          color: AppColors.brightness(context),
                        )),
                    Image.asset(
                      'assets/images/design/arrow.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                      color: AppColors.softPurple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
