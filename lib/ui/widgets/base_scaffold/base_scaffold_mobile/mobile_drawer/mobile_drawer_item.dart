import 'package:flutter/material.dart';

class MobileDrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const MobileDrawerItem({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
