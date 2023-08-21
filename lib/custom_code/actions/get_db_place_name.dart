// Automatic FlutterFlow imports
import '/backend/backend.dart';
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

Future<List<String>> getDbPlaceName(List<dynamic>? placename) async {
  List<String> mPlacenames = [];
  debugPrint("${placename}");

  for (int i = 0; i < placename!.length; i++) {
    mPlacenames.add(placename!.elementAt(i));
  }
  return mPlacenames;
}
