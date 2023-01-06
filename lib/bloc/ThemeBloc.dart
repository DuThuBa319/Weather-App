import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/events/ThemeEvent.dart';
import 'package:weather_app/model/WeatherInfo.dart';
import 'package:weather_app/states/ThemeStates.dart';
import 'package:flutter/material.dart';

class ThemeBloc extends Bloc<ThemeEvents, ThemeStates> {
  ThemeBloc()
      : super(ThemeStates(
            backgroundColor: Colors.lightBlue, textColor: Colors.white)) {
    on<ThemeEvents>(((event, emit) {
      if (event is ThemeEventWeatherChanges) {
        String con = event.weatherCondition;
        switch (con) {
          case 'Clear':
            emit(ThemeStates(
                backgroundColor: Colors.yellow, textColor: Colors.black));
            break;
          case 'Clouds':
            emit(ThemeStates(
                backgroundColor: Colors.lightBlue, textColor: Colors.white));
            break;
          case 'Rain':
            emit(ThemeStates(
                backgroundColor: Color.fromARGB(255, 21, 33, 103),
                textColor: Colors.white));
            break;
          case 'Drizzle':
            emit(ThemeStates(
                backgroundColor: Color.fromARGB(255, 19, 53, 241),
                textColor: Colors.white));
            break;
          case 'Thunderstorm':
            emit(ThemeStates(
                backgroundColor: Colors.deepPurple, textColor: Colors.white));
            break;
          case 'Snow':
            emit(ThemeStates(
                backgroundColor: Colors.lightBlue, textColor: Colors.white));
            break;
          default:
            emit(ThemeStates(
                backgroundColor: Colors.grey, textColor: Colors.black));
            break;
        }
      }
    }));
  }
}
