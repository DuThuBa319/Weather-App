// To parse this JSON data, do
//
//     final weatherProfiles = weatherProfilesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WeatherProfiles weatherProfilesFromJson(String str) =>
    WeatherProfiles.fromJson(json.decode(str));

String weatherProfilesToJson(WeatherProfiles data) =>
    json.encode(data.toJson());

class WeatherProfiles {
  WeatherProfiles({
    required this.weather,
    required this.main,
    required this.sys,
    required this.name,
  });

  List<Weather> weather;
  Main main;
  Sys sys;
  String name;

  factory WeatherProfiles.fromJson(Map<String, dynamic> json) =>
      WeatherProfiles(
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        sys: Sys.fromJson(json["sys"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "sys": sys.toJson(),
        "name": name,
      };
}

class Main {
  Main({
    required this.temp,
    required this.humidity,
  });

  double temp;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "humidity": humidity,
      };
}

class Sys {
  Sys({
    required this.country,
  });

  String country;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
      };
}

class Weather {
  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });

  String main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "description": description,
        "icon": icon,
      };
}
