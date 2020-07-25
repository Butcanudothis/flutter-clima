import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'dc262ee26dc83724f7b69e70df13ef34';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;
  void getGeolocation() async {
    Location obj = Location();
    await obj.getCurrentLocation();
    lon = obj.longitude;
    lat = obj.latitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    //  print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);
      var decodedData = jsonDecode(data);
      double temp = decodedData['main']['temp'];
      print(temp);
      int condition = decodedData['weather'][0]['id'];
      print(condition);
      String cityName = decodedData['name'];
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
