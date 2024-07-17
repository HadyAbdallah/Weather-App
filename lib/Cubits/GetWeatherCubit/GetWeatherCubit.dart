import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/WeatherData.dart';
import '../../Services/WeatherService.dart';
import 'GetWeatherStates.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherData? weather;
  getWether({required String cityName}) async {
    try {
      WeatherService service = WeatherService(Dio());
      weather = await service.getWeather(cityName: cityName);
      emit(WeatherLoadedState(weather: weather!));
    } catch (e) {
      emit(WeatherFailurState(messge: e.toString()));
    }
  }
}
