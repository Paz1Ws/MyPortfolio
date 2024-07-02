import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/providers/global_provider.dart';
import 'package:my_portfolio/presentation/widgets/ForExperience&Techs/certifications_card.dart';

class CertificationsView extends StatefulWidget {
  const CertificationsView({super.key});

  @override
  State<CertificationsView> createState() => _CertificationsViewState();
}

class _CertificationsViewState extends State<CertificationsView>
    with SingleTickerProviderStateMixin {
  late CarouselController innerCarouselController;
  int innerCurrentPage = 0;

  @override
  void initState() {
    innerCarouselController = CarouselController();
    super.initState();
  }

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

  /// Bottom Navigation bar
  Widget _innerBannerSlider(double height, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Añade esta línea
      children: [
        /// Slider Style
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
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        SizedBox(
          height: height * .5,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: CarouselSlider(
                  carouselController: innerCarouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        innerCurrentPage = index;
                      });
                    },
                  ),
                  items: RiverpodProvider().innerStyleImages.map((imagePath) {
                    return Builder(builder: (BuildContext context) {
                      return CertificationCard(image: imagePath);
                    });
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
