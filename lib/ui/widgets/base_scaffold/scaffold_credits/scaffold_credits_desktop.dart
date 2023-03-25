import 'package:flutter/material.dart';

class ScaffoldCreditsDesktop extends StatelessWidget {
  const ScaffoldCreditsDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Take care of the style
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Made with Flutter & 💙 by @moazelsawaf'),
    );
  }
}
