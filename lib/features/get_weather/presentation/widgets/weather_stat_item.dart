import 'package:flutter/material.dart';

class WeatherStatItem extends StatelessWidget {
  final String iconPath;
  final String value;
  final String label;

  const WeatherStatItem({
    required this.iconPath,
    required this.value,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Image.asset(
            iconPath,
            scale: 20,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
