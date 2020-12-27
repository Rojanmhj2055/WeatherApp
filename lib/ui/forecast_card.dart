import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/util/forcast_util.dart';



Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot,int index){

  var forecastList = snapshot.data.daily;
  var dayofWeek="";
  var fullDate = Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch( forecastList[index].dt*1000));
   dayofWeek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
        Text("$dayofWeek",)
        
    ],
  );


}