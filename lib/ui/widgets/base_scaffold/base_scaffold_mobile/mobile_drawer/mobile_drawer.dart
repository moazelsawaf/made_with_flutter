import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

import '../../../../../utils/helpers.dart';
import '../../../app_logo.dart';
import 'mobile_drawer_item.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      backgroundColor: ColorsPalette.white,
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 64,
            bottom: 24,
          ),
          child: Column(
            children: [
              const AppLogo(size: 125),
              const SizedBox(height: 48),
              MobileDrawerItem(
                label: 'About',
                onTap: () => Helpers.showComingSoonToast(context),
              ),
              MobileDrawerItem(
                label: 'How it Works?',
                onTap: () => Helpers.showComingSoonToast(context),
              ),
              MobileDrawerItem(
                label: 'Repository',
                onTap: () => Helpers.showComingSoonToast(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
