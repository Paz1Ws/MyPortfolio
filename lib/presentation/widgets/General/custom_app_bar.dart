import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/providers/navigations_prov.dart';
import 'package:my_portfolio/presentation/widgets/About/audioplayer_button.dart';
import 'package:my_portfolio/presentation/widgets/About/theme_button.dart';
import 'package:my_portfolio/presentation/widgets/General/custom_bottom_shet_navigator.dart';

final scrollControllerProvider =
    StateProvider<ScrollController>((ref) => ScrollController());

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final indexofPagination = ref.watch(indexPagination);
    final scrollController = ref.watch(scrollControllerProvider);

    void scrollToSection(BuildContext context, int index) {
      // ignore: unnecessary_null_comparison
      try {
        scrollController.position.animateTo(
          index * MediaQuery.of(context).size.height,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        ref.read(indexPagination.notifier).state = 0;
      } catch (e) {
        print("Ignore error in scroll.");
      }
    }

    switch (indexofPagination) {
      case 0:
        scrollToSection(context, indexofPagination);

        break;
      case 1:
        scrollToSection(context, indexofPagination);

        break;
      case 2:
        scrollToSection(context, indexofPagination);

        break;
      case 3:
        scrollToSection(context, indexofPagination);

        break;
      case 4:
        scrollToSection(context, indexofPagination);

        break;
      case 5:
        scrollToSection(context, indexofPagination);

        break;
      default:
        scrollToSection(context, 0);
    }

    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width / 3,
        left: MediaQuery.of(context).size.width / 3,
      ),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const CustomBottomSheetNavigator();
              },
              enableDrag: true,
            ).whenComplete(() => ref.read(indexPagination.notifier).state = 0);
          },
          icon: const Icon(Icons.menu),
        ),
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
        ),
        actions: const [
          ThemeIconButton(),
          ButtonPlayer(),
        ],
      ),
    );
  }
}
