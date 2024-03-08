// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'dart:core';
//import "package:latlong/latlong.dart";
import '../../flutter_flow/custom_functions.dart' as fun;
import 'dart:math';

Future<List<LatLng>> refineGoogleResult(List<dynamic> lat, List<dynamic> lng,
    double radius1, double radius2, LatLng center) async {
  List<LatLng> latlngs = [];
  for (int i = 0; i < lat.length; i++) {
    latlngs.add(LatLng(lat[i], lng[i]));
  }

  List<LatLng> result = [];
  int i = 0;
  for (LatLng latlng in latlngs) {
    double lat1 = latlng.latitude * pi / 180;
    double lat2 = center.latitude * pi / 180;
    double lng1 = latlng.longitude * pi / 180;
    double lng2 = center.longitude * pi / 180;
    double deltaLat = lat2 - lat1;
    double deltaLng = lng2 - lng1;
    double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1) * cos(lat2) * sin(deltaLng / 2) * sin(deltaLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = 6371 * c;

    debugPrint(
        "${lat[i]} ${lng[i]} | ${center.latitude}  ${center.longitude}  {Distance = ${distance} ::: ${radius1 * radius1} :::: ${radius2 * radius2}");
    i++;
    if (distance > radius1 / 1000 && distance <= radius2 / 1000) {
      result.add(latlng);
    }
  }
  return result;
}
