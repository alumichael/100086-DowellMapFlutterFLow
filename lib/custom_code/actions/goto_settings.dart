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

import 'package:geolocator/geolocator.dart';
import 'dart:io' show Platform;

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future gotoSettings() async {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool serviceEnabled;
  LocationPermission permission;
  if (Platform.isIOS) {
    final opened = await _geolocatorPlatform.openAppSettings();
    if (opened) {
      debugPrint("Opened Location Settings");
    } else {
      debugPrint("Error opening Location Settings");
    }
  } else if (Platform.isAndroid || Platform.isWindows) {
    final opened = await _geolocatorPlatform.openLocationSettings();
    if (opened) {
      debugPrint("Opened Location Settings");
    } else {
      debugPrint("Error opening Location Settings");
    }
  }
}
