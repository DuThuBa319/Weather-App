import 'package:weather_app/events/SettingEvents.dart';
import 'package:weather_app/model/WeatherInfo.dart';
import 'package:weather_app/repository/WeatherRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/SettingStates.dart';

class SettingBloc extends Bloc<SettingEvents, SettingStates> {
  SettingBloc()
      : super(SettingStates(
            tempUnit: TemperatureUnit.celsius, urlUnit: 'metric')) {
    on<SettingEvents>((event, emit) {
      if (event is SettingEventToggleUnit) {
        emit(
          SettingStates(
              tempUnit: state.tempUnit == TemperatureUnit.celsius
                  ? TemperatureUnit.fahrenheit
                  : TemperatureUnit.celsius,
              urlUnit: state.urlUnit == 'metric' ? 'imperial' : 'metric'),
        );
      }
    });
  }
}
