import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/presentation/providers/scroll_provider.dart';

import '../../providers/navigations_prov.dart';

class CustomBottomSheetNavigator extends ConsumerWidget {
  const CustomBottomSheetNavigator({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Color color = AppColors.brightness(context);

    return SizedBox(
        height: MediaQuery.of(context).size.height *
            0.30, // Adjust height as needed
        child: ListView.builder(
            itemExtent: 40,
            itemCount: 6, // Number of navigation options (modify as needed)
            itemBuilder: (context, index) {
              final text = getText(index, color);
              return TextButton.icon(
                onPressed: () {
                  ref
                      .read(indexPagination.notifier)
                      .update((state) => state = index);
                  scrollToSection(ref.watch(indexPagination), context, ref);

                  Future.delayed(const Duration(milliseconds: 500), () {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  });
                },
                icon: getIcon(index, color),
                label: text,
              );
            }));
  }
}

Widget getIcon(int index, Color color) {
  switch (index) {
    case 0:
      return Icon(FontAwesomeIcons.solidUser, color: color);
    case 1:
      return Icon(Icons.build, color: color);
    case 2:
      return Icon(Icons.folder, color: color);
    case 3:
      return Icon(FontAwesomeIcons.certificate, color: color);
    case 4:
      return Icon(Icons.code, color: color);
    case 5:
      return Icon(Icons.mail, color: color);
    default:
      return const Text('');
  }
}

Text getText(int index, Color color) {
  switch (index) {
    case 0:
      return Text('About Me', style: TextStyle(color: color));
    case 1:
      return Text('What I Do', style: TextStyle(color: color));
    case 2:
      return Text('Projects', style: TextStyle(color: color));
    case 3:
      return Text('Certifications', style: TextStyle(color: color));
    case 4:
      return Text('Skills', style: TextStyle(color: color));
    case 5:
      return Text('Contact', style: TextStyle(color: color));
    default:
      return const Text('');
  }
}
