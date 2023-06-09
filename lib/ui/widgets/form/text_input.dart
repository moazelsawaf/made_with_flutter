import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool enabled;

  const TextInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      cursorColor: ColorsPalette.primaryColor,
      style: const TextStyle(
        color: ColorsPalette.gray900,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorsPalette.gray500,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: _getBorder(),
        enabledBorder: _getBorder(),
        focusedBorder: _getBorder(color: ColorsPalette.primaryColor),
        errorBorder: _getBorder(color: ColorsPalette.red),
        focusedErrorBorder: _getBorder(color: ColorsPalette.red),
      ),
    );
  }

  OutlineInputBorder _getBorder({Color color = ColorsPalette.gray400}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: color,
        width: 0.75,
      ),
    );
  }
}
