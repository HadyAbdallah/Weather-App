import 'package:flutter/material.dart';

import '../Model/WeatherData.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherData? _weatherData;
  String? cityName;
  set weatherData(WeatherData? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherData? get weatherData => _weatherData;
}
