import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_palette.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';

class Credits extends StatelessWidget {
  final Color color;
  final Color linkColor;
  final bool underlineLinks;

  const Credits({
    super.key,
    this.color = ColorsPalette.gray900,
    this.linkColor = ColorsPalette.primaryColor,
    this.underlineLinks = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Made with '),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(
                  color: linkColor,
                  decoration: underlineLinks ? TextDecoration.underline : null,
                  decorationColor: linkColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Helpers.openUrl(Constants.flutterWebsiteUrl),
              ),
              const TextSpan(text: ' & 💙 by '),
              TextSpan(
                text: '@moazelsawaf',
                style: TextStyle(
                  color: linkColor,
                  decoration: underlineLinks ? TextDecoration.underline : null,
                  decorationColor: linkColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Helpers.openUrl(Constants.authorGitHubUrl),
              ),
            ],
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          'V 1.0.3 - Copyright © 2023 All Rights Reserved',
          style: TextStyle(
            color: color,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
