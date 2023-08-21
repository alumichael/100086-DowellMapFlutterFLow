// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<LatLng>> getLocatCordFromString(
    List<String>? stringCordinate) async {
  // convert a string of two location cordinate to LatLng

  List<LatLng> latlngs = [];
  if (stringCordinate != null) {
    for (int i = 0; i < stringCordinate.length; i++) {
      List<String> locationList = stringCordinate[i].split(",");
      double lat = double.parse(locationList[0]);
      double lng = double.parse(locationList[1]);
      latlngs.add(LatLng(lat, lng));
    }
  }

  return latlngs;
}
