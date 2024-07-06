import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/providers/information_projects_prov.dart';
import 'package:swipe_deck/swipe_deck.dart';

import 'image_project_card.dart';

class ProjectsSwiper extends ConsumerWidget {
  const ProjectsSwiper({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectIndex = ref.watch(selectedProjectIndexProvider);
    final projectImages = ref.watch(projectImagesProvider);

    return SwipeDeck(
      aspectRatio: 1.65,
      startIndex: 0,
      onSwipeLeft: () => ref.read(selectedProjectIndexProvider.notifier).state =
          (selectedProjectIndex - 1 + projectImages.length) %
              projectImages.length,
      onSwipeRight: () => ref
          .read(selectedProjectIndexProvider.notifier)
          .state = (selectedProjectIndex + 1) % projectImages.length,
      widgets: [
        for (final image in projectImages) ProjectCard(image: image),
      ],
    );
  }
}
