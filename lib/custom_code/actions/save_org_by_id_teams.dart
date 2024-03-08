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

Future saveOrgByIdTeams(List<dynamic> response) async {
  // Add your function code here!
  List<String> tempList = [];
  for (dynamic teamInfo in response) {
    tempList.add(teamInfo["team_name"]);
  }
  print("::: the orgIdTeams is ::: $tempList");
  FFAppState().update(() {
    FFAppState().orgByIdTeams = tempList;
    FFAppState().guestGenInfo.orgByIdTeams = tempList;
  });
}

// {
//   "success": true,
//   "teams": [
//     {
//       "team_name": "abcd",
//       "member_type": "team_members"
//     }
//  {
//       "team_name": "abcd2",
//       "member_type": "team_member"
//     }
//   ]
// }
