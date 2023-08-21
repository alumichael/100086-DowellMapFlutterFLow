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

  String _iosAPIKey = 'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk';
  String get iosAPIKey => _iosAPIKey;
  set iosAPIKey(String _value) {
    _iosAPIKey = _value;
  }

  String _androidKey = 'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4';
  String get androidKey => _androidKey;
  set androidKey(String _value) {
    _androidKey = _value;
  }

  String _webMapApiKey = 'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ';
  String get webMapApiKey => _webMapApiKey;
  set webMapApiKey(String _value) {
    _webMapApiKey = _value;
  }

  String _myIpAddress = '';
  String get myIpAddress => _myIpAddress;
  set myIpAddress(String _value) {
    _myIpAddress = _value;
  }

  bool _isMarkerTapped = false;
  bool get isMarkerTapped => _isMarkerTapped;
  set isMarkerTapped(bool _value) {
    _isMarkerTapped = _value;
  }

  String _selectedLocation = '';
  String get selectedLocation => _selectedLocation;
  set selectedLocation(String _value) {
    _selectedLocation = _value;
  }

  List<String> _categoriesState = [
    'Food and Drinks',
    'Shopping',
    'Service',
    'Holets & Lodging',
    'Outdoors & Recreation',
    'Religion',
    'Office and Industrial',
    'Residential',
    'Education'
  ];
  List<String> get categoriesState => _categoriesState;
  set categoriesState(List<String> _value) {
    _categoriesState = _value;
  }

  void addToCategoriesState(String _value) {
    _categoriesState.add(_value);
  }

  void removeFromCategoriesState(String _value) {
    _categoriesState.remove(_value);
  }

  void removeAtIndexFromCategoriesState(int _index) {
    _categoriesState.removeAt(_index);
  }

  void updateCategoriesStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _categoriesState[_index] = updateFn(_categoriesState[_index]);
  }

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String _value) {
    _selectedCategory = _value;
  }

  String _newCategoryTyped = '';
  String get newCategoryTyped => _newCategoryTyped;
  set newCategoryTyped(String _value) {
    _newCategoryTyped = _value;
  }

  dynamic _CCats;
  dynamic get CCats => _CCats;
  set CCats(dynamic _value) {
    _CCats = _value;
  }

  bool _mapDataReady = false;
  bool get mapDataReady => _mapDataReady;
  set mapDataReady(bool _value) {
    _mapDataReady = _value;
  }

  String _dowellKey = 'EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr';
  String get dowellKey => _dowellKey;
  set dowellKey(String _value) {
    _dowellKey = _value;
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
