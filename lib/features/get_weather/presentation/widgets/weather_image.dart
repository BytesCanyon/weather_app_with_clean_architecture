import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String imagePath;
  const WeatherImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          imagePath,
          scale: 2.1,
        ),
        const Text(
          "24ºC",
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
