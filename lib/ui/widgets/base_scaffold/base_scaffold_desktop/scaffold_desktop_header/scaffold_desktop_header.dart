import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/helpers.dart';

import '../../../../../utils/constants.dart';
import '../../../app_logo.dart';
import 'header_buttons_bar/header_buttons_bar.dart';

class ScaffoldDesktopHeader extends StatelessWidget {
  const ScaffoldDesktopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          const AppLogo(
            type: AppLogoType.white,
          ),
          const Spacer(),
          HeaderButtonsBar(
            buttons: [
              HeaderButtonData(
                label: 'About',
                onPressed: () => Helpers.showComingSoonToast(context),
              ),
              HeaderButtonData(
                label: 'How it Works?',
                onPressed: () => Helpers.showComingSoonToast(context),
              ),
              HeaderButtonData(
                label: 'Repository',
                onPressed: () => Helpers.openUrl(
                  Constants.gitHubRepositoryUrl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
