import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'dc262ee26dc83724f7b69e70df13ef34';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getGeolocationData() async {
    Location obj = Location();
    await obj.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${obj.latitude}&lon=${obj.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGeolocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SpinKitPulse(
        color: Colors.cyan,
        size: 100.0,
      ),
    );
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
