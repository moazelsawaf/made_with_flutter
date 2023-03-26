import 'package:flutter/material.dart';
import 'package:made_with_flutter/ui/widgets/app_logo.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

import 'mobile_drawer/mobile_drawer.dart';

class BaseScaffoldMobile extends StatelessWidget {
  final Widget child;

  const BaseScaffoldMobile({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.white,
      appBar: AppBar(
        backgroundColor: ColorsPalette.gray50,
        centerTitle: true,
        title: const AppLogo(
          size: 30,
        ),
      ),
      drawer: const MobileDrawer(),
      body: Column(
        children: [
          Container(
            height: 0.5,
            color: ColorsPalette.gray400,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
