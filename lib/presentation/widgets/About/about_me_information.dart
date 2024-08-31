import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/presentation/providers/show_more_inf_provider.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_large.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_photo.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_short.dart';


class AboutMeInformation extends ConsumerWidget {
  const AboutMeInformation({
    super.key,
    required this.size,
    required AnimationController controller,
    required this.information,
  }) : _controller = controller;

  final Size size;
  final AnimationController _controller;
  final Information information;

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.1, bottom: size.height * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: ref.watch(showMoreInformationProv)
                      ? AboutMeLarge(size: size, controller: _controller)
                      : AboutMeShort(
                          controller: _controller, information: information)),
            ],
          ),
          AboutMePhoto(size: size),
        ],
      ),
    );
  }
}
