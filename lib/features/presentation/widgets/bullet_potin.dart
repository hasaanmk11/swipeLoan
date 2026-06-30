import 'package:flutter/material.dart';

Widget bulletPoint(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 6),
        child: Icon(Icons.circle, size: 4, color: Colors.black87),
      ),
      const SizedBox(width: 8),
      Text(
        text,
        style: const TextStyle(fontSize: 13, color: Color(0xff333333)),
      ),
    ],
  );
}
