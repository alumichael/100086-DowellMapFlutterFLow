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

Future addMemberToActive(dynamic itemInfo) async {
  // Add your function code here!
  print(":::: the itemInfo::: $itemInfo");

  FFAppState().update(() {
    FFAppState().activeTeam.teamMembers.add(MemberModelStruct(
        firstName: itemInfo["first_name"],
        lastName: itemInfo["last_name"],
        status: "Inactive",
        email: itemInfo["email"] ?? ""));

    FFAppState().currentMemberList.add(MemberModelStruct(
        firstName: itemInfo["first_name"],
        lastName: itemInfo["last_name"],
        status: "Inactive",
        email: itemInfo["email"] ?? ""));
  });
}
