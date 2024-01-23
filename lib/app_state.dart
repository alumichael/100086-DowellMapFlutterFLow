import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _sessionId = prefs.getString('ff_sessionId') ?? _sessionId;
    });
    _safeInit(() {
      _username = prefs.getString('ff_username') ?? _username;
    });
    _safeInit(() {
      _otherorgid = prefs.getString('ff_otherorgid') ?? _otherorgid;
    });
    _safeInit(() {
      _isAuthUser = prefs.getBool('ff_isAuthUser') ?? _isAuthUser;
    });
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      _groupList = prefs.getStringList('ff_groupList') ?? _groupList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_response')) {
        try {
          _response = jsonDecode(prefs.getString('ff_response') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _allowLocationTracking =
          prefs.getBool('ff_allowLocationTracking') ?? _allowLocationTracking;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  String _usernametype = 'User Name';
  String get usernametype => _usernametype;
  set usernametype(String _value) {
    _usernametype = _value;
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

  void insertAtIndexInCategoriesState(int _index, String _value) {
    _categoriesState.insert(_index, _value);
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

  String _sessionId = 'null';
  String get sessionId => _sessionId;
  set sessionId(String _value) {
    _sessionId = _value;
    prefs.setString('ff_sessionId', _value);
  }

  String _username = '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
    prefs.setString('ff_username', _value);
  }

  String _otherorgid = '';
  String get otherorgid => _otherorgid;
  set otherorgid(String _value) {
    _otherorgid = _value;
    prefs.setString('ff_otherorgid', _value);
  }

  bool _isAuthUser = false;
  bool get isAuthUser => _isAuthUser;
  set isAuthUser(bool _value) {
    _isAuthUser = _value;
    prefs.setBool('ff_isAuthUser', _value);
  }

  String _credit = '0';
  String get credit => _credit;
  set credit(String _value) {
    _credit = _value;
  }

  String _apiKey = '';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
    prefs.setString('ff_apiKey', _value);
  }

  bool _showBottomSheet = false;
  bool get showBottomSheet => _showBottomSheet;
  set showBottomSheet(bool _value) {
    _showBottomSheet = _value;
  }

  dynamic _MyMapResponseData;
  dynamic get MyMapResponseData => _MyMapResponseData;
  set MyMapResponseData(dynamic _value) {
    _MyMapResponseData = _value;
  }

  bool _isProfiledUser = false;
  bool get isProfiledUser => _isProfiledUser;
  set isProfiledUser(bool _value) {
    _isProfiledUser = _value;
  }

  List<String> _groupList = [];
  List<String> get groupList => _groupList;
  set groupList(List<String> _value) {
    _groupList = _value;
    prefs.setStringList('ff_groupList', _value);
  }

  void addToGroupList(String _value) {
    _groupList.add(_value);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void removeFromGroupList(String _value) {
    _groupList.remove(_value);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void removeAtIndexFromGroupList(int _index) {
    _groupList.removeAt(_index);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void updateGroupListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _groupList[_index] = updateFn(_groupList[_index]);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void insertAtIndexInGroupList(int _index, String _value) {
    _groupList.insert(_index, _value);
    prefs.setStringList('ff_groupList', _groupList);
  }

  List<dynamic> _groupLocs = [];
  List<dynamic> get groupLocs => _groupLocs;
  set groupLocs(List<dynamic> _value) {
    _groupLocs = _value;
  }

  void addToGroupLocs(dynamic _value) {
    _groupLocs.add(_value);
  }

  void removeFromGroupLocs(dynamic _value) {
    _groupLocs.remove(_value);
  }

  void removeAtIndexFromGroupLocs(int _index) {
    _groupLocs.removeAt(_index);
  }

  void updateGroupLocsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _groupLocs[_index] = updateFn(_groupLocs[_index]);
  }

  void insertAtIndexInGroupLocs(int _index, dynamic _value) {
    _groupLocs.insert(_index, _value);
  }

  bool _showMyLocs = false;
  bool get showMyLocs => _showMyLocs;
  set showMyLocs(bool _value) {
    _showMyLocs = _value;
  }

  List<LatLng> _groupCoordLocs = [];
  List<LatLng> get groupCoordLocs => _groupCoordLocs;
  set groupCoordLocs(List<LatLng> _value) {
    _groupCoordLocs = _value;
  }

  void addToGroupCoordLocs(LatLng _value) {
    _groupCoordLocs.add(_value);
  }

  void removeFromGroupCoordLocs(LatLng _value) {
    _groupCoordLocs.remove(_value);
  }

  void removeAtIndexFromGroupCoordLocs(int _index) {
    _groupCoordLocs.removeAt(_index);
  }

  void updateGroupCoordLocsAtIndex(
    int _index,
    LatLng Function(LatLng) updateFn,
  ) {
    _groupCoordLocs[_index] = updateFn(_groupCoordLocs[_index]);
  }

  void insertAtIndexInGroupCoordLocs(int _index, LatLng _value) {
    _groupCoordLocs.insert(_index, _value);
  }

  List<String> _groupAddress = [];
  List<String> get groupAddress => _groupAddress;
  set groupAddress(List<String> _value) {
    _groupAddress = _value;
  }

  void addToGroupAddress(String _value) {
    _groupAddress.add(_value);
  }

  void removeFromGroupAddress(String _value) {
    _groupAddress.remove(_value);
  }

  void removeAtIndexFromGroupAddress(int _index) {
    _groupAddress.removeAt(_index);
  }

  void updateGroupAddressAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _groupAddress[_index] = updateFn(_groupAddress[_index]);
  }

  void insertAtIndexInGroupAddress(int _index, String _value) {
    _groupAddress.insert(_index, _value);
  }

  List<String> _groupIds = [];
  List<String> get groupIds => _groupIds;
  set groupIds(List<String> _value) {
    _groupIds = _value;
  }

  void addToGroupIds(String _value) {
    _groupIds.add(_value);
  }

  void removeFromGroupIds(String _value) {
    _groupIds.remove(_value);
  }

  void removeAtIndexFromGroupIds(int _index) {
    _groupIds.removeAt(_index);
  }

  void updateGroupIdsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _groupIds[_index] = updateFn(_groupIds[_index]);
  }

  void insertAtIndexInGroupIds(int _index, String _value) {
    _groupIds.insert(_index, _value);
  }

  dynamic _toEditJson;
  dynamic get toEditJson => _toEditJson;
  set toEditJson(dynamic _value) {
    _toEditJson = _value;
  }

  String _deleteId = '';
  String get deleteId => _deleteId;
  set deleteId(String _value) {
    _deleteId = _value;
  }

  dynamic _response;
  dynamic get response => _response;
  set response(dynamic _value) {
    _response = _value;
    prefs.setString('ff_response', jsonEncode(_value));
  }

  bool _noMoreCredit = false;
  bool get noMoreCredit => _noMoreCredit;
  set noMoreCredit(bool _value) {
    _noMoreCredit = _value;
  }

  bool _isGettingDroupLocations = false;
  bool get isGettingDroupLocations => _isGettingDroupLocations;
  set isGettingDroupLocations(bool _value) {
    _isGettingDroupLocations = _value;
  }

  bool _enableTracking = true;
  bool get enableTracking => _enableTracking;
  set enableTracking(bool _value) {
    _enableTracking = _value;
  }

  bool _showTrackingToggler = false;
  bool get showTrackingToggler => _showTrackingToggler;
  set showTrackingToggler(bool _value) {
    _showTrackingToggler = _value;
  }

  bool _isDestinationSelected = false;
  bool get isDestinationSelected => _isDestinationSelected;
  set isDestinationSelected(bool _value) {
    _isDestinationSelected = _value;
  }

  List<dynamic> _convertedCordinate = [];
  List<dynamic> get convertedCordinate => _convertedCordinate;
  set convertedCordinate(List<dynamic> _value) {
    _convertedCordinate = _value;
  }

  void addToConvertedCordinate(dynamic _value) {
    _convertedCordinate.add(_value);
  }

  void removeFromConvertedCordinate(dynamic _value) {
    _convertedCordinate.remove(_value);
  }

  void removeAtIndexFromConvertedCordinate(int _index) {
    _convertedCordinate.removeAt(_index);
  }

  void updateConvertedCordinateAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _convertedCordinate[_index] = updateFn(_convertedCordinate[_index]);
  }

  void insertAtIndexInConvertedCordinate(int _index, dynamic _value) {
    _convertedCordinate.insert(_index, _value);
  }

  int _squareCounts = 0;
  int get squareCounts => _squareCounts;
  set squareCounts(int _value) {
    _squareCounts = _value;
  }

  String _qr = '';
  String get qr => _qr;
  set qr(String _value) {
    _qr = _value;
  }

  dynamic _guestUserDetails;
  dynamic get guestUserDetails => _guestUserDetails;
  set guestUserDetails(dynamic _value) {
    _guestUserDetails = _value;
  }

  String _guestName = '';
  String get guestName => _guestName;
  set guestName(String _value) {
    _guestName = _value;
  }

  String _guestEmail = 'email';
  String get guestEmail => _guestEmail;
  set guestEmail(String _value) {
    _guestEmail = _value;
  }

  String _guestCompanyName = '';
  String get guestCompanyName => _guestCompanyName;
  set guestCompanyName(String _value) {
    _guestCompanyName = _value;
  }

  String _guestCountry = '';
  String get guestCountry => _guestCountry;
  set guestCountry(String _value) {
    _guestCountry = _value;
  }

  bool _allowLocationTracking = false;
  bool get allowLocationTracking => _allowLocationTracking;
  set allowLocationTracking(bool _value) {
    _allowLocationTracking = _value;
    prefs.setBool('ff_allowLocationTracking', _value);
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
