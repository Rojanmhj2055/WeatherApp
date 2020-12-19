import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/network/network.dart';
class WeatherApp extends StatefulWidget{
  @override 
  _WeatherAppState createState()=>_WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp>{
  Future<WeatherForecastModel> forcastObject;
  String _cityName = "Kathmandu";
  @override
  void initState() {

    super.initState();
    forcastObject = Network().getWeatherForecast(cityName:_cityName);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text("Weather App"),
        
      ),
    );
  }
}