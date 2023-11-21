// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<String> getGroupLocsNames(List<dynamic> jsonData) {
  List<String> dataValue = [];
  if (jsonData.isNotEmpty) {
    var realData = jsonData[0];
    for (int i = 0; i < realData.length; i++) {
      var locInfo = realData[i];
      String locPlace = locInfo["loc_details"]["location_coord"] ?? "";
      String locString = locInfo["loc_details"]["place_name"] ?? "";
      if (locPlace != "null" && locString.isNotEmpty) {
        dataValue.add(locString);
      }
    }
  }
  return dataValue;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
