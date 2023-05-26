// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<String> eventCreation(
    String? sessionId, String? ipAddress, String? location) async {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MMM-yyyy kk:mm').format(now);
  final url = Uri.parse('https://100003.pythonanywhere.com/event_creation');
  final data = {
    "citycode": "101",
    "context": "afdafa",
    "daycode": "0",
    "dbcode": "pfm",
    "document_id": "3004",
    "dowell_time": formattedDate,
    "instancecode": "100086",
    "ip_address": ipAddress,
    "location": location,
    "login_id": sessionId,
    "objectcode": "1",
    "platformcode": "FB",
    "processcode": "1",
    "regional_time": formattedDate,
    "rules": "some rules",
    "session_id": sessionId,
    "status": "work"
  };

  final body = json.encode(data);
  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  var res;
  res = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return res;
  } else {
    throw Exception('Failed to make post request');
  }
}
