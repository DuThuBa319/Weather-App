import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/WeatherInfo.dart';

var baseURL =
    'https://api.openweathermap.org/data/2.5/weather?appid=b5fd353727c0fe8c46534e6d05b11c58';
String url(String city, String urlUnit) =>
    '${baseURL}&q=${city}&units=${urlUnit}&lang=en';

// ví dụ: https://api.openweathermap.org/data/2.5/weather?appid=b5fd353727c0fe8c46534e6d05b11c58&q=hanoi&units=metric&lang=en
class WeatherRepository {
  Future<WeatherProfiles> fetchWeatherInfo(String city, String urlUnit) async {
    var response = await http.get(Uri.parse(url(city, urlUnit)));
    if (response.statusCode == 200) {
      var profile = WeatherProfiles.fromJson(jsonDecode(response.body));
      print(jsonEncode(profile));
      return profile;
      //return WeatherProfiles.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
