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

Future updateSeletedEmails(bool isAdding, String email) async {
  // Add your function code here!
  FFAppState().update(() {
    isAdding
        ? FFAppState().selectedMembers.add(email)
        : FFAppState().selectedMembers.remove(email);
  });
}
