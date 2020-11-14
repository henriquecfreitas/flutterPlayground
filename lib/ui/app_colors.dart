import 'package:flutter/widgets.dart';

class AppColors {
  static final transparent = Color.fromRGBO(0, 0, 0, 0.0);

  static final text = Color.fromRGBO(7, 7, 7, 1.0);
  static final highlightText = Color.fromRGBO(181, 53, 98, 1.0);

  static final highlightBackground = Color.fromRGBO(255, 255, 255, 1.0);
  static final darkBackground = Color.fromRGBO(235, 235, 235, 1.0);
  static final lightBackground = Color.fromRGBO(243, 243, 243, 1.0);

  static final border = lightBackground.withAlpha(213);
  static final disabled = darkBackground;
}
