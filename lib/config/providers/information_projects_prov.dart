import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/widgets/Projects/information.dart';

final selectedProjectIndexProvider = StateProvider((ref) => 0);
final projectImagesProvider = StateProvider((ref) => const [
      "assets/images/projects/jobapp.jpg",
      "assets/images/projects/billboard.png",
      "assets/animations/ProjectNotFound.gif",
      "assets/animations/ProjectNotFound.gif",
      "assets/animations/ProjectNotFound.gif",
    ]);

final informationListProvider = StateProvider((ref) => [
      ProjectsInformation().jobMatch,
      ProjectsInformation().billboard,
      ProjectsInformation().Proyect3,
      ProjectsInformation().Proyect4,
      ProjectsInformation().Proyect5,
    ]);
final iconsListProvider = StateProvider((ref) => [
      ProjectsInformation().jobMatch_icons,
      ProjectsInformation().billboard_icons,
    ]);
