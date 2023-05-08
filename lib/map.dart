import 'package:ambulance_alert_app/util/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Mapbox extends StatefulWidget {
  const Mapbox({super.key});

  @override
  State<Mapbox> createState() => _MapboxState();
}

class _MapboxState extends State<Mapbox> {
  LatLng latlng = getLatLngFromSharedPrefs();
  late CameraPosition _inittialCameraPosition;
  late MapboxMapController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('${latlng.latitude},${latlng.longitude}'),
      )),
    );
  }
}
