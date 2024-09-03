import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/providers/certifications_prov.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications_card.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_subtitles.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_titles.dart';

class CertificationsView extends ConsumerStatefulWidget {
  const CertificationsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CertificationsViewState();
}

class _CertificationsViewState extends ConsumerState<CertificationsView> {
  @override
  Widget build(BuildContext context) {
    final certificationImages = certificationImagesProvider;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width * .8),
            child: Column(
              children: [
                GradientForTitles(
                  title: "Achievements & Certifications",
                ),
                const SizedBox(height: 10),
                GradientForSubtitles(
                  title: "Udemy | DevTalles | Hackaton Awards",
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .08),
          FlutterCarousel(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: 0.5,
              aspectRatio: 1,
              autoPlayInterval: const Duration(milliseconds: 2500),
              autoPlay: true,
              autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              enlargeCenterPage: true,
              height: size.height * .5,
              showIndicator: false,
            ),
            items: certificationImages.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                      onTap: () {
                        _showImageDialog(context, imagePath);
                      },
                      child: CertificationCard(image: imagePath));
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

void _showImageDialog(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dialog(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8,
                  maxHeight: MediaQuery.of(context).size.height * .8),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Close",
              style: GoogleFonts.josefinSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
