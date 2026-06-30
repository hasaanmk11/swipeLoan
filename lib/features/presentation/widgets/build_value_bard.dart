import 'package:flutter/material.dart';

List<Widget> buildValueBadges(
      List<String> labels,
      List<Color> bgColors,
      List<Color> textColors,
    ) {
      // Approximate horizontal positions for 5 points across the chart width
      final positions = [0.02, 0.22, 0.42, 0.62, 0.80];
      return List.generate(labels.length, (i) {
        return Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: FractionallySizedBox(
            alignment: Alignment(positions[i] * 2 - 1, -1),
            widthFactor: 0.18,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: bgColors[i],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  labels[i],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: textColors[i],
                  ),
                ),
              ),
            ),
          ),
        );
      });
    }
  