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

Future<List<dynamic>> getMembers(
  dynamic data,
  String key,
) async {
  // Add your function code here!
//   {
//   "team_member": [
//     {
//       "name": "owner",
//       "first_name": "Micheal",
//       "last_name": "Alu",
//       "email": "alumichael9@gmail.com"
//     }
//   ],
//   "guest_members": [],
//   "public_members": []
// }
  switch (key) {
    case "team":
      {
        return data["team_member"] ?? [];
      }
    case "public":
      {
        return data["public_members"] ?? [];
      }
    case "guest":
      {
        return data["guest_members"] ?? [];
      }
    default:
      return [];
  }
}
