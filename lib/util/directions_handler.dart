import 'package:ambulance_alert_app/main.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../file/hospitals.dart';
import '../requests/mapbox_request.dart';

Future<Map> getDirectionAPIResponse(LatLng currentLatLng, int index) async {
  final response = await getCyclingRoutesUsingMapbox(
      currentLatLng,
      LatLng(double.parse(hospitals[index]['coordinates']['latitude']),
          double.parse(hospitals[index]['coordinates']['longitude'])));
  Map geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];

  Map modifiedResponse = {
    "geometry": geometry,
    "duration": duration,
    "distance": distance,
  };
  return modifiedResponse;
}

void saveDirectionAPIResponse(int index, String response) {
  sharedPreferences.setString('hospitals--$index', response);
}
