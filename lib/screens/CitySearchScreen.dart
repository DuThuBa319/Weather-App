import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _citySearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Enter your city",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: _citySearch,
                    decoration: InputDecoration(
                        labelText: 'Enter a city',
                        hintText: 'Ex: ha noi, dallas, seoul'),
                  )),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context, _citySearch.text);
                },
                icon: Icon(Icons.search)),
          ],
        ));
  }
}
