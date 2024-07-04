import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/providers/global_provider.dart';
import 'package:my_portfolio/presentation/providers/information_projects_prov.dart';
import 'package:swipe_deck/swipe_deck.dart';

import 'image_project_card.dart';

class ProjectsSwiper extends ConsumerWidget {
  const ProjectsSwiper({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectImages = ref.watch(projectImagesProvider);

    return SwipeDeck(
      startIndex: 0,
      onSwipeLeft: () {
        final currentIndex =
            ref.read(selectedProjectIndexProvider.notifier).state;
        if (currentIndex > 0) {
          ref.read(selectedProjectIndexProvider.notifier).state--;
        }
      },
      onSwipeRight: () {
        final currentIndex =
            ref.read(selectedProjectIndexProvider.notifier).state;
        if (currentIndex < 4) {
          ref.read(selectedProjectIndexProvider.notifier).state++;
        }
      },
      widgets: [
        for (int i = 0; i < projectImages.length; i++)
          ProjectCard(image: projectImages[i]),
      ],
    );
  }
}
