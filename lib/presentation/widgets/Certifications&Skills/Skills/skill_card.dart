import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

class CardProfile extends StatelessWidget {
  final String type, widget, title;
  final Uri url;

  const CardProfile({
    super.key,
    required this.type,
    required this.widget,
    required this.title,
    required this.url,
  });

  Future<void> launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      log('Could not launch $url');
    }
  }

  Widget buildImage(BuildContext context) {
    return Image.network(
      'https://ghmd.dileepabandara.dev/widgets/$type/dark/$widget.png',
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.network(url.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Card(
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              mouseCursor: SystemMouseCursors.click,
              hoverColor: Theme.of(context).hoverColor,
              onTap: () => launchURL(url),
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .2,
                  height: MediaQuery.sizeOf(context).width * .2,
                  child: buildImage(context)),
            ),
          )
        : Card(
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              mouseCursor: SystemMouseCursors.click,
              hoverColor: Theme.of(context).hoverColor,
              onTap: () => launchURL(url),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * .05,
                    height: MediaQuery.sizeOf(context).width * .05,
                    child: buildImage(context)),
              ),
            ),
          );
  }
}
