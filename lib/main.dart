import 'package:flutter/material.dart';
import 'package:weather_app/Activity/home.dart';
import 'package:weather_app/Activity/loading.dart';
import 'package:weather_app/Activity/location.dart';

void main(){
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
     "/" : (context) =>  loading(),
    "/home" : (context) => home(),
    // "/location" : (context) =>  location(),
  },
));
}