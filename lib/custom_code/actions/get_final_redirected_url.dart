// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> getFinalRedirectedUrl(String initialUrl) async {
  var client = http.Client();
  try {
    var response = await client.head(Uri.parse(initialUrl));

    if (response.statusCode == 301 || response.statusCode == 302) {
      // If the response has a redirect status code, get the 'location' header
      var redirectUrl = response.headers['location'];

      print("redirectUrl1::$redirectUrl");

      if (redirectUrl != null) {
        // If the 'location' header is present, recursively call the function with the new URL
        print("redirectUrl2::$redirectUrl");
        return getFinalRedirectedUrl(redirectUrl);
      }
    }
    print("redirectUrl3::$initialUrl");
    // If there is no redirect, or the redirect is not present in the headers, return the original URL
    return initialUrl;
  } finally {
    client.close();
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
