import 'package:url_launcher/url_launcher.dart';

class Information {
  // TEXT
  final String aboutMeText =
      "I am a Flutter Developer with a passion for creating \nbeautiful and functional user experiences with experience in \ndeveloping mobile using Flutter and Dart. \nI am a self-taught developer and owner of the Youtube Channel: \nHardworking and dedicated individual who is always willing to go \nthe extra mile to achieve my goals.\n\nSocial Skills:\n- Excellent communication and interpersonal skills\n- Strong problem-solving abilities\n- Team player with the ability to collaborate effectively\n- Adaptability and flexibility in a fast-paced environment\n- Attention to detail and strong organizational skills\n- Ability to work independently and meet deadlines\n\nI am confident that my skills and experience make me a valuable asset to any team. \nFeel free to reach out to me through any of the social media links \nor download my CV for more information.";
  // LINKS
  final List<Uri> socialMediaLinks = [
    Uri.parse("https://www.linkedin.com/in/christopher-paz-leon-745760202/"),
    Uri.parse("https://github.com/paz1Ws"),
    Uri.parse("https://www.youtube.com/@Flutterize1"),
    Uri.parse("mailto: rewardmnx@gmail.com")
  ];
  final List<Uri> projectsLinks = [
    Uri.parse("https://github.com/Paz1Ws/JobMatch"),
    Uri.parse("https://github.com/Paz1Ws/billboard"),
    Uri.parse("https://github.com/Paz1Ws/PartialFitnessApp"),
  ];
  void launchURL(int i) async {
    Uri url = Information().socialMediaLinks[i];

    launchUrl(url);
  }

  void download_CV() async {
    await launchUrl(Uri.parse(
        "https://drive.google.com/file/d/1HZM2fyVZ3EjEg2c5Zrkw0MNkn0NUiy3j/view?usp=sharing"));
  }
}
