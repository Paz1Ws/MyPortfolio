import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications_slider.dart';

class CertificationsView extends ConsumerStatefulWidget {
  const CertificationsView({super.key});

  @override
  ConsumerState<CertificationsView> createState() => _CertificationsViewState();
}

class _CertificationsViewState extends ConsumerState<CertificationsView> {
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
