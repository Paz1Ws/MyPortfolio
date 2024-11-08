import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/presentation/providers/navigations_prov.dart';

final scrollControllerProvider = StateProvider<ScrollController>((ref) {
  return ScrollController();
});

void scrollToSection(int index, BuildContext context, ref) {
  final scrollController = ref.watch(scrollControllerProvider);

  try {
    scrollController.position.animateTo(
      index * MediaQuery.of(context).size.height,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    ref.read(indexPagination.notifier).state = 0;
  } catch (e) {
    // ignore: avoid_print
    print("Ignore error in scroll.");
  }
}
