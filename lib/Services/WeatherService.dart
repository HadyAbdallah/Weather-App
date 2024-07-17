import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
import 'package:weather_app/Model/WeatherData.dart';

class WeatherService {
  final Dio dio;
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '6afca698a55b41ee9fb154228233008';

  WeatherService(this.dio);
  Future<WeatherData> getWeather({required String cityName}) async {
    WeatherData? weatherData;
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      // Uri url =
      //     Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      // http.Response responses = await http.get(url);
      // Map<String, dynamic> jsonData = jsonDecode(responses.body);

      weatherData = WeatherData.fromJson(response.data);
      return weatherData;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          'OOPS, There is was an errorm, try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('OOPS, There is was an errorm, try later');
    }
  }
}
