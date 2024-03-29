import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/SettingBloc.dart';
import 'package:weather_app/bloc/WeatherBloc.dart';
import 'package:weather_app/events/SettingEvents.dart';
import 'package:weather_app/screens/WeatherScreen.dart';

import '../../events/WeatherEvents.dart';
import '../../states/SettingStates.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingBloc, SettingStates>(
            builder: (context, settingState) {
              return ListTile(
                title: Text('Temperature Unit'),
                isThreeLine: true,
                subtitle: Text(settingState.tempUnit == TemperatureUnit.celsius
                    ? 'Celsius'
                    : 'Fahrenheit'),
                trailing: Switch(
                    value: settingState.tempUnit == TemperatureUnit.celsius,
                    onChanged: (_) {
                      BlocProvider.of<SettingBloc>(context)
                          .add(SettingEventToggleUnit());
                      Navigator.pop(context, true);
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
