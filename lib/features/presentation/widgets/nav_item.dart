import 'package:app/features/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

Widget navItem({
  required String Path,
  required String label,
  required bool isActive,
}) {
  final color = isActive ? appBorderBgClr : Colors.black87;
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(width: 30, height: 30, child: Image.asset(Path)),

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
