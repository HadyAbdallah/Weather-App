import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Cubits/GetWeatherCubit/GetWeatherCubit.dart';
import 'package:weather_app/Cubits/GetWeatherCubit/GetWeatherStates.dart';
import 'Pages/HomePage.dart';
import 'Providers/WeatherProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch:
                      BlocProvider.of<GetWeatherCubit>(context).weather == null
                          ? Colors.blue
                          : BlocProvider.of<GetWeatherCubit>(context)
                              .weather!
                              .getThemeColor()),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}
