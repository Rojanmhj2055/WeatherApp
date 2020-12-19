import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/util/forcast_util.dart';
class Network {
   
  Future<WeatherForecastModel>  getWeatherForecast({String cityName}) async
  {
    var url = Util.url;
    var appId = Util.appId;
    //change to metrics or imperial
    var finalUrl = url + "?q="+cityName+"&appid="+appId+"&units=imperial";
    final response = await get(Uri.encodeFull(finalUrl));
    if(response.statusCode==200){
          //we get the actual mapped model (dart object)
        return WeatherForecastModel.fromJson(json.decode(response.body));
    }else{
        throw Exception("Error from response!!");
    }

   
  }
}