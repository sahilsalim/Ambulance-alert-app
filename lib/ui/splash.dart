import 'package:ambulance_alert_app/main.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_alert_app/map.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();
  }

  void initializeLocationAndSave() async {
    Location location = Location();
    bool? serviceEnabled;
    PermissionStatus? permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    LocationData locationData = await location.getLocation();
    LatLng currentLatLng =
        LatLng(locationData.latitude!, locationData.longitude!);

    sharedPreferences.setDouble('latitude', locationData.latitude!);
        sharedPreferences.setDouble('longitude', locationData.longitude!);

    
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const Mapbox()),
            (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: Center(
          child: Image.asset('assets/AmbulanceAlert.png'),
        ));
  }
}
