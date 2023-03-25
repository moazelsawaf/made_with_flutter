import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

import 'scaffold_header/scaffold_header_desktop/scaffold_header_desktop.dart';
import 'scaffold_credits/scaffold_credits_desktop.dart';

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
              const ScaffoldHeaderDesktop(),
              Expanded(child: child),
              const ScaffoldCreditsDesktop(),
            ],
          ),
        ],
      ),
    );
  }
}
