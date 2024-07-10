import 'package:url_launcher/url_launcher.dart';

class MediaProvider {
  final List<Uri> socialMediaLinks = [
    Uri.parse("https://www.linkedin.com/in/christopher-paz-leon-745760202/"),
    Uri.parse("https://github.com/paz1Ws"),
    Uri.parse("https://www.facebook.com/paz.1.dev"),
    Uri.parse("mailto: rewardmnx@gmail.com")
  ];
  final List<Uri> projectsLinks = [
    Uri.parse("https://github.com/Paz1Ws/JobMatch"),
    Uri.parse("https://github.com/Paz1Ws/billboard")
  ];
  void launchURL(int i) async {
    Uri url = MediaProvider().socialMediaLinks[i];

    launchUrl(url);
  }

  void download_CV() async {
    await launchUrl(Uri.parse(
        "https://drive.google.com/file/d/1e58wtBIwHplIe3lXgajiDLqMF3OjsTZD/view?usp=sharing"));
  }
}
