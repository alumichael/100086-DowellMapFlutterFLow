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

Future<String?> httpLoader(String link) async {
  // Add your function code here!

  try {
    // var url = Uri.https(link);
    var response = await http.get(Uri.parse(link));
    print('Response body: ${response.body}');
  } catch (e) {
    print("from the exception room : $e");
  }
  // RegExp linkRegex = RegExp(r'https?://\S+');
  // List<RegExpMatch?> matches = linkRegex.allMatches(response.body.replaceFirst(""));

  // List<String> links = [];
  // if (matches != null) {
  //   for (RegExpMatch match in matches) {
  //     links.add(match.group(0)!);
  //   }
  // }
  // print('Formatter links are : $links');
  return null;
}
