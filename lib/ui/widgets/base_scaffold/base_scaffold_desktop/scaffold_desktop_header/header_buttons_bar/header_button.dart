import 'package:flutter/material.dart';

import '../../../../../../utils/colors_palette.dart';

class HeaderButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;

  const HeaderButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        fixedSize: const Size.fromHeight(38),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
        foregroundColor: ColorsPalette.black,
        backgroundColor: ColorsPalette.white,
        shadowColor: Colors.transparent,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
