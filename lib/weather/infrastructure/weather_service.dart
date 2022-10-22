import 'package:example/weather/domain/weather.dart';
import 'dart:math';

class WeatherService {
  Weather fetchWeather() {
    return Weather(
      location: "Karabük",
      degree: Random().nextInt(35).toDouble(),
    );
  }
}
