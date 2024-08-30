import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/providers/show_more_inf_provider.dart';

class AboutMePhoto extends ConsumerWidget {
  const AboutMePhoto({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/BackgroundPhoto.json',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            width: size.width * 0.45,
            height: size.height * 0.45,
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.translationValues(0, -size.height * 0.19, 0),
            child: ref.watch(showMoreInformationProv)
                ? ZoomIn(
                    child: CircleAvatar(
                        radius: (size.width * 0.12 + size.height * 0.12) / 2,
                        backgroundImage: const AssetImage(
                            "assets/images/BlackFlutterize.png")),
                  )
                : ZoomIn(
                    child: CircleAvatar(
                      radius: (size.width * 0.12 + size.height * 0.12) / 2,
                      backgroundImage: const AssetImage("assets/images/Me.jpg"),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
