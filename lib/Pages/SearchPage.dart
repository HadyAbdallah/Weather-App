import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/GetWeatherCubit/GetWeatherCubit.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({
    super.key,
  });
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orange,
        title: Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (cityName) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWether(cityName: cityName);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25, horizontal: 18),
              label: Text('Search'),
              hintText: "Enter a City",
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    BlocProvider.of<GetWeatherCubit>(context)
                        .getWether(cityName: cityName!);
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
