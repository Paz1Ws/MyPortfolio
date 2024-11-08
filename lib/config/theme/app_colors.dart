import 'package:flutter/material.dart';

class AppColors {
  static Color brightness(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  static Color brightnessInverse(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
  }

  static const Color cyan = Color(0xFF00BCD4);
  static const Color softPurple = Color.fromARGB(255, 170, 45, 192);

  static const Color lightPurple = Color.fromRGBO(156, 39, 176, 1);

  static const Color deepPurple = Colors.deepPurpleAccent;
  static const Color white = Colors.white;
  static Color? grey800 = Colors.grey[800];
  static const Color lightBlack = Color.fromARGB(36, 36, 36, 35);
}
