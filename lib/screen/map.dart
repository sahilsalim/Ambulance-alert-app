import 'package:ambulance_alert_app/util/config.dart';
import 'package:ambulance_alert_app/util/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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

  bool isSwitched = true;
  var textValue = ' ON';
  bool notify = false;
  void toggleSwitch(bool value) {
    if (isSwitched == true) {
      setState(() {
        isSwitched = false;
        textValue = ' OFF';
      });
    } else {
      setState(() {
        isSwitched = true;
        textValue = ' ON';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Sanskar Dixit'),
              accountEmail: Text('(+91)980 723 4988 '),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(
                Icons.home_filled,
                color: Colors.white,
              ),
              title: Text('Home'),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
          // IconButton(
          //     onPressed: () {
          //       Drawer()
          //     },
          //     icon: FaIcon(
          //       Icons.menu,
          //       color: Colors.white,
          //     )),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$textValue DUTY',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: toggleSwitch,
                  activeColor: Colors.red.shade400,
                  activeTrackColor: Colors.redAccent.shade100,
                ),
              ],
            ),
          ),

          Spacer(),
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                Icons.notifications_active,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.animateCamera(
              CameraUpdate.newCameraPosition(_inittialCameraPosition));
        },
        child: FaIcon(Icons.my_location),
      ),
    );
  }
}
