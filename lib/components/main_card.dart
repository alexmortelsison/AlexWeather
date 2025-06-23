import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cityName),
        Text("$temperature°C"),
        Lottie.asset(weatherIcon),
        Text(weatherDescription),
      ],
    );
  }
}
