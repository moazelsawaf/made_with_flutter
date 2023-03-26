import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors_palette.dart';

class Credits extends StatelessWidget {
  final Color color;
  final Color linkColor;

  const Credits({
    super.key,
    this.color = ColorsPalette.gray900,
    this.linkColor = ColorsPalette.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: 'Made with '),
          TextSpan(
            text: 'Flutter',
            style: TextStyle(
              color: linkColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _openUrl('https://flutter.dev/'),
          ),
          const TextSpan(text: ' & 💙 by '),
          TextSpan(
            text: '@moazelsawaf',
            style: TextStyle(
              color: linkColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _openUrl('https://github.com/moazelsawaf'),
          ),
        ],
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _openUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (_) {}
  }
}
