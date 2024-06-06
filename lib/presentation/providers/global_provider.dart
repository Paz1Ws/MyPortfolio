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
  void scrollGlobal(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}

final selectedProjectIndexProvider = StateProvider((ref) => 0);
final projectImagesProvider = StateProvider((ref) => const [
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
    ]);

final informationListProvider = StateProvider((ref) => [
      OnlyInformation().billboard,
      OnlyInformation().Proyect2,
      OnlyInformation().Proyect3,
      OnlyInformation().Proyect4,
      OnlyInformation().Proyect5,
    ]);
final iconsListProvider = StateProvider((ref) => [
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
    ]);
