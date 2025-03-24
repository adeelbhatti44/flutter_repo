import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class worker
{
   String Location;
   // Constructor
   worker({required this.Location})
  {
    Location = Location;
  }


  String temp = "";
  String humidity = "";
  String air_speed = "";
  String description = "";
  String main = "";
  String icon = "";

  // method =
  Future<void> getdata() async
  {
  try{
    final url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$Location&appid=c443ce9e8d9747f49f72fd01c68a86d5");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);

    // Getting Temp,Humidity
    Map tempData = data['main'];
    double getHumidity = tempData['humidity'];
    double getTemp = tempData['temp'] - 273.15;


    // Getting air_speed
    Map wind = data['wind'];
    double getairSpeed = wind['speed'] /  0.277778;


    // Getting Description
    List weatherData = data['weather'];
    Map weatherMainData = weatherData[0];
    String getmainDes = weatherMainData['main'];
    String getDesc = weatherMainData['description'];
     icon = weatherMainData['icon'].toString();


    //Assigning Values
    temp = getTemp.toString();
    humidity = getHumidity.toString();
    air_speed = getairSpeed.toString();
    description = getDesc;
    main = getmainDes;
    icon = weatherMainData['icon'].toString();

  }catch(e)
    {
      temp = "can't find data";
      humidity = "can't find data";
      air_speed = "can't find data";
      description = "can't find data";
      main = "can't find data";
      icon = "03n";
    }

 }

 }
