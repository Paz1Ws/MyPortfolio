import 'package:flutter/widgets.dart';

class NavigationByPages {
  final aboutSection = GlobalKey();
  final projectsSection = GlobalKey();
  final contactSection = GlobalKey();
  final certificationsSection = GlobalKey();
  final experienceSection = GlobalKey();
  void scrollGlobal(GlobalKey key) {
    if (key.currentContext == null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
