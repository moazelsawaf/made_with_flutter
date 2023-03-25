import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_screen_desktop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const HomeScreenDesktop(),
      tablet: (context) => const HomeScreenDesktop(),
      desktop: (context) => const HomeScreenDesktop(),
    );
  }
}
