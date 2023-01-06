import 'package:weather_app/blocs/SettingBloc.dart';
import 'package:weather_app/events/SettingEvents.dart';
import 'package:weather_app/events/WeatherEvents.dart';
import 'package:weather_app/model/WeatherInfo.dart';
import 'package:weather_app/repository/WeatherRepository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/states/SettingStates.dart';

import '../states/WeatherStates.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  // khoi tao WeatherBloc kem initialState sau do kiem tra cac su kien de mapEventToState
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository})
      : super(WeatherStateInitial()) {
    // mapEventToState
    on<WeatherEvents>(((event, emit) async {
      if (event is WeatherEventRequested) {
        emit(WeatherStateLoading());
        try {
          final WeatherProfiles weatherProfiles = await this
              .weatherRepository
              .fetchWeatherInfo(event.city, event.urlUnit);

          emit(WeatherStateSuccess(weatherProfiles: weatherProfiles));
        } catch (exception) {
          emit(WeatherStateFailure());
        }
      } else if (event is WeatherEventRefresh) {
        try {
          final WeatherProfiles weatherProfiles = await this
              .weatherRepository
              .fetchWeatherInfo(event.city, event.urlUnit);
          emit(WeatherStateSuccess(weatherProfiles: weatherProfiles));
        } catch (exception) {
          emit(WeatherStateFailure());
        }
      }
    }));
  }
}
