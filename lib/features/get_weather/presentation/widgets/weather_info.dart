import 'package:flutter/material.dart';

import 'weather_detail.dart';

class WeatherInfo extends StatelessWidget {
  final String description;
  final String sunriseTime;
  final String sunsetTime;
  const WeatherInfo({
    super.key,
    required this.description,
    required this.sunriseTime,
    required this.sunsetTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          description,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherDetail(
              label: "Sunrise",
              value: sunriseTime,
            ),
            WeatherDetail(
              label: "Sunset",
              value: sunsetTime,
            ),
          ],
        ),
      ],
    );
  }
}
