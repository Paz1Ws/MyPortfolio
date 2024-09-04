import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
    required this.linksProvider,
    required this.alignment,
  });

  final Information linksProvider;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : alignment == MainAxisAlignment.center
            ? Colors.white
            : Colors.black;

    return FittedBox(
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          IconButton(
            onPressed: () {
              linksProvider.launchURL(0);
            },
            color: color,
            icon: const Icon(FontAwesomeIcons.linkedinIn),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              linksProvider.launchURL(1);
            },
            icon: const Icon(FontAwesomeIcons.github),
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              linksProvider.launchURL(2);
            },
            icon: const Icon(FontAwesomeIcons.youtube),
            color: color,
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              linksProvider.launchURL(3);
            },
            icon: const Icon(FontAwesomeIcons.envelope),
            color: color,
          ),
          const SizedBox(width: 25),
          alignment == MainAxisAlignment.center
              ? const SizedBox()
              : ElevatedButton(
                  onPressed: () async {
                    linksProvider.download_CV();
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
                    minimumSize: ResponsiveBreakpoints.of(context).isDesktop
                        ? const Size(200, 50)
                        : const Size(30, 50),
                  ),
                  child: Text('Download CV',
                      style: AppFonts.josefinSans14.copyWith(
                        color: AppColors.brightness(context),
                        fontSize: ResponsiveBreakpoints.of(context).isDesktop
                            ? 20
                            : 16,
                      )),
                )
        ],
      ),
    );
  }
}
