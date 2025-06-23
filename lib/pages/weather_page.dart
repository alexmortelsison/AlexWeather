import 'package:alexweather/components/main_card.dart';
import 'package:alexweather/models/weather.dart';
import 'package:alexweather/services/weather_service.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> weatherFuture;
  final weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    weatherFuture = weatherService.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Alex Weather"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.blue.shade200],
          ),
        ),
        child: Column(
          children: [
            FutureBuilder(
              future: weatherFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator.adaptive());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error:${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  final weather = snapshot.data;
                  return MainCard(
                    cityName: weather!.cityName,
                    temperature: "${weather.temperature}",
                    weatherIcon: weather.weatherIconPath,
                    weatherDescription: weather.weatherDescription,
                  );
                } else {
                  return Center(
                    child: Text("No data available."),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
