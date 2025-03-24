import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  // worker instance = worker(Longitude: '74.358749', Latitude: '31.520370');

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String temp = "";
  String hum = "";
  String air_speed = "";
  String des = "";
  String main = "";
  String icon = "";



  void startApp() async {
    worker instance = worker(Location: 'kyoto');
    await instance.getdata();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;


    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
       "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
      });
    });


    // print(instance.air_speed);
    // print(instance.description);
    // print(instance.temp);
  }

  @override
  void initState() {
    // TODO: implement initState
     startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/mlogo.png'),
              width: 250,
              height: 250,
            ),
            Text(
              "Weather App",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 33,
                    fontWeight: FontWeight.w600,
                  color: Colors.white70
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made by Adeel",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 20,
                fontWeight: FontWeight.w400,
                  color: Colors.white60
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
