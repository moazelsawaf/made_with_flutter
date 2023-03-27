import 'package:flutter/material.dart';

import 'ui/screens/home_screen/home_screen.dart';
import 'utils/colors_palette.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Made with Flutter?',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: ColorsPalette.primaryColor,
        canvasColor: ColorsPalette.white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ColorsPalette.primarySwatch,
        ).copyWith(
          secondary: ColorsPalette.secondaryColor,
          background: ColorsPalette.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
