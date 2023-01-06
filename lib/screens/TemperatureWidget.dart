import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/SettingBloc.dart';
import 'package:weather_app/model/WeatherInfo.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/states/SettingStates.dart';

import '../bloc/ThemeBloc.dart';
import '../states/ThemeStates.dart';

class TemperatureWidget extends StatelessWidget {
  TemperatureWidget({super.key, required this.weatherProfiles})
      : assert(weatherProfiles != null);
  final WeatherProfiles weatherProfiles;
  String currentDate = DateFormat("EE, dd/MM/yyyy").format(DateTime.now());
  String currentTime = DateFormat("hh:mm a").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Color textColor = BlocProvider.of<ThemeBloc>(context).state.textColor;
    SettingStates _settingState = BlocProvider.of<SettingBloc>(context).state;
    return DefaultTextStyle(
        style: TextStyle(color: textColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            DefaultTextStyle(
              style: TextStyle(fontSize: 14),
              child: Wrap(direction: Axis.vertical, spacing: 10, children: [
                Text('Date: ${currentDate}'),
                Text('City: ${weatherProfiles.name}'),
                Text('Country: ${weatherProfiles.sys.country}'),
                Text('Update Time: ${currentTime}'),
              ]),
            ),
            SizedBox(
              height: 50,
            ),
            DefaultTextStyle(
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image(
                        image: NetworkImage(
                            'http://openweathermap.org/img/wn/${weatherProfiles.weather[0].icon}@2x.png',
                            scale: 1),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Wrap(direction: Axis.vertical, spacing: 10, children: [
                      Text('Temperature: ${weatherProfiles.main.temp} ' +
                          (_settingState.tempUnit == TemperatureUnit.celsius
                              ? '°C'
                              : '°F')),
                      Text('Humidity: ${weatherProfiles.main.humidity}'),
                      Text(
                        'Weather Description: \n ${weatherProfiles.weather[0].description}',
                      )
                    ]),
                  ],
                ))
          ],
        ));
  }
}
