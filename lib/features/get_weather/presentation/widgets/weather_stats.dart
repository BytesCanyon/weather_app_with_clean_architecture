import 'package:flutter/material.dart';

import 'weather_stat_item.dart';

class WeatherStats extends StatelessWidget {
  final String humidity;
  final String tempMax;
  final String tempMin;
  final String humidityImagePath;
  final String tempMinImagePath;
  final String tempMaxImagePath;

  const WeatherStats({
    super.key,
    required this.humidity,
    required this.tempMax,
    required this.tempMin,
    required this.humidityImagePath,
    required this.tempMinImagePath,
    required this.tempMaxImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherStatItem(
            iconPath: humidityImagePath,
            value: "$humidity%",
            label: "Humidity",
          ),
          WeatherStatItem(
            iconPath: tempMaxImagePath,
            value: "$tempMax%",
            label: "Temp Max",
          ),
          WeatherStatItem(
            iconPath: tempMinImagePath,
            value: "$tempMin%",
            label: "Temp Min",
          ),
        ],
      ),
    );
  }
}
