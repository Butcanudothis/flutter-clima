import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getGeolocation() async {
    Location obj = Location();
    await obj.getCurrentLocation();
    print(obj.longitude);
    print(obj.latitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=439d4b804bc8187953eb36d2a8c26a02');
    //  print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var temp = jsonDecode(data)['main']['temp'];
      print(temp);
      var weatherid = jsonDecode(data)['weather'][0]['id'];
      print(weatherid);
      var cityName = jsonDecode(data)['name'];
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGeolocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}

//body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            //Get the current location
//            getGeolocation();
//          },
//          child: Text('Get Location'),
//        ),
//      ),
