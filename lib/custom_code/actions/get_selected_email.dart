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

Future<List<dynamic>> getSelectedEmail(List<dynamic> selectedTeamList) async {
  List<dynamic> recipient = [];

  print("selectedTeamList ----  $selectedTeamList");

  for (dynamic team in selectedTeamList) {
    recipient.add({"email": team["member_email"], "name": team["first_name"]});
  }

  print("recipientList ----  $recipient");
  return recipient;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
