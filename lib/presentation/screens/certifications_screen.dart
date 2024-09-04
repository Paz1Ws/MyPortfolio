import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CertificationsScreen extends StatefulWidget {
  const CertificationsScreen({super.key});

  @override
  State<CertificationsScreen> createState() => _CertificationsScreenState();
}

class _CertificationsScreenState extends State<CertificationsScreen> {
  late final SvgPicture image;

  @override
  void initState() {
    super.initState();
    image = SvgPicture.asset(
      "assets/images/design/certifications_background.svg",
      fit: BoxFit.cover,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Opacity(
            opacity: 0.5,
            child: SizedBox.expand(
              child: image,
            ),
          ),
          Center(
            child: const CertificationsView(),
          ),
        ]),
      ),
    );
  }
}
