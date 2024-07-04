import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/widgets/ForProyects/information.dart';

final selectedProjectIndexProvider = StateProvider((ref) => 0);
final projectImagesProvider = StateProvider((ref) => const [
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
      "assets/images/Me.jpg",
    ]);

final informationListProvider = StateProvider((ref) => [
      OnlyInformation().billboard,
      OnlyInformation().Proyect2,
      OnlyInformation().Proyect3,
      OnlyInformation().Proyect4,
      OnlyInformation().Proyect5,
    ]);
final iconsListProvider = StateProvider((ref) => [
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
      OnlyInformation().billboard_icons,
    ]);
