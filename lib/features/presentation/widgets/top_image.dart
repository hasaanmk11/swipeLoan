import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  const TopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/top_image.jpg",
      width: double.infinity,
      height: 350,
      fit: BoxFit.cover,
    );
  }
}
