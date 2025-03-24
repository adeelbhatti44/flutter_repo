import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/Activity/loading.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("this is a init state");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("widget destroyed");
  }

  @override
  Widget build(BuildContext context) {

    var city_name = ["Lahore", "Karachi", "Sialkot", "Islamabad", "Rawalpindi"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    // Map info = ModalRoute.of(context).settings.arguments;
    // print(info?["temp_value"].toString().substring(0,2));
    String temp = ((info?['temp_value']).toString()).substring(0,2);
    String icon = info?["icon_value"];

    // print(info?["hum_value"].toString().substring(0,2));
    // print(info?["air_speed_value"].toString().substring(0,3));
    // print(info?["icon_Value"]);
    // print(((info?["hum_value"]).toString()).substring(0,12));


    return Scaffold(
      resizeToAvoidBottomInset: false,

      //APPBAR color change by gradient way

      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(0),
      //     child: GradientAppBar(
      //       gradient: LinearGradient(
      //         begin: Alignment.centerRight,
      //           end: Alignment.centerLeft,
      //           colors: [
      //             Colors.blue,
      //             Colors.lightBlue,
      //           ]),
      //     ),
      // ),

      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue,
          ),
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.lightBlue,
                ]),
          ),
          child: Column(
            children: [
              Container(
                //search wala container
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white70,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("search me");
                      },
                      child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.fromLTRB(2, 0, 7, 0)),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(7),
                      child: Row(
                        children: [
                          Image.network("https://openweathermap.org/img/wn/$icon@2x.png",
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              Text(
                                "Rainy",
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18,
                               ),
                                 ),
                              Text(
                                  "In Rawalpindi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '$temp',
                                style: TextStyle(
                                  fontSize: 100,
                                ),
                              ),
                              Text(
                                  "C",
                              style: TextStyle(
                                fontSize: 35,
                              ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.day_windy),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(
                              "20",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Text("km/h"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "22.2",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                          ),
                          Text("percent"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(35),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made By Adeel"),
                    Text("Data Provided By Openweathermap.org"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
