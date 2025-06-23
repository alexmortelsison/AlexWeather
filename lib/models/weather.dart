import 'package:flutter/material.dart';

class Weather {
  final String cityName;
  final String weatherDescription;
  final int temperature;
  final int humidity;
  final int pressure;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.weatherDescription,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      weatherDescription: json["weather"][0]["description"],
      temperature: (json["main"]["temp"] as num).round(),
      humidity: json["main"]["humidity"],
      pressure: json["main"]["pressure"],
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
    );
  }

  String get conditionKeyword {
    final desc = weatherDescription.toLowerCase();
    if (desc.contains("rain")) return "rainy";
    if (desc.contains("thunder") || desc.contains("storm"))
      return "thunderstorm";
    if (desc.contains("cloud")) return "cloudy";
    return "sunny";
  }

  String get weatherIconPath {
    switch (conditionKeyword) {
      case "rainy":
        return "assets/rainy.json";
      case "thunderstorm":
        return "assets/thunderstorm.json";
      case "cloudy":
        return "assets/cloudy.json";
      default:
        return "assets/sunny.json";
    }
  }
}
