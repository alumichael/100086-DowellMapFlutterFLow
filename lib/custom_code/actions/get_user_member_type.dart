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

import 'dart:convert';

Future<String> getUserMemberType() async {
  // Add your function code here!
  print(":::::: the response info is::: ${json.encode(FFAppState().response)}");

  List portfolios = FFAppState().response["other_org"];
  List mapsList = [];
  Map<String, dynamic>? mapPortfolio;
  Map<String, dynamic>? members = FFAppState().response["members"];
  FFAppState().teamMembers = members?["team_member"] as List;
  FFAppState().guestMembers = members?["guest_members"] as List;

  for (Map<String, dynamic> portfolioInfo in portfolios) {
    if (portfolioInfo["product"] == "Living Lab Maps") {
      mapsList.add(portfolioInfo);
      mapPortfolio = portfolioInfo;
    }
  }
  print(":::org org List:: $mapsList");
  if (mapsList.isNotEmpty) {
    FFAppState().myMapOrgs = mapsList;
    List<String> tempList = [];
    for (dynamic dataInfo in mapsList) {
      tempList.add(dataInfo["org_name"]);
    }
    print(":::org name List:: $tempList");
    FFAppState().myMapOrgNames = tempList;
  }

  if (mapPortfolio != null) {
    return mapPortfolio["member_type"];
  } else {
    print(":::LoginType:: not a member");
    return "not a member";
  }
}
