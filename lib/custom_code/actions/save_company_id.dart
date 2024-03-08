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

Future saveCompanyId(String orgName) async {
  // Add your function code here!
  final orgs = FFAppState().myMapOrgs;
  print(":::: the org List in : ::: $orgs");
  print(":::: the org Name : ::: $orgName");
  String retValue = "";
  for (dynamic dataInfo in orgs) {
    print(":::: the orgName in : ::: ${dataInfo['org_name']}");
    print(":::: the orgGivenName : ::: $orgName");
    print(":::: the org id :::: ${dataInfo['org_id']}");
    if (dataInfo["org_name"] == orgName) {
      print(":::: the org id2 :::: ${dataInfo['org_id']}");
      retValue = "${dataInfo['org_id']}";
    }
  }
  print(":::: the org id3 :::: $retValue");
  FFAppState().update(() {
    FFAppState().guestCompanyId = retValue;
  });
}
