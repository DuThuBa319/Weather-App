import 'package:equatable/equatable.dart';
import 'package:weather_app/model/WeatherInfo.dart';

abstract class ThemeEvents extends Equatable {
  const ThemeEvents();
}

class ThemeEventWeatherChanges extends ThemeEvents {
  final String weatherCondition;
  const ThemeEventWeatherChanges({required this.weatherCondition})
      : assert(weatherCondition != null);
  @override
  List<Object?> get props => [weatherCondition];
}
