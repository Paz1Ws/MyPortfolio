import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

class CardProfile extends StatelessWidget {
  final String type, widget, title;
  final Uri url;

  const CardProfile(
      {super.key,
      required this.type,
      required this.widget,
      required this.title,
      required this.url});

  Future<void> launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      log('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 300.0,
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
                Image.network(
                  'https://ghmd.dileepabandara.dev/widgets/$type/dark/$widget.png',
                  width: 50.0,
                  height: 50.0,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.network(
                      Uri.parse(url.toString()).toString(),
                      width: 50.0,
                      height: 50.0,
                    );
                  },
                ),
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
