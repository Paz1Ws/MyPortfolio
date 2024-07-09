import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/providers/navigations_prov.dart';

class CustomBottomSheetNavigator extends ConsumerWidget {
  const CustomBottomSheetNavigator({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.3, // Adjust height as needed
      child: ListView.builder(
        itemCount: 6, // Number of navigation options (modify as needed)
        itemBuilder: (context, index) {
          return TextButton.icon(
            onPressed: () {
              ref
                  .read(indexPagination.notifier)
                  .update((state) => state = index);
              ref.read(isVisible.notifier).state = true;
            },

            icon: getIcon(
                index), // Function to return appropriate icon (optional)
            label: getText(
                index), // Function to return appropriate text (optional)
          );
        },
      ),
    );
  }

  Widget getIcon(int index) {
    switch (index) {
      case 0:
        return const Icon(Icons.home);
      case 1:
        return const Icon(Icons.search);
      case 2:
        return const Icon(Icons.favorite);
      case 3:
        return const Icon(Icons.shopping_cart);
      case 4:
        return const Icon(Icons.settings);
      case 5:
        return const Icon(Icons.person);
      default:
        return const Icon(Icons.error);
    }
  }

  Text getText(int index) {
    switch (index) {
      case 0:
        return const Text('About Me');
      case 1:
        return const Text('What I Do');
      case 2:
        return const Text('Projects');
      case 3:
        return const Text('Certifications');
      case 4:
        return const Text('Experience & Technology');
      case 5:
        return const Text('Contact');
      default:
        return const Text('Error');
    }
  }
}
