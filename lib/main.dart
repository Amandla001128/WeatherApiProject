import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(const WeatherApp());



class WeatherApp extends StatefulWidget{
  const WeatherApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherAppState createState() => _WeatherAppState();
}
class _WeatherAppState extends State<WeatherApp>{
int temperature = 0;
String location = 'New York';
int woeid = 2459115;
String weather = 'clear';

String searchApiUrl = 'https://www.metaweather.com/api/location/search/?query=';
String locationApiUrl = 'https://www.metaweather.com/api/location/';

  // ignore: non_constant_identifier_names
  get weather_state_name => null;
void fetchSearch( String input) async {
  var searchResult = await http.get(searchApiUrl + input);
  var result = json.decode(searchResult.body)[0];

  setState(() {
    location = result["title"];
    woeid = result["woeid"];
  });
}
void fetchLocation() async {
  var locationResult = await http.get(locationApiUrl + woeid.toString());
  var result = json.decode(locationResult.body);
  // ignore: non_constant_identifier_names
  var consolidate_weather = result["consolidate_weather"];
  var data = consolidate_weather[0];

  setState(() {
    temperature = data["the_temp"].round();
    weather = data[weather_state_name].replaceAll('','').toLowerCase();
  });
}
void onTextFeildSubmitted(String input){
  fetchSearch(input);
  fetchLocation();
}

  @override 
  Widget build(BuildContext context){
return MaterialApp(
  debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage('download.jpg') ),
            fit: BoxFit.cover,
        ),
      ),
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              column(
                children: <Widget>[
              Center(
              child: Text(
                '${temperature}0C',
                style: const TextStyle(color: Colors.white, fontSize: 60.0),
                 ),
                  ),
                  Center(
                   child: Text(
                    location,
                    style: const TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  ),
            ],
          ),
          Column(
            children: <Widget> [
              SizedBox(
                width: 300,
                child: TextField(
                  onSubmitted: (String input){
                    onTextFeildSubmitted(input);
                  },
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                  decoration: const InputDecoration(
                    hintText: 'search another location' ,
                    hintStyle:  TextStyle(color: Colors.white, fontSize: 18.0),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
              ),
            ],
            ),
            ],
        ),
        ),
        );
  }
  
  column({required List<Widget> children}) {}
}