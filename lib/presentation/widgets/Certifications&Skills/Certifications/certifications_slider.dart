import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/providers/certifications_prov.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications_card.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications_carousel_indicator.dart';

Widget CertificationsSlider(double height, double width, WidgetRef ref) {
  final CarouselController controller = CarouselController();

  final certificationImages = certificationImagesProvider;
  final innerCurrentPage = ref.watch(innerCurrentPageProvider);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFF00BCD4),
              Color.fromRGBO(156, 39, 176, 1),
              Colors.deepPurpleAccent
            ],
          ).createShader(bounds),
          child: Text(
            "Achievements & Certifications",
            style: GoogleFonts.ubuntuMono(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color.fromARGB(255, 120, 24, 136),
            Color.fromARGB(255, 170, 45, 192),
          ],
        ).createShader(bounds),
        child: Text(
          "Udemy | DevTalles | Hackaton Awards",
          textAlign: TextAlign.center,
          style: GoogleFonts.josefinSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 40),
      SizedBox(
        height: height * .5,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: CarouselView(
                itemExtent: 200,
                children: certificationImages
                    .map((imagePath) => CertificationCard(image: imagePath))
                    .toList(),
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 40),
      CertificationsCarouselIndicator(
        certificationImagesProvider: certificationImages,
        innerCurrentPage: innerCurrentPage,
        controller: controller,
      ),
    ],
  );
}
