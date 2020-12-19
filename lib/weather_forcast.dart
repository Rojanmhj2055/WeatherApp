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
                      mid_view(snapshot),
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
                 onSubmitted:(value)=>{
                    
                 },
               ),
             );
           }

 
}