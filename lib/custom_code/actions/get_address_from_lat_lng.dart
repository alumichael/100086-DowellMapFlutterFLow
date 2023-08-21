// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getAddressFromLatLng(LatLng latlong) async {
  // Add your function code here!
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latlong.latitude, latlong.longitude);
  Placemark place = placemarks[0];
  String _currentAddress = "${place.street}";
  return _currentAddress;
}
