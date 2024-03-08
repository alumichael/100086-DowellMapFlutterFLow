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

Future<List<dynamic>> combineSelectedMembers(bool isFromTeam) async {
  // Add your function code here!
  List<dynamic> teamMembers = FFAppState().teamMembers;
  List<dynamic> guestMembers = FFAppState().guestMembers;
  List<String> selectedEmails = FFAppState().selectedMembers;
  List<dynamic> tempMember = [];

//  {
//                         "first_name": "Mike",
//                         "last_name": "Alu",
//                         "member_status": "active",
//                         "member_email": "jazz0@gmail.com"
//                     }
  if (selectedEmails.isNotEmpty) {
    if (isFromTeam) {
      for (dynamic itemInfo in teamMembers) {
        if (selectedEmails.contains(itemInfo["email"])) {
          tempMember.add({
            "first_name": itemInfo["first_name"],
            "last_name": itemInfo["last_name"],
            "member_status": "active",
            "member_email": itemInfo["email"]
          });
        }
      }
    } else {
      for (dynamic itemInfo in guestMembers) {
        if (selectedEmails.contains(itemInfo["email"])) {
          tempMember.add({
            "first_name": itemInfo["first_name"],
            "last_name": itemInfo["last_name"],
            "member_status": "active",
            "member_email": itemInfo["email"]
          });
        }
      }
    }
  }
  return tempMember;
}
