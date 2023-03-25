import 'package:flutter/material.dart';
import 'package:made_with_flutter/ui/widgets/app_logo.dart';

import 'header_buttons_bar/header_buttons_bar.dart';

class ScaffoldDesktopHeader extends StatelessWidget {
  const ScaffoldDesktopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const AppLogo(),
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
