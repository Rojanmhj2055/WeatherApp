
import "dart:async";
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/network/network.dart';
import 'package:weather_app/ui/bottom_view.dart';
import 'package:weather_app/ui/mid_view.dart';
import 'package:geolocator/geolocator.dart';

class WeatherApp extends StatefulWidget{
  @override 
  _WeatherAppState createState()=>_WeatherAppState();
}
//sdfasdfsadfsd
class _WeatherAppState extends State<WeatherApp>{
  Future<WeatherForecastModel> forcastObject;
  List<double> lst =  List<double>(2);
  Future<Geocode>geocodeObject;
  Future<Position>location;
  String _cityName = "Chicago";

  @override
  void initState() {

    super.initState();
    location = getCurrentLocation();
    location.then((value){
      setState(() {

       lst[0]=value.longitude;
       lst[1]=(value.latitude);
       print(lst);
      forcastObject = weatherForecast(null,lst);
      });
      
    }).catchError((error){
      print(error);
      geocodeObject = geocodeForcast(cityName:_cityName);
      geocodeObject.then((value){
        setState(() {
          forcastObject = weatherForecast(value, lst);
        });
        
      });

    });
      
  }
  
  Future<Position> getCurrentLocation () async{

    var location = await Geolocator().getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
    return location;
  }
  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: ListView(
       children: <Widget>[
         textFieldView(),
         
         Container(
           //Future Builder is expectin WeatherForecast Model
           //isn't necessary to write
           child:FutureBuilder<WeatherForecastModel>(
             future: forcastObject,
             builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
               if(snapshot.hasData)
               {
              
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                      bottomView(snapshot, context),
                    ]
                  );
               }else{
                 return Container(
                   child: Center(
                     child:CircularProgressIndicator()),
                   );
               }
              
             },
             ),
         )
                ],
              ),
         
             );
           }
         
           Widget textFieldView() {
             return Container(
               child: TextField(
                 decoration:InputDecoration(
                   hintText: "Enter City Name",
                   prefixIcon: Icon(Icons.search),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0),),
                  contentPadding: EdgeInsets.all(8.5),
                 ),
                 onSubmitted:(value){
                   if(value.isNotEmpty){
                     _cityName = value;
                      geocodeObject =geocodeForcast(cityName :_cityName);
                      geocodeObject.then((value) {
                        setState(() {
                          forcastObject = weatherForecast(value, lst);
                        });
                      });
                   }
                 },
                                ),
                              );
              }
                 
                Future<WeatherForecastModel> weatherForecast(Geocode snapshot,List lst) => new Network().getWeatherForecast(snapshot,lst);
                Future<Geocode> geocodeForcast({String cityName}) => new Network().getGeocode(cityName:_cityName);
                
                  

 
}