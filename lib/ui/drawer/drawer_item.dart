import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color secondaryText = Color(0xFF8B93A7);
    const Color accentBlue = Color(0xFF3B82F6);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          label,
          style: TextStyle(
            color: active ? accentBlue : secondaryText,
            fontSize: 18,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}


