import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({
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
