import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications.dart';

class CertificationsScreen extends StatefulWidget {
  const CertificationsScreen({super.key});

  @override
  State<CertificationsScreen> createState() => _CertificationsScreenState();
}

class _CertificationsScreenState extends State<CertificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height - 100,
            child: const CertificationsView(),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height - 500,
            left: -100,
            child: Image.asset(
              "assets/images/design/dots_globe_grey.png",
              color: const Color(0xFF00BCD4),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 2,
            right: -100,
            child: Image.asset(
              "assets/images/design/blob_black.png",
              height: MediaQuery.sizeOf(context).height / 3,
            ),
          ),
        ]),
      ),
    );
  }
}
