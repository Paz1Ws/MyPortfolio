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
    Key? key,
    required this.type,
    required this.widget,
    required this.title,
    required this.url,
  }) : super(key: key);

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
      width: ResponsiveBreakpoints.of(context).isMobile ? 80.0 : 60.0,
      height: ResponsiveBreakpoints.of(context).isMobile ? 80.0 : 60.0,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.network(
          Uri.parse(url.toString()).toString(),
          width: ResponsiveBreakpoints.of(context).isMobile ? 80.0 : 60.0,
          height: ResponsiveBreakpoints.of(context).isMobile ? 80.0 : 60.0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 120.0,
              minWidth: 80,
              maxHeight: 120,
              minHeight: 80,
            ),
            child: Card(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                mouseCursor: SystemMouseCursors.click,
                hoverColor: Theme.of(context).hoverColor,
                onTap: () => launchURL(url),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buildImage(context),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        textScaler: TextScaler.linear(1),
                        style: AppFonts.josefinSans14.copyWith(
                          color: AppColors.brightness(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400.0,
            ),
            child: Card(
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildImage(context),
                      const SizedBox(width: 10.0),
                      Text(
                        title,
                        style: AppFonts.josefinSans24.copyWith(
                            color: AppColors.brightness(context), fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
