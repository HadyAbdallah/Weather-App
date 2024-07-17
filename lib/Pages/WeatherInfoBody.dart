import 'package:flutter/material.dart';
import 'package:weather_app/Model/WeatherData.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherData});
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          weatherData.getThemeColor(),
          weatherData.getThemeColor()[300]!,
          weatherData.getThemeColor()[100]!
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(
          flex: 3,
        ),
        Text(
          weatherData.cityName,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text(
          'Updated at: ${weatherData.date.hour.toString()}:${weatherData.date.minute.toString()}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(weatherData.getImage()),
            Text(
              '${weatherData.avgTemp.toInt()}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text('MaxTemp: ${weatherData.maxTemp.toInt()}'),
                Text('Mintemp: ${weatherData.minTemp.toInt()}'),
              ],
            )
          ],
        ),
        Spacer(),
        Text(
          weatherData.weatherStateName,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Spacer(
          flex: 5,
        ),
      ]),
    );
  }
}
