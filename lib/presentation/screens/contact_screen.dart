import 'package:flutter/material.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:my_portfolio/presentation/widgets/Contact/social_media_buttons.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final socialButtons = Information();
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
            child: Image.asset("assets/images/design/box_cover_gold.png",
                height: height * 0.5, color: AppColors.softPurple),
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
              Text("Let's work together", style: AppFonts.josefinSans32),
              const SizedBox(height: 26),
              Text(
                "Have a project in mind? \nLet's discuss and work together",
                textAlign: TextAlign.center,
                style: AppFonts.josefinSans24,
              ),
              const SizedBox(
                height: 30,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SocialMediaButtons(
                        linksProvider: socialButtons,
                        alignment: MainAxisAlignment.center),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SelectableText("flutterize1@gmail.com",
                              style: AppFonts.josefinSans14.copyWith(
                                color: Colors.white,
                              )),
                          Image.asset(
                            'assets/images/design/arrow.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
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
