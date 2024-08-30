import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_animations/flutter_easy_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/presentation/providers/show_more_inf_provider.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_large.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_photo.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_short.dart';

import 'package:my_portfolio/presentation/widgets/General/social_media_buttons.dart';

class AboutMeLarge extends StatelessWidget {
  const AboutMeLarge({
    super.key,
    required this.size,
    required AnimationController controller,
  }) : _controller = controller;

  final Size size;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return FlipInY(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.4,
            minHeight: size.height * 0.4,
          ),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text:
                      'I am a Flutter Developer with a passion for creating \n',
                ),
                TextSpan(
                    text: 'beautiful and functional user experiences',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 188, 212, 1), //
                    )),
                TextSpan(
                  text:
                      ' with experience in \ndeveloping mobile using Flutter and Dart. \nI am a self-taught developer and owner of the ',
                ),
                TextSpan(
                  text: 'Youtube Channel: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF00BCD4), // ),
                  ),
                ),
                TextSpan(
                  text: 'Flutterize',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.purple, // Adjust the height of the gradient here
                  ),
                ),
                TextSpan(
                  text:
                      '\nHardworking and dedicated individual who is always willing to go \nthe extra mile to achieve my goals.\n\n',
                ),
                TextSpan(
                  text: 'Social Skills:\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                TextSpan(
                  text: '- Excellent communication and interpersonal skills\n',
                ),
                TextSpan(
                  text: '- Strong problem-solving abilities\n',
                ),
                TextSpan(
                  text:
                      '- Team player with the ability to collaborate effectively\n',
                ),
                TextSpan(
                  text:
                      '- Adaptability and flexibility in a fast-paced environment\n',
                ),
                TextSpan(
                  text:
                      '- Attention to detail and strong organizational skills\n',
                ),
                TextSpan(
                  text:
                      '- Ability to work independently and meet deadlines\n\n',
                ),
                TextSpan(
                  text:
                      'I am confident that my skills and experience make me a valuable asset to any team. \nFeel free to reach out to me through any of the social media links \nor download my CV for more information.',
                ),
              ],
            ),
            textAlign: TextAlign.left,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InformationSwitcher(
          controller: _controller,
          text: 'Fine I know you',
        ),
      ],
    ));
  }
}

class InformationSwitcher extends ConsumerWidget {
  const InformationSwitcher(
      {super.key, required this.controller, required this.text});

  final String text;
  final controller;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.josefinSans(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white.withOpacity(0.7)
                : Colors.black.withOpacity(0.7),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {
            ref.read(showMoreInformationProv.notifier).state =
                !ref.read(showMoreInformationProv.notifier).state;
          },
          icon: AnimateStyles.heartBeat(
            controller,
            Icon(
              Icons.arrow_forward_ios,
              shadows: [
                Shadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white.withOpacity(0.8)
                        : Colors.black.withOpacity(0.4),
                    offset: const Offset(1, 1),
                    blurRadius: 3)
              ],
            ),
          ),
          color: const Color(0xFF00BCD4),
        )
      ],
    );
  }
}
