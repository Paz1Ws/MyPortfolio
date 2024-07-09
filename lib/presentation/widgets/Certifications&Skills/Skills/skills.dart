import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skill_card.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skill_list.dart';

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
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color.fromARGB(255, 120, 24, 136),
              Color.fromARGB(255, 170, 45, 192),
            ],
          ).createShader(bounds),
          child: Text(
            "I have experience with the following technologies",
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const TechsList(),
      ],
    );
  }
}
