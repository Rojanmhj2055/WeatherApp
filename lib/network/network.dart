import 'package:http/http.dart';
// import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/util/forcast_util.dart';
// import 'package:opencage_geocoder/opencage_geocoder.dart';
 
class Network {
   
  Future<WeatherForecastModel>  getWeatherForecast( Geocode snapshot) async
  {
    var longitude = snapshot.features[0].geometry.coordinates[0];
    var latitude = snapshot.features[0].geometry.coordinates[1];

    
   
     var url = Util.url;
     
     var appId = Util.appId;
    // change to metrics or imperial
     var finalUrl = url+'?lat=$latitude&lon=$longitude&exclude=minutely&units=metric&appid='+appId;
     print(finalUrl);
    final response = await get(Uri.encodeFull(finalUrl));
    if(response.statusCode==200){
      
        return WeatherForecastModel.fromJson(json.decode(response.body));
         
     }else{
       print("Error");
         throw Exception("Error from response!!");
     }
   
   
  }

  Future<Geocode> getGeocode({String cityName}) async{
    var url = Util.geoCodeUrl;
    var key = Util.geocodeKey;
    var finalUrl = url+cityName+"&key="+key+"&limit=1&no_annotations=1";
    final response = await get(Uri.encodeFull(finalUrl));
    if(response.statusCode == 200)
    {
      return Geocode.fromJson(json.decode(response.body));

    } else{
      throw Exception("Error from geoCode Response");
    }
  }
}