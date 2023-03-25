import 'package:flutter/material.dart';

import 'header_buttons_bar/header_buttons_bar.dart';

class ScaffoldHeaderDesktop extends StatelessWidget {
  const ScaffoldHeaderDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // TODO: Replace with the logo
          const ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            child: FlutterLogo(size: 50),
          ),
          const Spacer(),
          HeaderButtonsBar(
            buttons: [
              HeaderButtonData(
                label: 'About',
                onPressed: () {},
              ),
              HeaderButtonData(
                label: 'How it Works?',
                onPressed: () {},
              ),
              HeaderButtonData(
                label: 'Repository',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
