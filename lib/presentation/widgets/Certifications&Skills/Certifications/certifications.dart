import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/providers/certifications_prov.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications_card.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications_carousel_indicator.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications_slider.dart';

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
            CertificationsSlider(height, width, ref),
          ],
        ),
      ),
    );
  }
}
