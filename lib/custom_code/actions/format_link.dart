// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> formatLink(String link) async {
  // Add your function code here!
  List<String> splitList = link.split("com/");
  List<String> useAbleIds = splitList.last.split("/");
  String userId = useAbleIds[0];
  List<String> lastSpliting = useAbleIds.last.split("?link_id=");
  String companyId = lastSpliting[0];
  String linkId = lastSpliting[1];
  Map<String, String> userDetails = {
    "userId": userId,
    "companyId": companyId,
    "linkId": linkId
  };
  FFAppState().update(() {
    FFAppState().guestUserDetails = userDetails;
  });
  print("The user mapping details are :: $userDetails");
}
