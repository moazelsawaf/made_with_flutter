import 'package:flutter/material.dart';

class ColorsPalette {
  ColorsPalette._();

  static const _primaryColorValue = 0xFF42A5F6;

  static const primarySwatch = MaterialColor(
    _primaryColorValue,
    {
      50: Color(0xFFE8F4FE),
      100: Color(0xFFC6E4FC),
      200: Color(0xFFA1D2FB),
      300: Color(0xFF7BC0F9),
      400: Color(0xFF5EB3F7),
      500: Color(_primaryColorValue),
      600: Color(0xFF3C9DF5),
      700: Color(0xFF3393F3),
      800: Color(0xFF2B8AF2),
      900: Color(0xFF1D79EF),
    },
  );

  // Main Colors
  static const primaryColor = Color(_primaryColorValue);
  static const secondaryColor = Color(0xFF0E47A1);

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
