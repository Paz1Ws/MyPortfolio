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
  final double height;
  const AboutScreen({super.key, required this.height});

  @override
  ConsumerState<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<AboutScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Image image1 = _buildImage(widget.height * 1.8);

  late final Image image2 = _buildImage(widget.height * 3);
  late final Image image3 = _buildImage(widget.height * 1.8);
  late final Image image4 = _buildImage(widget.height * 1.2);
  Image _buildImage(double height) {
    return Image.asset(
      "assets/images/design/blob_small_bean_ash.png",
      color: AppColors.lightBlack.withOpacity(0.2),
      height: height,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  void _precacheImages() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final showMoreInfo = ref.watch(showMoreInformationProv);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: isMobile ? null : 0,
            left: isMobile ? null : (showMoreInfo ? -110 : -50),
            child: showMoreInfo
                ? SlideInLeft(
                    duration: const Duration(seconds: 2),
                    child: isMobile ? image1 : image3,
                  )
                : SlideInRight(
                    duration: const Duration(seconds: 2),
                    child: isMobile ? image2 : image4,
                  ),
          ),
          if (!isMobile)
            const Positioned(
              top: 50,
              right: 80,
              child: AvailableToWork(),
            ),
          AboutMeInformation(
            controller: _controller,
            information: Information(),
          ),
        ],
      ),
    );
  }
}
