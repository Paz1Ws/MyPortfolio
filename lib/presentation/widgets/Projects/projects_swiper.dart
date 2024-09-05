import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/constants/media_projects_informations.dart';
import 'package:my_portfolio/presentation/widgets/Projects/information_project_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'image_project_card.dart';

class ProjectsSwiper extends ConsumerWidget {
  const ProjectsSwiper({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectIndex = ref.watch(selectedProjectIndexProvider);
    final projectImages = ref.watch(projectImagesProvider);

    return GestureDetector(
      onTap: () {
        ResponsiveBreakpoints.of(context).isMobile ? _showDescriptionDialog(context, selectedProjectIndex) : null;
      },
      child: SwipeDeck(
        aspectRatio: 1.8,
        startIndex: 0,
        onSwipeLeft: () =>
            ref.read(selectedProjectIndexProvider.notifier).state =
                (selectedProjectIndex - 1 + projectImages.length) %
                    projectImages.length,
        onSwipeRight: () => ref
            .read(selectedProjectIndexProvider.notifier)
            .state = (selectedProjectIndex + 1) % projectImages.length,
        widgets: [
          for (final image in projectImages) ProjectCard(image: image),
        ],
      ),
    );
  }
}

void _showDescriptionDialog(BuildContext context, int index) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child:   Column(
            children: [
                InformationCards(
            width: MediaQuery.sizeOf(context).width * 0.8,
            index: index,
          ),
            ],
          ),
        ),
      );
    },
  );
}
