import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/constants/projects_information.dart';

final selectedProjectIndexProvider = StateProvider((ref) => 0);
final projectImagesProvider = StateProvider((ref) => const [
      "assets/images/projects/exoview.jpeg",
      "assets/images/projects/fitbody.png",
      "assets/images/projects/jobapp.jpg",
      "assets/images/projects/billboard.png",
    ]);

final informationListProvider = StateProvider((ref) => [
       ProjectsInformation().exoview,
      ProjectsInformation().fitbody,
      ProjectsInformation().jobMatch,
      ProjectsInformation().billboard,
    ]);
final iconsListProvider = StateProvider((ref) => [
       ProjectsInformation().exoview_icons,
      ProjectsInformation().fitbody_icons,
      ProjectsInformation().jobMatch_icons,
      ProjectsInformation().billboard_icons,
    ]);
