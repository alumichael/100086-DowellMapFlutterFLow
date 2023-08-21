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

List<dynamic>? convertToList(List<dynamic>? data) {
  return data;
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
