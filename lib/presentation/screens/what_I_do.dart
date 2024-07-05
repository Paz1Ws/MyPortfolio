import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/presentation/widgets/desing_process.dart';
import 'package:my_portfolio/presentation/widgets/name_icon.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Learn",
    imagePath: "assets/images/learn.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Develop",
    imagePath: "assets/images/develop.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Deploy and make it live",
    imagePath: "assets/images/deploy.png",
    subtitle: "",
  ),
];

class ServiceSection extends StatelessWidget {
  ServiceSection({super.key});
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
      title: "Github\n Open Source",
      iconData: Icons.code,
      color: Colors.orange[400]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildUi(context);
  }

  Widget _buildUi(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Productive, Experienced, Skilled, Creative",
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w900,
                height: 1.8,
                letterSpacing: 2,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF00BCD4),
                  Color.fromRGBO(156, 39, 176, 1),
                  Colors.deepPurpleAccent
                ],
              ).createShader(bounds),
              child: Text(
                "What I Do?",
                style: GoogleFonts.ubuntuMono(
                    fontWeight: FontWeight.w900, fontSize: 50),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "I'm a skilled professional who delivers excelent results.",
              style: GoogleFonts.josefinSans(
                color: Colors.grey[400],
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, ref, _) {
              return Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: whatIDo
                      .map((e) => Container(
                            height: 200,
                            width: 200,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(75, 12, 12, 7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Icon(
                                    e.iconData,
                                    color: e.color,
                                    size: 52,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  e.title,
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
                for (int index = 0; index < designProcesses.length; index++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
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
    );
  }
}
