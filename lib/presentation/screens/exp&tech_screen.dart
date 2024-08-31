import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skills.dart';

class ExpAndTech extends ConsumerWidget {
  const ExpAndTech({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Skills(),
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
