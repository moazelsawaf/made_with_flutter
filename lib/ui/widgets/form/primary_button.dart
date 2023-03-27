import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../utils/colors_palette.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        minimumSize: Size.fromHeight(
          getValueForScreenType<double>(
            context: context,
            mobile: 45,
            desktop: 55,
            tablet: 55,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        foregroundColor: ColorsPalette.white,
        backgroundColor: ColorsPalette.primaryColor,
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
