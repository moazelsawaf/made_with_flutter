import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

import '../../credits.dart';
import 'scaffold_desktop_header/scaffold_desktop_header.dart';

class BaseScaffoldDesktop extends StatelessWidget {
  final Widget child;

  const BaseScaffoldDesktop({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: ColorsPalette.primaryColor),
          Column(
            children: [
              const ScaffoldDesktopHeader(),
              Expanded(child: child),
              const Credits(),
            ],
          ),
        ],
      ),
    );
  }
}
