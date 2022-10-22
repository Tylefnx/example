import 'package:example/weather/domain/weather.dart';
import 'dart:math';

class WeatherService {
  Weather fetchWeather() {
    return Weather(
      location: "Istanbul",
      degree: Random().nextInt(35).toDouble(),
    );
  }
}
