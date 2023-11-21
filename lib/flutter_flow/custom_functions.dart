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

List<String>? groupLocsIdExtractor(List<dynamic>? dataBox) {
  var dataValue = <String>[];
  if (dataBox != null) {
    for (int i = 0; i < dataBox.length; i++) {
      List<dynamic> locInfo = dataBox[i];
      for (int j = 0; j < locInfo.length; j++) {
        var realData = locInfo[j];
        String locPlace = realData["loc_details"]["location_coord"] ?? "";
        String locString = realData["_id"] ?? "";
        if (locPlace != "null" && locString.isNotEmpty) {
          dataValue.add(locString);
        }
      }
    }
  }
  return dataValue;
}

List<String> groupLocsDetailsExtractor(List<dynamic>? dataBox) {
  List<String> dataValue = [];

  if (dataBox != null) {
    for (int i = 0; i < dataBox.length; i++) {
      List<dynamic> locInfo = dataBox[i];
      for (int j = 0; j < locInfo.length; j++) {
        var realData = locInfo[j];
        String locPlace = realData["loc_details"]["location_coord"] ?? "";
        String locString = realData["loc_details"]["place_name"] ?? "";
        if (locPlace != "null" && locString.isNotEmpty) {
          dataValue.add(locString);
        }
      }
    }
  }
  return dataValue;
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

List<dynamic> removeNullLoc(List<dynamic>? dataBox) {
  var dataValue = [];
  if (dataBox != null) {
    for (int i = 0; i < dataBox.length; i++) {
      List<dynamic> locInfo = dataBox[i];
      for (int j = 0; j < locInfo.length; j++) {
        var realData = locInfo[j];
        String locString = realData["loc_details"]["location_coord"] ?? "";
        if (locString.isNotEmpty) {
          dataValue.add(locInfo);
        }
      }
    }
  }
  return dataValue;
}
