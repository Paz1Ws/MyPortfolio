import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:my_portfolio/presentation/widgets/Certifications&Skills/Skills/skills_cards.dart';

class TechsListMobile extends StatelessWidget {
  const TechsListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Frontend & Mobile: ',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: AppFonts.ubuntu20(context).copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Backend & Databases: ',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: AppFonts.ubuntu20(context).copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Tools for the daily life: ',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: AppFonts.ubuntu20(context).copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).width * .1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: TechCarouselGenerator(techs: frontendMobile)),
              Expanded(child: TechCarouselGenerator(techs: backendDatabases)),
              Expanded(child: TechCarouselGenerator(techs: dailyTools)),
            ],
          ),
        ],
      ),
    );
  }
}

class TechCarouselGenerator extends StatelessWidget {
  final List<Widget> techs;

  const TechCarouselGenerator({
    super.key,
    required this.techs,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      items: techs,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .45,
        scrollDirection: Axis.vertical,
        enableInfiniteScroll: true,
        viewportFraction: 1 / 3,
        autoPlayInterval: const Duration(milliseconds: 3000),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.easeInOutCubic,
        autoPlay: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeCenterPage: true,
        physics: const BouncingScrollPhysics(),
        showIndicator: false,
      ),
    );
  }
}
