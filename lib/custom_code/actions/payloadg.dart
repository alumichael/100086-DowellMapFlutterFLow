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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? payloadg(
  String? clientadminid,
  List<String>? usernames,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (clientadminid == null || usernames == null || usernames.isEmpty) {
    // Return null if any of the required parameters is null or usernames list is empty
    return null;
  }

  List<String> payload = [
    "qrcode_type: Link",
    "quantity: ${usernames.length}",
    "company_id: $clientadminid",
    "links: [",
  ];

  for (int i = 0; i < usernames.length; i++) {
    String username = usernames[i];
    payload.add("  {");
    payload.add("    link: http://livinglab.com/$username/$clientadminid");
    payload.add("  },");
  }

  // Remove the trailing comma from the last link entry
  payload[payload.length - 1] = payload.last.replaceAll(",", "");

  payload.add("]");
  payload.add("document_name: Living Lab Maps");

  return payload;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
