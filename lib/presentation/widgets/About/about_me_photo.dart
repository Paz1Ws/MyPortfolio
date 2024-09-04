import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/providers/show_more_inf_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMePhoto extends ConsumerWidget {
  const AboutMePhoto({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      children: [
        ResponsiveBreakpoints.of(context).isMobile
            ? Container()
            : Center(
                child: Lottie.asset(
                  'assets/animations/BackgroundPhoto.json',
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  width: size.width * 0.8,
                  height: size.height * 0.8,
                ),
              ),
        Center(
          child: ZoomIn(
            child: CircleAvatar(
                radius: ResponsiveBreakpoints.of(context).isMobile
                    ? size.aspectRatio * 130
                    : size.aspectRatio * 65,
                backgroundImage: AssetImage(ref.watch(showMoreInformationProv)
                    ? "assets/images/BlackFlutterize.png"
                    : "assets/images/Me.jpg")),
          ),
        ),
      ],
    );
  }
}
