import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/providers/global_provider.dart';
import 'package:swipe_deck/swipe_deck.dart';

import 'image_project_card.dart';

class ProjectsSwiper extends ConsumerWidget {
  const ProjectsSwiper({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectIndex = ref.watch(selectedProjectIndexProvider);
    final projectImages = ref.watch(projectImagesProvider);

    return SwipeDeck(
      startIndex: 0,
      onSwipeLeft: () => ref.read(selectedProjectIndexProvider.notifier).state =
          (selectedProjectIndex - 1 + projectImages.length) %
              projectImages.length,
      onSwipeRight: () => ref
          .read(selectedProjectIndexProvider.notifier)
          .state = (selectedProjectIndex + 1) % projectImages.length,
      widgets: [
        for (int i = 0; i < projectImages.length; i++)
          ProjectCard(image: projectImages[i]),
      ],
    );
  }
}