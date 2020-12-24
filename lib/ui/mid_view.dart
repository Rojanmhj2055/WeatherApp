import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/util/forcast_util.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/util/convertIcon.dart';
Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot)
{
    var currentForcast = snapshot.data.current;
    
    var location = snapshot.data.timezone;
     var millisecondsSinceEpoch =new DateTime.fromMillisecondsSinceEpoch( snapshot.data.current.dt*1000);


       Container midview = Container(
              child:Padding(padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(location
                                        ,style: TextStyle(
                                          fontWeight:FontWeight.bold,
                                          fontSize:18,
                                          color:Colors.black87,
                                        ),),
                                        Text("${Util.getFormattedDate(millisecondsSinceEpoch)}",
                        style:TextStyle(
                        fontSize:15,
                        color:Colors.black87,),),

                    SizedBox(height:10),
                    Padding(padding:EdgeInsets.all(15.0) ,
                    child:getWeatherIcon(id:currentForcast.weather[0].id,color:Colors.black54,size:100),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal:12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(8.0),
                             child: Text("${currentForcast.temp.toStringAsFixed(0)}°C",
                              style: TextStyle(
                                fontSize:30,
                                fontWeight:FontWeight.bold,
                              ) ,),
                          ),
                              Text("${currentForcast.weather[0].description.toUpperCase()}",
                              style:TextStyle(
                                fontSize:14,
                              )),
                              
                        ],
                      ),),
                      Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                  Padding(padding:const EdgeInsets.all(8.0) ,  
                                  child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:<Widget>[
                                          Text("${currentForcast.windSpeed.toStringAsFixed(2)}m/s",
                                          style:TextStyle(
                                            fontSize:14,
                                          ) ,
                                          ),
                                          BoxedIcon(WeatherIcons.wind_beaufort_1),
                                      ]
                                    ),
                                  ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:<Widget>[ 
                                        Padding(padding: EdgeInsets.all(8.0),
                                        child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:<Widget>[
                                          Text("${currentForcast.humidity.toStringAsFixed(2)}%",
                                          style:TextStyle(
                                            fontSize:14,
                                          ) ,
                                          ),
                                          BoxedIcon(WeatherIcons.humidity),
                                      ]
                                    ),),]
                                    ),
                                    
                                  ]
                              ),),
                    
          ],
        
         )
              )
    );
  return midview;
}