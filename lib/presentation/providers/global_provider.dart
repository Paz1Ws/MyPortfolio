import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/widgets/ForProyects/information.dart';
import 'package:url_launcher/url_launcher.dart';

class RiverpodProvider {
  final List<Uri> socialMediaLinks = [
    Uri.parse("https://www.linkedin.com/in/christopher-paz-leon-745760202/"),
    Uri.parse("https://github.com/paz1Ws"),
    Uri.parse("https://www.facebook.com/paz.1.dev"),
    Uri.parse("mailto: rewardmnx@gmail.com")
  ];
  final List<Uri> projectsLinks = [
    Uri.parse("https://github.com/Paz1Ws/billboard")
  ];
  void launchURL(int i) async {
    Uri url = RiverpodProvider().socialMediaLinks[i];

    launchUrl(url);
  }

  void download_CV() async {
    await launchUrl(Uri.parse(
        "https://drive.google.com/file/d/1e58wtBIwHplIe3lXgajiDLqMF3OjsTZD/view?usp=drive_link"));
  }
}

class NavigationByPages {
  final aboutSection = GlobalKey();
  final projectsSection = GlobalKey();
  final contactSection = GlobalKey();
  final certificationsSection = GlobalKey();
  final experienceSection = GlobalKey();
  void scrollGlobal(GlobalKey key) {
    if (key.currentContext == null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

final innerCurrentPageProvider = StateProvider<int>((ref) => 0);
final List<String> certificationImagesProvider = [
  "assets/images/.NetCertification.jpg",
  "assets/images/FlutterCertificate.jpg",
];
