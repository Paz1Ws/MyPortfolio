import 'package:url_launcher/url_launcher.dart';

class MediaProvider {
  final List<Uri> socialMediaLinks = [
    Uri.parse("https://www.linkedin.com/in/christopher-paz-leon-745760202/"),
    Uri.parse("https://github.com/paz1Ws"),
    Uri.parse("https://www.youtube.com/@Flutterize1"),
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
        "https://drive.google.com/file/d/1HZM2fyVZ3EjEg2c5Zrkw0MNkn0NUiy3j/view?usp=sharing"));
  }
}
