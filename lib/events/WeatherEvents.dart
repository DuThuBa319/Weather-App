import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvents extends Equatable {}

class WeatherEventRequested extends WeatherEvents {
  final String city;
  final String urlUnit;
  WeatherEventRequested({required this.city, required this.urlUnit})
      : assert(city != null),
        assert(urlUnit != null);
  @override
  List<Object> get props => [city];
}

class WeatherEventRefresh extends WeatherEvents {
  final String city;
  final String urlUnit;
  WeatherEventRefresh({required this.city, required this.urlUnit})
      : assert(city != null),
        assert(urlUnit != null);
  @override
  List<Object> get props => [city];
}
