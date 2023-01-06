// import 'package:flutter/material.dart';
// import 'package:weather_app/model/WeatherInfo.dart';
// import 'package:weather_app/repository/WeatherRepository.dart';
// import 'dart:async';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<WeatherProfiles> _weather;
//   @override
//   void initState() {
//     super.initState();
//     _weather = fetchWeatherInfo('');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Weather',
//           style: TextStyle(
//               color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       drawer: Drawer(),
//       endDrawer: Drawer(),
//       body: Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                   child: FutureBuilder(
//                 future: _weather,
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   if (snapshot.hasData) {
//                     return Container(
//                       child: Column(
//                           children: [Text(snapshot.data.name.toString())]),
//                     );
//                   } else if (snapshot.hasError)
//                     return Container(child: Text('Not Found Data'));
//                   else {
//                     return Center(
//                         child: Container(
//                       child: CircularProgressIndicator(),
//                       width: 50,
//                       height: 50,
//                     ));
//                   }
//                 },
//               )),
//             ],
//           )),
//     );
//   }
// }
