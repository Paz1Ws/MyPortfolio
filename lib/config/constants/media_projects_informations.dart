import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/constants/projects_inforation.dart';

final selectedProjectIndexProvider = StateProvider((ref) => 0);
final projectImagesProvider = StateProvider((ref) => [
      Image.asset('assets/images/projects/fitbody.png', fit: BoxFit.contain),
      Image.asset('assets/images/projects/jobMatch.png', fit: BoxFit.contain),
      Image.asset('assets/images/projects/billboard.png', fit: BoxFit.contain),
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
