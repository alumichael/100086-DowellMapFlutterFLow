// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String latlngToString(LatLng latlng) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  double lat = latlng.latitude;
  double lng = latlng.longitude;
  //String lat = latlng.latitude as String;
  //String lng = latlng.longitude as String;
  return "$lat,$lng";

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

Future<String?> newCustomAction2(List<LatLng>? result) async {
  // Add your function code here!
  //String lat = latlng.latitude as String;
  //String lng = latlng.longitude as String;
  return latlngToString(result!.elementAt(0));
}
