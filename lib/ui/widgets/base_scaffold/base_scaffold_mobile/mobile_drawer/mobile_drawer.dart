import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

import '../../../app_logo.dart';
import 'mobile_drawer_item.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsPalette.white,
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              const AppLogo(size: 50),
              const SizedBox(height: 32),
              MobileDrawerItem(
                label: 'About',
                onTap: () {},
              ),
              MobileDrawerItem(
                label: 'How it Works?',
                onTap: () {},
              ),
              MobileDrawerItem(
                label: 'Repository',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
