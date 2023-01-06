import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/Bloc_Oserver.dart';
import 'package:weather_app/bloc/SettingBloc.dart';
import 'package:weather_app/bloc/ThemeBloc.dart';
import 'package:weather_app/bloc/WeatherBloc.dart';
import 'package:weather_app/repository/WeatherRepository.dart';

import 'package:weather_app/screens/WeatherScreen.dart';

void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository();
// nhiều bloc, child là đối tượng bị ảnh hưởng
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      BlocProvider<SettingBloc>(create: (context) => SettingBloc()),
    ],
    child: Weather_App(weatherRepository: weatherRepository),
  ));
}

class Weather_App extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const Weather_App({required this.weatherRepository, super.key})
      : assert(weatherRepository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: WeatherScreen(),
      ),
    );
  }
}
