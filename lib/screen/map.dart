import 'package:ambulance_alert_app/util/config.dart';
import 'package:ambulance_alert_app/util/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  LatLng latlng = getLatLngFromSharedPrefs();
  late CameraPosition _inittialCameraPosition;
  late MapboxMapController controller;

  @override
  void initState() {
    super.initState();
    _inittialCameraPosition = CameraPosition(target: latlng, zoom: 15);
  }

  _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;
  }

  _onStyleLoadedCallBack() async {}

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height:MediaQuery.of(context).size.height * 0.8,
            child: MapboxMap(
              initialCameraPosition: _inittialCameraPosition,
              accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
              onMapCreated: _onMapCreated,
              onStyleLoadedCallback: _onStyleLoadedCallBack,
              myLocationEnabled: true,
              myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
              minMaxZoomPreference: const MinMaxZoomPreference(14, 17),
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.animateCamera(
            CameraUpdate.newCameraPosition(_inittialCameraPosition));
      }
      ,
      child: FaIcon(Icons.my_location),
      ),
    );
  }
}
