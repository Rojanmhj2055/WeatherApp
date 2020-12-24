import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/network/network.dart';
// import 'package:weather_app/ui/mid_view.dart';
class WeatherApp extends StatefulWidget{
  @override 
  _WeatherAppState createState()=>_WeatherAppState();
}
//sdfasdfsadfsd
class _WeatherAppState extends State<WeatherApp>{
  Future<WeatherForecastModel> forcastObject;
  Future<Geocode>geocodeObject;
  String _cityName = "Chicago";
  @override
  void initState() {

    super.initState();
    geocodeObject = geocodeForcast(cityName:_cityName);
    geocodeObject.then((res){
      print(res.features[0].geometry.coordinates[0]);
      forcastObject = weatherForecast(res);
      // print(forcastObject.then((value) => value.alerts[4]));
       forcastObject.then((value){
      print(_cityName);
      print(value.current.temp);

    });
    });
   
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
                 print(snapshot.data.current.dt);
                 return Text("Working");
                  // return Column(
                  //   children: <Widget>[
                  //     // mid_view(snapshot,"Kathmandu"),
                  //   ]
                  // );
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
                    setState((){
                      _cityName = value;
                      geocodeObject = geocodeForcast(cityName:_cityName);
                      geocodeObject.then((res){
                      forcastObject = weatherForecast(res);
                      });
                      
                    })
                 },
               ),
             );
           }

           Future<WeatherForecastModel> weatherForecast(Geocode snapshot) => new Network().getWeatherForecast(snapshot);
          Future<Geocode> geocodeForcast({String cityName}) => new Network().getGeocode(cityName:_cityName);

 
}