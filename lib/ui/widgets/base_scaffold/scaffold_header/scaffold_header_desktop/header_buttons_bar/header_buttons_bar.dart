import 'package:flutter/material.dart';

import '../../../../../../utils/colors_palette.dart';
import 'header_button.dart';

class HeaderButtonData {
  final String label;
  final VoidCallback onPressed;

  const HeaderButtonData({
    required this.label,
    required this.onPressed,
  });
}


class HeaderButtonsBar extends StatelessWidget {
  final List<HeaderButtonData> buttons;

  const HeaderButtonsBar({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 2 * buttons.length - 1; i++)
          if (i.isEven)
            HeaderButton(
              label: buttons[i ~/ 2].label,
              onPressed: buttons[i ~/ 2].onPressed,
              borderRadius: _getBorderRadius(i),
            )
          else
            Container(
              height: 38,
              width: 0.5,
              color: ColorsPalette.gray200,
            ),
      ],
    );
  }

  bool _isFirst(int index) => index ~/ 2 == 0;
  bool _isLast(int index) => index ~/ 2 == buttons.length - 1;

  BorderRadiusGeometry _getBorderRadius(int index) {
    if (_isFirst(index)) {
      return const BorderRadius.only(
        topLeft: Radius.circular(4),
        bottomLeft: Radius.circular(4),
      );
    } else if (_isLast(index)) {
      return const BorderRadius.only(
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(4),
      );
    } else {
      return BorderRadius.zero;
    }
  }
}