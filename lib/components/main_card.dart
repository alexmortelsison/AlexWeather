import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recase/recase.dart';

class MainCard extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String weatherIcon;
  final String weatherDescription;
  const MainCard({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.weatherIcon,
    required this.weatherDescription,
  });

  String get capitalizedWord => weatherDescription.titleCase;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "$temperature°C",
          style: TextStyle(fontSize: 20),
        ),
        Lottie.asset(weatherIcon),
        Text(
          capitalizedWord,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
