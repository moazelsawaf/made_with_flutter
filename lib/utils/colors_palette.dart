import 'package:flutter/material.dart';

class ColorsPalette {
  ColorsPalette._();

  static const _primaryColorValue = 0xFF0E47A1;

  static const primarySwatch = MaterialColor(
    _primaryColorValue,
    {
      050: Color(0xFFE2E9F4),
      100: Color(0xFFB7C8E3),
      200: Color(0xFF87A3D0),
      300: Color(0xFF567EBD),
      400: Color(0xFF3263AF),
      500: Color(_primaryColorValue),
      600: Color(0xFF0C4099),
      700: Color(0xFF0A378F),
      800: Color(0xFF082F85),
      900: Color(0xFF042074),
    },
  );

  // Main Colors
  static const primaryColor = Color(_primaryColorValue);
  static const secondaryColor = Color(0xFFFCB732);

  // Whites and Blacks
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  // Grays
  static const gray50 = Color(0xFFf8f9fb);
  static const gray100 = Color(0xFFf2f3f7);
  static const gray200 = Color(0xFFe9edef);
  static const gray300 = Color(0xFFdee1e6);
  static const gray400 = Color(0xFFcfd4da);
  static const gray500 = Color(0xFFadb4bd);
  static const gray600 = Color(0xFF868d96);
  static const gray700 = Color(0xFF495057);
  static const gray800 = Color(0xFF353a40);
  static const gray900 = Color(0xFF212429);

  static const red = Color(0xFFD32F2F);
}
