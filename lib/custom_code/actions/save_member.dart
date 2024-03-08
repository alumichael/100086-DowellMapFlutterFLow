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

Future saveMember(List<dynamic> dataInfo) async {
  // Add your function code here!
  List<MemberModelStruct> tempList = [];
  for (dynamic memberInfo in dataInfo) {
    tempList.add(MemberModelStruct(
        firstName: memberInfo["first_name"],
        lastName: memberInfo["last_name"],
        status: memberInfo["member_status"],
        email: memberInfo["member_email"] ?? ""));
  }
  FFAppState().update(() {
    FFAppState().activeTeam.teamMembers = tempList;
    FFAppState().currentMemberList = tempList;
  });
}
