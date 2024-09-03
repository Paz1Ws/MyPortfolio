import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Certifications/certifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          Center(
            child: Expanded(
              child: const CertificationsView(),
            ),
          ),
        ]),
      ),
    );
  }
}
