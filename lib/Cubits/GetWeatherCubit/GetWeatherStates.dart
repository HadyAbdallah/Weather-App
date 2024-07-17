import '../../Model/WeatherData.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherData weather;

  WeatherLoadedState({required this.weather});
}

class WeatherFailurState extends WeatherState {
  final String messge;

  WeatherFailurState({required this.messge});
}
