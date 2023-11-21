// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<LatLng> getGroupLocsCoord(List<dynamic> jsonData) {
  List<LatLng> dataValue = [];
  if (jsonData.isNotEmpty) {
    var realData = jsonData[0];
    for (int i = 0; i < realData.length; i++) {
      var locInfo = realData[i];
      String locString = locInfo["loc_details"]["location_coord"] ?? "";
      if (locString != "null" && locString.isNotEmpty) {
        var splitCoord = locString.split(",");
        double lat = double.parse(splitCoord[0]);
        double lng = double.parse(splitCoord[1]);
        dataValue.add(LatLng(lat, lng));
      }
    }
  }
  return dataValue;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
