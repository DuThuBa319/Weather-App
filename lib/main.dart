import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/Bloc_Oserver.dart';
import 'package:weather_app/blocs/SettingBloc.dart';
import 'package:weather_app/blocs/ThemeBloc.dart';
import 'package:weather_app/blocs/WeatherBloc.dart';
import 'package:weather_app/repository/WeatherRepository.dart';

import 'package:weather_app/src/resource/WeatherScreen.dart';

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
