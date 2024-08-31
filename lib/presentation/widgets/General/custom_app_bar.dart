import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/providers/navigations_prov.dart';
import 'package:my_portfolio/presentation/widgets/About/audioplayer_button.dart';
import 'package:my_portfolio/presentation/widgets/About/theme_button.dart';
import 'package:my_portfolio/presentation/widgets/General/custom_bottom_shet_navigator.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 3),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const CustomBottomSheetNavigator();
              },
              enableDrag: true,
            ).whenComplete(() {
              ref.read(indexPagination.notifier).state = 0;
            });
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
          ButtonPlayer(audioUrl: 'audio/BackMusic.mp3'),
        ],
      ),
    );
  }
}
