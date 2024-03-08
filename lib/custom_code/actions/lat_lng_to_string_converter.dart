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

import 'dart:convert';

String latLngToStringConverter(String stringCordinate) {
  // convert a string of two location cordinate to LatLng

  String latlngs = "";

  var coordinates = jsonDecode(stringCordinate);
  // for (int i = 0; i < stringCordinate.length; i++) {
  //   List<String> locationList = stringCordinate[i].split(",");
  //   double lat = double.parse(locationList[0]);
  //   double lng = double.parse(locationList[1]);
  //   latlngs.add(LatLng(lat, lng));
  // }
  debugPrint("from jide custom action:::: $coordinates");

  return latlngs;
}
