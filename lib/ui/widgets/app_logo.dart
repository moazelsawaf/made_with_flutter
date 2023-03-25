import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with your own logo
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      child: FlutterLogo(size: size),
    );
  }
}
