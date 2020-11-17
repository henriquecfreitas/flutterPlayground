import 'package:flutter/material.dart';

class AppColors {
  static _AppColors theme = _Dark();
}

abstract class _AppColors {
  Color transparent;

  Color text;
  Color lightText;
  Color highlightText;

  Color highlightBackground;
  Color darkBackground;
  Color lightBackground;

  Color border;
  Color disabled;
}

class _Light extends _AppColors {
  Color transparent = Color.fromRGBO(0, 0, 0, 0.0);

  Color text = Color.fromRGBO(7, 7, 7, 1.0);
  Color lightText = Color.fromRGBO(39, 39, 39, 1.0);
  Color highlightText = Color.fromRGBO(181, 53, 98, 1.0);

  Color highlightBackground = Color.fromRGBO(255, 255, 255, 1.0);
  static Color _darkBackground = Color.fromRGBO(243, 243, 243, 1.0);
  Color darkBackground = _darkBackground;
  static Color _lightBackground = Color.fromRGBO(243, 243, 243, 1.0);
  Color lightBackground = _lightBackground;

  Color border = _lightBackground.withAlpha(213);
  Color disabled = _darkBackground;
}

class _Dark extends _AppColors {
  Color transparent = Color.fromRGBO(0, 0, 0, 0.0);

  Color text = Color.fromRGBO(247, 247, 227, 1.0);
  Color lightText = Color.fromRGBO(183, 183, 183, 1.0);
  Color highlightText = Color.fromRGBO(255, 247, 247, 1.0);

  Color highlightBackground = Color.fromRGBO(5, 5, 5, 1.0);
  static Color _darkBackground = Color.fromRGBO(27, 27, 27, 1.0);
  Color darkBackground = _darkBackground;
  static Color _lightBackground = Color.fromRGBO(39, 39, 39, 1.0);
  Color lightBackground = _lightBackground;

  Color border = _lightBackground.withAlpha(213);
  Color disabled = _darkBackground;
}
