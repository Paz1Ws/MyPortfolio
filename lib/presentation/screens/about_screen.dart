import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/presentation/providers/show_more_inf_provider.dart';
import 'package:my_portfolio/presentation/widgets/About/about_me_information.dart';
import 'package:my_portfolio/presentation/widgets/General/available_to_work_container.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({super.key});

  @override
  ConsumerState<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<AboutScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(
        'Mobile:${ResponsiveBreakpoints.of(context).isMobile}\nTablet:${ResponsiveBreakpoints.of(context).isTablet}\nDesktop${ResponsiveBreakpoints.of(context).isDesktop} ');
    return Scaffold(
        body: ResponsiveBreakpoints.of(context).isMobile
            ? Stack(
                children: [
                  Positioned(
                    child: ref.watch(showMoreInformationProv)
                        ? SlideInLeft(
                            duration: const Duration(seconds: 2),
                            child: Image.asset(
                                "assets/images/design/blob_small_bean_ash.png",
                                color: AppColors.lightBlack.withOpacity(0.2),
                                height: size.height * 1.8))
                        : SlideInRight(
                            duration: const Duration(seconds: 2),
                            child: Image.asset(
                              "assets/images/design/blob_small_bean_ash.png",
                              color: AppColors.lightBlack.withOpacity(0.2),
                              height: size.height * 3,
                            ),
                          ),
                  ),
                  AboutMeInformation(
                    size: size,
                    controller: _controller,
                    information: Information(),
                  ),
                ],
              )
            : Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: ref.watch(showMoreInformationProv) ? -110 : -50,
                    child: ref.watch(showMoreInformationProv)
                        ? SlideInLeft(
                            duration: const Duration(seconds: 2),
                            child: Image.asset(
                                "assets/images/design/blob_small_bean_ash.png",
                                color: AppColors.lightBlack.withOpacity(0.2),
                                height: size.height * 1.8))
                        : SlideInRight(
                            duration: const Duration(seconds: 2),
                            child: Image.asset(
                                "assets/images/design/blob_small_bean_ash.png",
                                color: AppColors.lightBlack.withOpacity(0.2),
                                height: size.height * 1.2),
                          ),
                  ),
                  const Positioned(
                      top: 50, right: 80, child: AvailableToWork()),
                  AboutMeInformation(
                    size: size,
                    controller: _controller,
                    information: Information(),
                  ),
                ],
              ));
  }
}
