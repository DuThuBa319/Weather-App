import 'package:equatable/equatable.dart';
import 'package:weather_app/model/WeatherInfo.dart';

abstract class WeatherStates extends Equatable {
  const WeatherStates();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherStateInitial extends WeatherStates {}

class WeatherStateLoading extends WeatherStates {}

class WeatherStateSuccess extends WeatherStates {
  const WeatherStateSuccess({required this.weatherProfiles})
      : assert(weatherProfiles != null);
  final WeatherProfiles weatherProfiles;
  @override
  // TODO: implement props
  List<Object?> get props => [weatherProfiles];
}

class WeatherStateFailure extends WeatherStates {}
