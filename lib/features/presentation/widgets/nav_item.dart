import 'package:flutter/material.dart';

Widget navItem({
  required String Path,
  required String label,
  required bool isActive,
}) {
  final color = isActive ? const Color(0xff16C172) : Colors.black87;
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(Path),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 8,
          color: color,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    ],
  );
}
