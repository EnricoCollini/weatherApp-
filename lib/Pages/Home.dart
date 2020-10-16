import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temperature = 18.0;
  var tempo = "sunny";

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Florence Weather App"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/florence.jpg"),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 90.0,
              color: Colors.grey[700],
            ),
            Text(
              "Name",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Florence",
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Current Temperature",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              temperature.round().toString() + "°",
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Weather: ",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  tempo,
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: IconButton(
                icon: Icon(Icons.update, size: 40,),
                color: Colors.amber,
                tooltip: 'Increase volume by 10',
                onPressed: getData,
              ),
            )
          ],
        ),
      ),
    );
  }

  void getData() async {
    String the_url =
        "http://api.openweathermap.org/data/2.5/weather?id=3176959&appid=" +
            getKey();
    Response response = await get(the_url);
    Map data = jsonDecode(response.body);
    temperature = data["main"]["temp"] - 275.0;
    tempo = data["main"]["temp"];
  }
}
