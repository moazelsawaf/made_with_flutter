import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/assets_manager.dart';

enum AppLogoType { colored, white }

class AppLogo extends StatelessWidget {
  final AppLogoType type;
  final double size;

  const AppLogo({
    super.key,
    this.type = AppLogoType.colored,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _logo,
      width: size,
      height: size,
    );
  }

  String get _logo {
    switch (type) {
      case AppLogoType.colored:
        return AssetsManager.appLogoColored;
      case AppLogoType.white:
        return AssetsManager.appLogoWhite;
    }
  }
}
