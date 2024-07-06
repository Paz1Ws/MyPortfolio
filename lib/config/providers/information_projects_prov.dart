import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/widgets/ForProyects/information.dart';

final selectedProjectIndexProvider = StateProvider((ref) => 0);
final projectImagesProvider = StateProvider((ref) => const [
      "assets/images/projects/jobapp.jpg",
      "assets/images/projects/billboard.png",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
    ]);

final informationListProvider = StateProvider((ref) => [
      ProjectsInformation().billboard,
      ProjectsInformation().jobMatch,
      ProjectsInformation().Proyect3,
      ProjectsInformation().Proyect4,
      ProjectsInformation().Proyect5,
    ]);
final iconsListProvider = StateProvider((ref) => [
      ProjectsInformation().billboard_icons,
      ProjectsInformation().jobMatch_icons,
    ]);
