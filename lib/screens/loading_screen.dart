import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'location.dart';

const apiKey = 'dc262ee26dc83724f7b69e70df13ef34';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;
  void getGeolocationData() async {
    Location obj = Location();
    await obj.getCurrentLocation();
    lon = obj.longitude;
    lat = obj.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGeolocationData();
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
