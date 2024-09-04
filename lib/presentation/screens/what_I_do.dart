import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:my_portfolio/presentation/widgets/General/gradient_for_titles.dart';
import 'package:my_portfolio/presentation/widgets/WhatIDo/desing_process.dart';
import 'package:my_portfolio/presentation/widgets/WhatIDo/name_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Learn",
    imagePath: "assets/images/icons/learn.png",
  ),
  DesignProcess(
    title: "Develop",
    imagePath: "assets/images/icons/develop.png",
  ),
  DesignProcess(
    title: "Deploy and make it live",
    imagePath: "assets/images/icons/deploy.png",
  ),
];

class WhatIDo extends StatelessWidget {
  WhatIDo({super.key});
  final whatIDo = [
    NameIconColor(
      title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
    ),
    NameIconColor(
      title: "Web Development",
      iconData: Icons.web,
      color: Colors.yellow[400]!,
    ),
    NameIconColor(
      title: "Backend Development",
      iconData: Icons.key,
      color: Colors.blue[400]!,
    ),
    NameIconColor(
      title: "Content Creation",
      iconData: FontAwesomeIcons.youtube,
      color: Colors.red[400]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveBreakpoints.of(context).isMobile
          ? Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(
                          -size.width * 0.1, -size.height * 0.1, 0.0),
                      child: Image.asset(
                        "assets/images/tech/flutter_bird.png",
                        fit: BoxFit.cover,
                        scale: 1.5,
                        height: size.height / 2.5,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: GradientForTitles(
                        title: "What I Do?",
                      ),
                    ),
                  ],
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0, -size.height * 0.06, 0.0),
                  child: Text(
                      "I'm a skilled professional who delivers excellent results.",
                      textAlign: TextAlign.center,
                      style: AppFonts.josefinSans14.copyWith(
                        color: AppColors.grey800,
                        fontSize: 18,
                      )),
                ),
                Consumer(builder: (context, ref, _) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final screenWidth = constraints.maxWidth;
                      return Wrap(
                        spacing: 15.0,
                        runSpacing: 15.0,
                        alignment: WrapAlignment.center,
                        children: whatIDo.map((text) {
                          final itemSize = screenWidth > 600 ? 200.0 : constraints.maxWidth / 2.5;
                      
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                                  minHeight: itemSize/2,
                                  minWidth: itemSize/2,
                                  maxHeight: itemSize,
                                  maxWidth: itemSize,
                                ),
                            child: Card(
                               color: Colors.white,
                              elevation: 2, 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              
                             
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: AppColors.grey800,
                                      child: Icon(
                                        text.iconData,
                                        color: text.color,
                                        size: 40,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      text.title,
                                      textAlign: TextAlign.center,
                                      style:AppFonts.josefinSans24.copyWith(
                                        color: AppColors.grey800,
                                        fontSize: 18,
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            
                          );
                        }).toList(),
                      );
                    },
                  );
                }),
              ],
            )
          : Stack(
              children: [
                Positioned(
                  top: -MediaQuery.of(context).size.height * 0.01,
                  left: -MediaQuery.of(context).size.width * 0.2,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/images/tech/flutter_bird.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: SizedBox.expand(
                    child: SvgPicture.asset(
                      "assets/images/design/whatido_background.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Productive, Experienced, Skilled, Creative",
                          style: AppFonts.josefinSans24.copyWith(
                            height: 1.8,
                            letterSpacing: 2,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      GradientForTitles(
                        title: "What I Do?",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          "I'm a skilled professional who delivers excellent results.",
                          style: AppFonts.josefinSans14.copyWith(
                            color: AppColors.grey800,
                            fontSize: 18,
                            height: 1.8,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer(builder: (context, ref, _) {
                        return Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: whatIDo
                                .map((text) => Container(
                                      height: 200,
                                      width: 200,
                                      margin: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: AppColors.grey800,
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                            ),
                                            child: Icon(
                                              text.iconData,
                                              color: text.color,
                                              size: 52,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            text.title,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.josefinSans(
                                              color: Colors.grey[800],
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                .toList());
                      }),
                      const SizedBox(
                        height: 80.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int index = 0;
                              index < designProcesses.length;
                              index++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                Image.asset(
                                  designProcesses[index].imagePath,
                                  width: 80.0,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  designProcesses[index].title,
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
