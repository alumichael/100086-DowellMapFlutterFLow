import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng? newCustomFunction(
  double? lat,
  double? lng,
) {
  return LatLng(lat!, lng!);
}

String latlngToString(LatLng latlng) {
  double lat = latlng.latitude;
  double lng = latlng.longitude;
  //String lat = latlng.latitude as String;
  //String lng = latlng.longitude as String;
  return "$lat,$lng";
}

String? saveSessionID(String? qrid) {
  return qrid;
}

String? saveIpAddress(String? ipAddress) {
  return ipAddress;
}

dynamic jsondata(
  List<String>? address,
  List<LatLng>? latlon,
) {
  List<Map<String, dynamic>> data = [];

  for (int i = 0, n = address!.length; i < n; ++i) {
    Map<String, dynamic> map = {
      'Address': address.elementAt(i),
      'lat_lon': latlon!.elementAt(i)
    };

    data.add(map);
  }
  return json.encode(data);
}

double getlan(LatLng latlng) {
  double lat = latlng.latitude;
  return lat!;
}

double getlon(LatLng latlng) {
  double lng = latlng.longitude;
  //String lat = latlng.latitude as String;
  //String lng = latlng.longitude as String;
  return lng!;
}

List<LatLng>? groupLocsConverter(List<dynamic>? data) {
  List<LatLng> dataValue = [];
  if (data != null) {
    for (int i = 0; i < data.length; i++) {
      print("mData $data");
      //var locInfo = data[0][i];
      dynamic locInfo = data[i];
      print("locInfoData $locInfo");

      //print("realData $realData");
      String locString = locInfo["loc_details"]["location_coord"] ?? "";

      print("locString $locString");

      if (locString != "null" && locString.isNotEmpty) {
        var splitCoord = locString.split(",");
        double lat = double.parse(splitCoord[0]);
        double lng = double.parse(splitCoord[1]);
        print("splitCoord $splitCoord");
        dataValue.add(LatLng(lat, lng));
      }
    }
  }
  return dataValue;
}

List<String>? refineCategoryList(
  List<String>? categoryList,
  String? categoryAdded,
) {
  if (!categoryList!.contains(categoryAdded)) {
    categoryList.add(categoryAdded!);
    //FFAppState().categoriesState.add(categoryAdded!);
  }

  return categoryList;
}

String? username(String? name) {
  if (name != "null") {
    return name;
  }

  return "Public User";
}

String? email(String? mail) {
  if (mail != "null") {
    return mail;
  }

  return " ";
}

dynamic userprofile(String? path) {
  if (path != "null") {
    return path;
  }

  return "https://100014.pythonanywhere.com/media/user.png";
}

bool? isuserlogedin(String? username) {
  if (username != "null") {
    return true;
  } else {
    return false;
  }
}

String? payment(String? status) {
  if (status != "null" && status != "unpaid") {
    status = "$status   ✔";
    return status;
  }
  return "Unpaid    ❌";
}

String? totalcredit(String? credit) {
  if (credit != "null") {
    return "Credit : $credit";
  }
  return "Credit : 0";
}

List<dynamic>? newCustomFunction2(List<dynamic>? dataBox) {
  List<String> dataValue = [];

  if (dataBox != null) {
    for (int i = 0; i < dataBox.length; i++) {
      // List<dynamic> locInfo = dataBox[i];
      // for (int j = 0; j < locInfo.length; j++) {
      var realData = dataBox[i];
      String locPlace = realData["loc_details"]["location_coord"] ?? "";
      String locString = realData["loc_details"]["place_name"] ?? "";
      if (locPlace != "null" && locString.isNotEmpty) {
        dataValue.add(locString);
      }
      // }
    }
  }
  return dataValue;
}

List<dynamic> payloadgen(
  List<String> usernames,
  String clientadminid,
) {
  List<Map<String, String>> links = [];

  for (int i = 0; i < usernames.length; i++) {
    // https: //livinglab-maps.flutterflow.app/trackingDetailsForm?userid=V8qcIGmHxMKC&wo8rk5spaceid=65a8bb1f2d73765634fdcaf5
//https://livinglab-maps.flutterflow.app/trackingDetailsForm?userid=shshsh&?workspaceid=dhdhdb
    String link =
        "https://livinglab-maps.flutterflow.app/trackingDetailsForm?userid=${usernames[i]}&workspaceid=$clientadminid";
    links.add({"link": link});
  }

  List<Map<String, String>> linksWithStringKeysAndValues = links.map((link) {
    return {
      "link": '${link['link']}',
    };
  }).toList();

  return linksWithStringKeysAndValues;
}

List<String>? refineQrLinks(
  String? clientadminid,
  List<dynamic>? portfolio,
) {
  if (clientadminid == null || portfolio == null || portfolio.isEmpty) {
    // Return null if any of the required parameters is null or usernames list is empty
    return null;
  }

  List<String> usernames = [];

  for (int i = 0; i < portfolio.length; i++) {
    Map<String, dynamic> portfo = portfolio[i];

    // Check conditions for extracting usernames
    if (portfo['member_type'] == 'public' &&
        portfo['product'] == 'Living Lab Maps') {
      List<String>? portfolioUsernames = portfo['username']?.cast<String>();
      if (portfolioUsernames != null) {
        usernames.addAll(portfolioUsernames);
      }
    }
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
}

String? generateRandomText(int lenghtOFString) {
  final random = math.Random();
  const allChars =
      'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
  // below statement will generate a random string of length using the characters
  // and length provided to it
  final randomString = List.generate(
          lenghtOFString, (index) => allChars[random.nextInt(allChars.length)])
      .join();
  return randomString; // return the generated string
}
