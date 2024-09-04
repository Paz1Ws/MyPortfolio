import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/config/constants/media_projects_informations.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_subtitles.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_titles.dart';
import 'package:my_portfolio/presentation/widgets/Projects/information_project_card.dart';
import 'package:my_portfolio/presentation/widgets/Projects/projects_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsScreen extends ConsumerWidget {
  final riverpodProvider = Information();

  ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectIndex = ref.watch(selectedProjectIndexProvider);

    return Scaffold(
      body: ResponsiveBreakpoints.of(context).isMobile? 
      
      Stack(
        children: [
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.1,
            right: 0,
            child: Image.asset(
              "assets/images/design/blob_femur_ash.png",
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.1)
                  : AppColors.lightBlack,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              GradientForTitles(
                title: "All my Projects till the moment",
              ),
              
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              GradientForSubtitles(
                title: "Showcases of my passion for innovation",
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.2,
                      child: ProjectsSwiper(),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                    RichText(
                        text: TextSpan(
                            text: '<< Press me >>',
                            style: AppFonts.tangerine(context)))
                  ],
                ),
              ),
            ],
          ),
        ],
      ):
      
      Stack(
        children: [
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.1,
            right: -80,
            child: Image.asset(
              "assets/images/design/blob_femur_ash.png",
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.1)
                  : AppColors.lightBlack,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: SizedBox.expand(
              child: SvgPicture.asset(
                "assets/images/design/projects_background.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientForTitles(
                  title: "All my Projects till the moment",
                ),
                GradientForSubtitles(
                  title: "Showcases of my passion for innovation",
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ProjectsSwiper(),
                          ),
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.08),
                          InformationCards(index: selectedProjectIndex)
                        ],
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                      RichText(
                          text: TextSpan(
                              text: '<< Swipe to the sides >>',
                              style: AppFonts.tangerine(context)))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
