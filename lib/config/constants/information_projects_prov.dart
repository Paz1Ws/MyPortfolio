import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/widgets/Projects/information.dart';

final selectedProjectIndexProvider = StateProvider((ref) => 0);
final projectImagesProvider = StateProvider((ref) => const [
      "assets/images/projects/fitbody.png",
      "assets/images/projects/jobapp.jpg",
      "assets/images/projects/billboard.png",
    ]);

final informationListProvider = StateProvider((ref) => [
      ProjectsInformation().fitbody,
      ProjectsInformation().jobMatch,
      ProjectsInformation().billboard,
    ]);
final iconsListProvider = StateProvider((ref) => [
      ProjectsInformation().fitbody_icons,
      ProjectsInformation().jobMatch_icons,
      ProjectsInformation().billboard_icons,
    ]);