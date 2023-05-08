import 'package:ambulance_alert_app/main.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

LatLng getLatLngFromSharedPrefs() {
  return LatLng(sharedPreferences.getDouble('latitude')!,
      sharedPreferences.getDouble('longitude')!);
}
