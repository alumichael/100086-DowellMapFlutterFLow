import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
    _safeInit(() {
      _guestUserId = prefs.getString('ff_guestUserId') ?? _guestUserId;
    });
    _safeInit(() {
      _guestCompanyId = prefs.getString('ff_guestCompanyId') ?? _guestCompanyId;
    });
    _safeInit(() {
      _isFirstLaunchAfterInstall =
          prefs.getBool('ff_isFirstLaunchAfterInstall') ??
              _isFirstLaunchAfterInstall;
    });
    _safeInit(() {
      _trackingData = prefs.getStringList('ff_trackingData')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _trackingData;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_guestGenInfo')) {
        try {
          final serializedData = prefs.getString('ff_guestGenInfo') ?? '{}';
          _guestGenInfo =
              GuestInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _myMapOrgs = prefs.getStringList('ff_myMapOrgs')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _myMapOrgs;
    });
    _safeInit(() {
      _orgByIdTeams = prefs.getStringList('ff_orgByIdTeams') ?? _orgByIdTeams;
    });
    _safeInit(() {
      _publicScannedValue =
          prefs.getString('ff_publicScannedValue') ?? _publicScannedValue;
    });
    _safeInit(() {
      _isOwner = prefs.getBool('ff_isOwner') ?? _isOwner;
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

  String _iosAPIKey = 'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk';
  String get iosAPIKey => _iosAPIKey;
  set iosAPIKey(String _value) {
    _iosAPIKey = _value;
  }

  String _usernametype = 'User Name';
  String get usernametype => _usernametype;
  set usernametype(String _value) {
    _usernametype = _value;
  }

  String _myIpAddress = '';
  String get myIpAddress => _myIpAddress;
  set myIpAddress(String _value) {
    _myIpAddress = _value;
  }

  String _androidKey = 'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4';
  String get androidKey => _androidKey;
  set androidKey(String _value) {
    _androidKey = _value;
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

  bool _isMarkerTapped = false;
  bool get isMarkerTapped => _isMarkerTapped;
  set isMarkerTapped(bool _value) {
    _isMarkerTapped = _value;
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

  String _guestUserId = '';
  String get guestUserId => _guestUserId;
  set guestUserId(String _value) {
    _guestUserId = _value;
    prefs.setString('ff_guestUserId', _value);
  }

  String _guestCompanyId = '';
  String get guestCompanyId => _guestCompanyId;
  set guestCompanyId(String _value) {
    _guestCompanyId = _value;
    prefs.setString('ff_guestCompanyId', _value);
  }

  dynamic _userMembers;
  dynamic get userMembers => _userMembers;
  set userMembers(dynamic _value) {
    _userMembers = _value;
  }

  List<String> _teamList = [];
  List<String> get teamList => _teamList;
  set teamList(List<String> _value) {
    _teamList = _value;
  }

  void addToTeamList(String _value) {
    _teamList.add(_value);
  }

  void removeFromTeamList(String _value) {
    _teamList.remove(_value);
  }

  void removeAtIndexFromTeamList(int _index) {
    _teamList.removeAt(_index);
  }

  void updateTeamListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _teamList[_index] = updateFn(_teamList[_index]);
  }

  void insertAtIndexInTeamList(int _index, String _value) {
    _teamList.insert(_index, _value);
  }

  TeamModelStruct _activeTeam = TeamModelStruct();
  TeamModelStruct get activeTeam => _activeTeam;
  set activeTeam(TeamModelStruct _value) {
    _activeTeam = _value;
  }

  void updateActiveTeamStruct(Function(TeamModelStruct) updateFn) {
    updateFn(_activeTeam);
  }

  List<MemberModelStruct> _currentMemberList = [];
  List<MemberModelStruct> get currentMemberList => _currentMemberList;
  set currentMemberList(List<MemberModelStruct> _value) {
    _currentMemberList = _value;
  }

  void addToCurrentMemberList(MemberModelStruct _value) {
    _currentMemberList.add(_value);
  }

  void removeFromCurrentMemberList(MemberModelStruct _value) {
    _currentMemberList.remove(_value);
  }

  void removeAtIndexFromCurrentMemberList(int _index) {
    _currentMemberList.removeAt(_index);
  }

  void updateCurrentMemberListAtIndex(
    int _index,
    MemberModelStruct Function(MemberModelStruct) updateFn,
  ) {
    _currentMemberList[_index] = updateFn(_currentMemberList[_index]);
  }

  void insertAtIndexInCurrentMemberList(int _index, MemberModelStruct _value) {
    _currentMemberList.insert(_index, _value);
  }

  bool _isFirstLaunchAfterInstall = true;
  bool get isFirstLaunchAfterInstall => _isFirstLaunchAfterInstall;
  set isFirstLaunchAfterInstall(bool _value) {
    _isFirstLaunchAfterInstall = _value;
    prefs.setBool('ff_isFirstLaunchAfterInstall', _value);
  }

  String _linkId = '';
  String get linkId => _linkId;
  set linkId(String _value) {
    _linkId = _value;
  }

  String _qrlink = '';
  String get qrlink => _qrlink;
  set qrlink(String _value) {
    _qrlink = _value;
  }

  bool _isQrFinalized = false;
  bool get isQrFinalized => _isQrFinalized;
  set isQrFinalized(bool _value) {
    _isQrFinalized = _value;
  }

  List<dynamic> _trackingData = [];
  List<dynamic> get trackingData => _trackingData;
  set trackingData(List<dynamic> _value) {
    _trackingData = _value;
    prefs.setStringList(
        'ff_trackingData', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTrackingData(dynamic _value) {
    _trackingData.add(_value);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTrackingData(dynamic _value) {
    _trackingData.remove(_value);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTrackingData(int _index) {
    _trackingData.removeAt(_index);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void updateTrackingDataAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _trackingData[_index] = updateFn(_trackingData[_index]);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTrackingData(int _index, dynamic _value) {
    _trackingData.insert(_index, _value);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _teamMembers = [];
  List<dynamic> get teamMembers => _teamMembers;
  set teamMembers(List<dynamic> _value) {
    _teamMembers = _value;
  }

  void addToTeamMembers(dynamic _value) {
    _teamMembers.add(_value);
  }

  void removeFromTeamMembers(dynamic _value) {
    _teamMembers.remove(_value);
  }

  void removeAtIndexFromTeamMembers(int _index) {
    _teamMembers.removeAt(_index);
  }

  void updateTeamMembersAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _teamMembers[_index] = updateFn(_teamMembers[_index]);
  }

  void insertAtIndexInTeamMembers(int _index, dynamic _value) {
    _teamMembers.insert(_index, _value);
  }

  List<dynamic> _guestMembers = [];
  List<dynamic> get guestMembers => _guestMembers;
  set guestMembers(List<dynamic> _value) {
    _guestMembers = _value;
  }

  void addToGuestMembers(dynamic _value) {
    _guestMembers.add(_value);
  }

  void removeFromGuestMembers(dynamic _value) {
    _guestMembers.remove(_value);
  }

  void removeAtIndexFromGuestMembers(int _index) {
    _guestMembers.removeAt(_index);
  }

  void updateGuestMembersAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _guestMembers[_index] = updateFn(_guestMembers[_index]);
  }

  void insertAtIndexInGuestMembers(int _index, dynamic _value) {
    _guestMembers.insert(_index, _value);
  }

  List<String> _selectedMembers = [];
  List<String> get selectedMembers => _selectedMembers;
  set selectedMembers(List<String> _value) {
    _selectedMembers = _value;
  }

  void addToSelectedMembers(String _value) {
    _selectedMembers.add(_value);
  }

  void removeFromSelectedMembers(String _value) {
    _selectedMembers.remove(_value);
  }

  void removeAtIndexFromSelectedMembers(int _index) {
    _selectedMembers.removeAt(_index);
  }

  void updateSelectedMembersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _selectedMembers[_index] = updateFn(_selectedMembers[_index]);
  }

  void insertAtIndexInSelectedMembers(int _index, String _value) {
    _selectedMembers.insert(_index, _value);
  }

  String _trackingTeam = '';
  String get trackingTeam => _trackingTeam;
  set trackingTeam(String _value) {
    _trackingTeam = _value;
  }

  List<bool> _selectmode = [];
  List<bool> get selectmode => _selectmode;
  set selectmode(List<bool> _value) {
    _selectmode = _value;
  }

  void addToSelectmode(bool _value) {
    _selectmode.add(_value);
  }

  void removeFromSelectmode(bool _value) {
    _selectmode.remove(_value);
  }

  void removeAtIndexFromSelectmode(int _index) {
    _selectmode.removeAt(_index);
  }

  void updateSelectmodeAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _selectmode[_index] = updateFn(_selectmode[_index]);
  }

  void insertAtIndexInSelectmode(int _index, bool _value) {
    _selectmode.insert(_index, _value);
  }

  String _activeTeamName = '';
  String get activeTeamName => _activeTeamName;
  set activeTeamName(String _value) {
    _activeTeamName = _value;
  }

  bool _deletingFromMain = false;
  bool get deletingFromMain => _deletingFromMain;
  set deletingFromMain(bool _value) {
    _deletingFromMain = _value;
  }

  List<String> _myMapOrgNames = [];
  List<String> get myMapOrgNames => _myMapOrgNames;
  set myMapOrgNames(List<String> _value) {
    _myMapOrgNames = _value;
  }

  void addToMyMapOrgNames(String _value) {
    _myMapOrgNames.add(_value);
  }

  void removeFromMyMapOrgNames(String _value) {
    _myMapOrgNames.remove(_value);
  }

  void removeAtIndexFromMyMapOrgNames(int _index) {
    _myMapOrgNames.removeAt(_index);
  }

  void updateMyMapOrgNamesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _myMapOrgNames[_index] = updateFn(_myMapOrgNames[_index]);
  }

  void insertAtIndexInMyMapOrgNames(int _index, String _value) {
    _myMapOrgNames.insert(_index, _value);
  }

  bool _timerStarted = false;
  bool get timerStarted => _timerStarted;
  set timerStarted(bool _value) {
    _timerStarted = _value;
  }

  GuestInfoStruct _guestGenInfo = GuestInfoStruct();
  GuestInfoStruct get guestGenInfo => _guestGenInfo;
  set guestGenInfo(GuestInfoStruct _value) {
    _guestGenInfo = _value;
    prefs.setString('ff_guestGenInfo', _value.serialize());
  }

  void updateGuestGenInfoStruct(Function(GuestInfoStruct) updateFn) {
    updateFn(_guestGenInfo);
    prefs.setString('ff_guestGenInfo', _guestGenInfo.serialize());
  }

  List<dynamic> _myMapOrgs = [];
  List<dynamic> get myMapOrgs => _myMapOrgs;
  set myMapOrgs(List<dynamic> _value) {
    _myMapOrgs = _value;
    prefs.setStringList(
        'ff_myMapOrgs', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToMyMapOrgs(dynamic _value) {
    _myMapOrgs.add(_value);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMyMapOrgs(dynamic _value) {
    _myMapOrgs.remove(_value);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMyMapOrgs(int _index) {
    _myMapOrgs.removeAt(_index);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void updateMyMapOrgsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myMapOrgs[_index] = updateFn(_myMapOrgs[_index]);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInMyMapOrgs(int _index, dynamic _value) {
    _myMapOrgs.insert(_index, _value);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  List<String> _orgByIdTeams = [];
  List<String> get orgByIdTeams => _orgByIdTeams;
  set orgByIdTeams(List<String> _value) {
    _orgByIdTeams = _value;
    prefs.setStringList('ff_orgByIdTeams', _value);
  }

  void addToOrgByIdTeams(String _value) {
    _orgByIdTeams.add(_value);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void removeFromOrgByIdTeams(String _value) {
    _orgByIdTeams.remove(_value);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void removeAtIndexFromOrgByIdTeams(int _index) {
    _orgByIdTeams.removeAt(_index);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void updateOrgByIdTeamsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _orgByIdTeams[_index] = updateFn(_orgByIdTeams[_index]);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void insertAtIndexInOrgByIdTeams(int _index, String _value) {
    _orgByIdTeams.insert(_index, _value);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  bool _clearmap = false;
  bool get clearmap => _clearmap;
  set clearmap(bool _value) {
    _clearmap = _value;
  }

  String _webGoogleApiKey = 'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ';
  String get webGoogleApiKey => _webGoogleApiKey;
  set webGoogleApiKey(String _value) {
    _webGoogleApiKey = _value;
  }

  String _publicScannedValue = '';
  String get publicScannedValue => _publicScannedValue;
  set publicScannedValue(String _value) {
    _publicScannedValue = _value;
    prefs.setString('ff_publicScannedValue', _value);
  }

  bool _isOwner = false;
  bool get isOwner => _isOwner;
  set isOwner(bool _value) {
    _isOwner = _value;
    prefs.setBool('ff_isOwner', _value);
  }
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
