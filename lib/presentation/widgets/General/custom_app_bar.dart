import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/providers/navigations_prov.dart';
import 'package:my_portfolio/presentation/widgets/ForAbout/audioplayer_button.dart';
import 'package:my_portfolio/presentation/widgets/ForAbout/theme_button.dart';
import 'package:my_portfolio/presentation/widgets/General/custom_bottom_shet_navigator.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  CustomAppBar({super.key, this.visibilityShowModal = true});

  bool visibilityShowModal;
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final indexofPagination = ref.watch(indexPagination);

    switch (indexofPagination) {
      case 0:
        _scrollToSection(context, 0);

        ref.read(isVisible.notifier).state = true;

        break;
      case 1:
        _scrollToSection(context, 1);
        setState(() {
          ref.read(isVisible.notifier).state = true;
        });
        break;
      case 2:
        _scrollToSection(context, 2);
        setState(() {
          ref.read(isVisible.notifier).state = true;
        });
        break;
      case 3:
        _scrollToSection(context, 3);
        setState(() {
          ref.read(isVisible.notifier).state = true;
        });
        break;
      case 4:
        _scrollToSection(context, 4);
        setState(() {
          ref.read(isVisible.notifier).state = true;
        });
        break;
      case 5:
        _scrollToSection(context, 5);
        setState(() {
          ref.read(isVisible.notifier).state = true;
        });
        break;
      default:
    }
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width / 3,
        left: MediaQuery.of(context).size.width / 3,
      ),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            if (ref.watch(isVisible) == true) {
              setState(() {
                ref.read(isVisible.notifier).state = false;
              });
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const CustomBottomSheetNavigator();
                },
                enableDrag: true,
              );
            }
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

  _scrollToSection(BuildContext context, int index) {
    final scrollable = Scrollable.of(context);
    final double offset = index * MediaQuery.of(context).size.height;

    scrollable.position.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
