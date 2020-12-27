

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forcast_model.dart';
import 'package:weather_app/ui/forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot,BuildContext context)
{ 
  var forecastList = snapshot.data.daily;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("7-day Weather Forcast",
          style: TextStyle(
            fontSize:14,
            color:Colors.black87,
          ),),
          Container(
            height:170,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            child:ListView.separated(
            separatorBuilder: (context,index)=>SizedBox(width: 8), 
            itemCount: forecastList.length,
            itemBuilder: (context,index)=> ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width/2.7,
                height:160,
                child:forecastCard(snapshot,index),
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff9661C3),Colors.white],
                  begin:Alignment.topLeft,end:Alignment.topRight)),
              )
            )  )

          ),
        ],
    );
}