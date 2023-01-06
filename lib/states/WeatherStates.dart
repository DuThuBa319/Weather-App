import 'package:equatable/equatable.dart';
import 'package:weather_app/model/WeatherInfo.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateSuccess extends WeatherState {
  const WeatherStateSuccess({required this.weatherProfiles})
      : assert(weatherProfiles != null);
  final WeatherProfiles weatherProfiles;
  @override
  // TODO: implement props
  List<Object?> get props => [weatherProfiles];
}

class WeatherStateFailure extends WeatherState {}
