import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:weather_app/bloc/SettingBloc.dart';
import 'package:weather_app/bloc/WeatherBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/events/ThemeEvent.dart';
import 'package:weather_app/events/WeatherEvents.dart';
import 'package:weather_app/screens/TemperatureWidget.dart';
import 'package:weather_app/screens/CitySearchScreen.dart';
import 'package:weather_app/screens/SettingScreen.dart';
import 'package:weather_app/states/ThemeStates.dart';
import '../bloc/ThemeBloc.dart';
import '../../states/WeatherStates.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenStates();
}

class _WeatherScreenStates extends State<WeatherScreen> {
  late Completer<void> _completer;
  var typedCity;
  @override
  void initState() {
    super.initState();
    _completer = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Weather Screen',
            style: TextStyle(),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                //Navigate to CitySearchScreen
                typedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CitySearchScreen()),
                );
                if (typedCity != null) {
                  BlocProvider.of<WeatherBloc>(context).add(
                      WeatherEventRequested(
                          city: typedCity,
                          urlUnit: BlocProvider.of<SettingBloc>(context)
                              .state
                              .urlUnit));
                }
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
                onPressed: () async {
                  var changed = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingScreen()));
                  if (changed == true) {
                    BlocProvider.of<WeatherBloc>(context).add(
                        WeatherEventRequested(
                            city: typedCity,
                            urlUnit: BlocProvider.of<SettingBloc>(context)
                                .state
                                .urlUnit));
                  }
                },
                icon: Icon(Icons.settings)),
          ],
        ),
        body: Center(
            child: BlocConsumer<WeatherBloc, WeatherStates>(
          listener: (context, State) {
            if (State is WeatherStateSuccess) {
              var temp1 = State.weatherProfiles.weather[0].main;
              BlocProvider.of<ThemeBloc>(context)
                  .add(ThemeEventWeatherChanges(weatherCondition: temp1));
              // khong complete thì lần enter city tiếp theo sẽ throw exception
              _completer.complete();
              _completer = Completer();
            }
          },
          builder: (context, weatherState) {
            // loading
            if (weatherState is WeatherStateLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            // failure
            else if (weatherState is WeatherStateFailure) {
              return const Center(
                  child: Text(
                'Not found information of this city',
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ));
            }
            // Succcess
            else if (weatherState is WeatherStateSuccess) {
              return BlocBuilder<ThemeBloc, ThemeStates>(
                  builder: (context, themeState) => RefreshIndicator(
                        onRefresh: () {
                          BlocProvider.of<WeatherBloc>(context).add(
                              WeatherEventRefresh(
                                  city: weatherState.weatherProfiles.name,
                                  urlUnit: BlocProvider.of<SettingBloc>(context)
                                      .state
                                      .urlUnit));
                          // không complete thì cứ xoay xoay không ra kết quả
                          return _completer.future;
                        },
                        child: Container(
                            color: themeState.backgroundColor,
                            child: ListView(
                              children: [
                                TemperatureWidget(
                                    weatherProfiles:
                                        weatherState.weatherProfiles),
                              ],
                            )),
                      ));
            }
            return const Center(
              child: Text(
                'select a location first !',
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        )));
  }
}
