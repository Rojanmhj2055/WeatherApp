import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forcast_model.dart';
/*
The API Is not working right now 
must use lat lon one not city one
*/ 
Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot)
{
    var forcastList =snapshot.data.list;
    var cityname = snapshot.data.city.name;
        var country = snapshot.data.city.country;
                Container midview = Container(
                  child:Padding(padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(cityname +" "+ country
                        ,style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize:18,
                          color:Colors.black87,
                        ),),
          ],
        ),
         )
    ) ;
  return midview;
}