import 'package:flutter/material.dart';

class CityCountryText extends StatelessWidget {
  final String cityName;
  final String countryName;

  const CityCountryText({
    super.key,
    required this.cityName,
    required this.countryName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$cityName, $countryName',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }
}
