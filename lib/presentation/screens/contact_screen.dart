import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';
import 'package:my_portfolio/presentation/widgets/General/social_media_buttons.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final socialButtons = MediaProvider();
    double height = MediaQuery.of(context).size.height * 0.3;
    return ContentArea(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -20,
            left: -35,
            child: Image.asset(
              "assets/images/design/box_cover_gold.png",
              height: height * 0.5,
              color: const Color.fromRGBO(156, 39, 176, 1),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -20,
            child: Image.asset(
              "assets/images/design/box_cover_dark.png",
              height: height * 0.8,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's work together",
                style: GoogleFonts.josefinSans(
                  color: const Color.fromARGB(255, 255, 255, 255), // Cyan
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 26),
              Text(
                "Have a project in mind? \nLet's discuss and work together",
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: const Color.fromARGB(255, 18, 209, 234), // Cyan
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SocialMediaButtons(
                  riverpodProvider: socialButtons,
                  alignment: MainAxisAlignment.center),
            ],
          ),
        ],
      ),
    );
  }
}

class ContentArea extends StatelessWidget {
  final BoxDecoration? decoration;
  final BorderRadius borderRadius;
  final Widget? child;

  const ContentArea({
    super.key,
    this.decoration,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(10),
    ),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: decoration ??
          BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                "assets/images/design/icon_box.jpg",
              ),
              fit: BoxFit.cover,
            ),
            color: Theme.of(context).hoverColor,
            borderRadius: borderRadius,
          ),
      child: child,
    );
  }
}
