import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skill_card.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skills_cards.dart';

class TechsListDesktop extends StatelessWidget {
  const TechsListDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Add this line
      children: [
        TechRow(title: 'Frontend & Mobile: ', techs: frontendMobile),
        const SizedBox(height: 20),
        TechRow(title: 'Backend & Databases: ', techs: backendDatabases),
        const SizedBox(height: 20),
        TechRow(title: 'Tools for the daily life: ', techs: dailyTools),
        const SizedBox(height: 20),
        RichText(
            text: TextSpan(
                text: 'Always learning. More coming!...',
                style: AppFonts.tangerine(context).copyWith(
                  fontSize: 50,
                )))
      ],
    );
  }
}

class TechRow extends StatelessWidget {
  final List<Widget> techs;
  final String title;
  const TechRow({
    required this.techs,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: AppFonts.ubuntu20(context)),
        const SizedBox(width: 20),
        ...techs.map((widget) => Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: widget,
              ),
            )),
      ],
    );
  }
}
