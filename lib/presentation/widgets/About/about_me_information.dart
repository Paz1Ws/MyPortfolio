import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/presentation/providers/show_more_inf_provider.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_large.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_photo.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_short.dart';
import 'package:my_portfolio/presentation/widgets/General/available_to_work_container.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeInformation extends ConsumerWidget {
  const AboutMeInformation({
    super.key,
    required AnimationController controller,
    required this.information,
  }) : _controller = controller;

  final AnimationController _controller;
  final Information information;

  @override
  Widget build(BuildContext context, ref) {
    Size size = MediaQuery.sizeOf(context);
    return ResponsiveBreakpoints.of(context).isMobile
        ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05,
                vertical: MediaQuery.sizeOf(context).height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.22,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AboutMePhoto(size: size),
                      const AvailableToWork(),
                    ],
                  ),
                ),
                ref.watch(showMoreInformationProv)
                    ? AboutMeLarge(size: size, controller: _controller)
                    : AboutMeShort(
                        controller: _controller, information: information),
              ],
            ),
          )
        : Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.1, bottom: size.height * 0.1),
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
                                controller: _controller,
                                information: information),
                      ),
                    ],
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(flex: 2, child: AboutMePhoto(size: size)),
                ],
              ),
            ),
          );
  }
}
