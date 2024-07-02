import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/providers/global_provider.dart';
import 'package:my_portfolio/presentation/widgets/ForExperience&Techs/certifications_card.dart';
import 'package:my_portfolio/presentation/widgets/ForExperience&Techs/certifications_carousel_indicator.dart';

class CertificationsView extends ConsumerStatefulWidget {
  const CertificationsView({super.key});

  @override
  ConsumerState<CertificationsView> createState() => _CertificationsViewState();
}

class _CertificationsViewState extends ConsumerState<CertificationsView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, // Añade esta línea
          children: [
            _innerBannerSlider(height, width),
          ],
        ),
      ),
    );
  }

  Widget _innerBannerSlider(double height, double width) {
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
        const SizedBox(height: 40),
        SizedBox(
          height: height * .5,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) => ref
                        .read(innerCurrentPageProvider.notifier)
                        .state = index,
                  ),
                  items: certificationImages
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
}
