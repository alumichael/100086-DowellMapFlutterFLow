import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentLocation = 'Current Location';
  String get currentLocation => _currentLocation;
  set currentLocation(String _value) {
    _currentLocation = _value;
  }

  bool _clearmap = false;
  bool get clearmap => _clearmap;
  set clearmap(bool _value) {
    _clearmap = _value;
  }

  dynamic _response;
  dynamic get response => _response;
  set response(dynamic _value) {
    _response = _value;
  }

  String _usernametype = 'User Name';
  String get usernametype => _usernametype;
  set usernametype(String _value) {
    _usernametype = _value;
  }

  bool _isAuthUser = false;
  bool get isAuthUser => _isAuthUser;
  set isAuthUser(bool _value) {
    _isAuthUser = _value;
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String _value) {
    _sessionId = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
