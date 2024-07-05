import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';
import 'package:my_portfolio/config/providers/navigations_key_prov.dart';
import 'package:my_portfolio/presentation/widgets/ForExperience&Techs/certifications.dart';

class CertificationsScreen extends StatefulWidget {
  const CertificationsScreen({super.key});

  @override
  State<CertificationsScreen> createState() => _CertificationsScreenState();
}

class _CertificationsScreenState extends State<CertificationsScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    late AnimationController controller;

    @override
    void initState() {
      super.initState();
      controller = AnimationController(
        duration: const Duration(seconds: 20),
        vsync: this,
      )..repeat();

      controller.forward();
      controller.addListener(() {
        if (controller.status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        }
      });
    }

    return Scaffold(
      key: NavigationByPages().certificationsSection,
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
