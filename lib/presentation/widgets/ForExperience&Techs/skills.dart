import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/widgets/ForExperience&Techs/tech_card.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFF00BCD4),
              Color.fromRGBO(156, 39, 176, 1),
              Colors.deepPurpleAccent
            ],
          ).createShader(bounds),
          child: Text(
            "My Skills: ",
            style: GoogleFonts.ubuntuMono(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'I have experience with the following technologies:',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        const TechsList(),
      ],
    );
  }
}

class TechsList extends StatelessWidget {
  const TechsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Add this line
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Add this line
          children: [
            RichText(
              text: TextSpan(
                text: 'Frontend & Mobile: ',
                style: GoogleFonts.ubuntuMono(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            CardProfile(
                type: 'frontend',
                widget: 'flutter',
                title: 'Flutter',
                url: Uri.parse('https://flutter.dev/')),
            const SizedBox(width: 20),
            CardProfile(
                type: 'frontend',
                widget: 'dart',
                title: 'Dart',
                url: Uri.parse('https://dart.dev/')),
            const SizedBox(width: 20),
            CardProfile(
                type: 'frontend',
                widget: 'html',
                title: 'HTML',
                url: Uri.parse('https://html.spec.whatwg.org/')),
            const SizedBox(width: 20),
            CardProfile(
                type: 'frontend',
                widget: 'css',
                title: 'CSS',
                url:
                    Uri.parse('https://www.w3.org/Style/CSS/Overview.en.html')),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Add this line
          children: [
            RichText(
              text: TextSpan(
                text: 'Backend & Databases: ',
                style: GoogleFonts.ubuntuMono(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CardProfile(
                type: 'backend',
                widget: 'firebase',
                title: 'Firebase',
                url: Uri.parse('https://firebase.google.com/')),
            const SizedBox(width: 20),
            CardProfile(
                type: 'frontend',
                widget: 'c-sharp',
                title: 'C#',
                url: Uri.parse(
                    'https://docs.microsoft.com/en-us/dotnet/csharp/')),
            const SizedBox(width: 20),
            CardProfile(
                type: 'frontend',
                widget: 'microsoft-dotnet',
                title: '.NET',
                url: Uri.parse('https://dotnet.microsoft.com/')),
            const SizedBox(width: 20),
            CardProfile(
              type: 'backend',
              widget: 'SQL',
              title: 'SQL',
              url: Uri.parse(
                  'https://cdn-icons-png.flaticon.com/512/5968/5968364.png'),
            ),
            const SizedBox(width: 20),
            CardProfile(
              type: 'backend',
              widget: 'MySQL',
              title: 'MySQL',
              url: Uri.parse(
                  'https://cdn-icons-png.freepik.com/512/5968/5968363.png'),
            ),
            const SizedBox(width: 20),
            CardProfile(
                type: 'backend',
                widget: 'swagger',
                title: 'Swagger',
                url: Uri.parse('https://swagger.io/')),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Add this line
          children: [
            RichText(
              text: TextSpan(
                text: 'Tools for the daily life: ',
                style: GoogleFonts.ubuntuMono(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            CardProfile(
                type: 'devops',
                widget: 'git',
                title: 'Git',
                url: Uri.parse('https://git-scm.com/')),
            const SizedBox(width: 20),
            CardProfile(
              type: 'devops',
              widget: 'github',
              title: 'GitHub',
              url: Uri.parse('https://github.com/Paz1Ws'),
            ),
            const SizedBox(width: 20),
            CardProfile(
                type: 'code',
                widget: 'visual-studio',
                title: 'Visual Studio',
                url: Uri.parse('https://visualstudio.microsoft.com/')),
            const SizedBox(width: 20),
            CardProfile(
                type: 'code',
                widget: 'visual-studio-code',
                title: 'Visual Studio Code',
                url: Uri.parse('https://code.visualstudio.com/')),
          ],
        ),
        const SizedBox(height: 20),
        RichText(
            text: TextSpan(
          text: 'Always learning. More coming!...',
          style:
              GoogleFonts.tangerine(fontSize: 50, fontWeight: FontWeight.bold),
        ))
      ],
    );
  }
}
