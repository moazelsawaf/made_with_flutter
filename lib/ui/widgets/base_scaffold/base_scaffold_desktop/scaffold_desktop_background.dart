import 'package:flutter/material.dart';

import '../../../../utils/assets_manager.dart';
import '../../../../utils/colors_palette.dart';

class ScaffoldDesktopBackground extends StatelessWidget {
  const ScaffoldDesktopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManager.desktopBackground,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      color: ColorsPalette.primaryColor.withOpacity(0.85),
      colorBlendMode: BlendMode.multiply,
    );
  }
}
