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

Future handleSelection(
  bool selectAll,
  List<dynamic> items,
) async {
  // Add your function code here!
  List<String> tempList = [];
  print("::the items: $items");
  if (selectAll) {
    for (dynamic dataInfo in items) {
      tempList.add(dataInfo['email']);
    }
  }
  print("::: the formated List is ::: $tempList");
  FFAppState().update(() {
    FFAppState().selectedMembers = tempList;
  });
}
