import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/GetWeatherCubit/GetWeatherCubit.dart';
import 'package:weather_app/Cubits/GetWeatherCubit/GetWeatherStates.dart';
import 'package:weather_app/Pages/NoWeatherBody.dart';
import 'package:weather_app/Pages/SearchPage.dart';
import 'package:weather_app/Pages/WeatherInfoBody.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
        title: Text("Weather App"),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
                weatherData:
                    BlocProvider.of<GetWeatherCubit>(context).weather!);
          } else {
            return const Text("OPPS, There was an error");
          }
        },
      ),
    );
  }
}
