import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/constants/general_information.dart';
import 'package:my_portfolio/config/constants/media_projects_informations.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationCards extends ConsumerWidget {
  final int index;
  final double? width;
  const InformationCards({super.key, required this.index, this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final projectsLinks = Information().projectsLinks;
    final informationList = ref.watch(informationListProvider);
    final iconsList = ref.watch(iconsListProvider);

    return Container(
      width: width??size.width * 0.4, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightBlack,
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildInformationText(context, informationList[index]),
              const SizedBox(height: 8.0),
              _buildMadeWithSection(context, iconsList[index]),
              const SizedBox(height: 8.0),
              _buildSeeMoreButton(context, projectsLinks[index]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInformationText(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.ubuntuCondensed(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
      overflow: TextOverflow.fade,
    );
  }

  Widget _buildMadeWithSection(BuildContext context, List<String> icons) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Made with:",
            style: AppFonts.josefinSans20
                .copyWith(fontWeight: FontWeight.bold, color: AppColors.cyan)),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: icons.map((iconPath) {
            return CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.asset(
                iconPath,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSeeMoreButton(BuildContext context, Uri url) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(FontAwesomeIcons.github),
        Flexible(
          child: TextButton(
            child: Text(
              "See more over here!",
              style: AppFonts.josefinSans.copyWith(
                color: AppColors.brightness(context),
                fontSize: 18
              ),
            ),
            onPressed: () => launchUrl(url),
          ),
        ),
      ],
    );
  }
}
