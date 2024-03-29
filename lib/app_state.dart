import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _guestEmail = prefs.getString('ff_guestEmail') ?? _guestEmail;
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
      _linkId = prefs.getString('ff_linkId') ?? _linkId;
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
  set currentLocation(String value) {
    _currentLocation = value;
  }

  String _usernametype = 'User Name';
  String get usernametype => _usernametype;
  set usernametype(String value) {
    _usernametype = value;
  }

  String _myIpAddress = '';
  String get myIpAddress => _myIpAddress;
  set myIpAddress(String value) {
    _myIpAddress = value;
  }

  String _selectedLocation = '';
  String get selectedLocation => _selectedLocation;
  set selectedLocation(String value) {
    _selectedLocation = value;
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
  set categoriesState(List<String> value) {
    _categoriesState = value;
  }

  void addToCategoriesState(String value) {
    _categoriesState.add(value);
  }

  void removeFromCategoriesState(String value) {
    _categoriesState.remove(value);
  }

  void removeAtIndexFromCategoriesState(int index) {
    _categoriesState.removeAt(index);
  }

  void updateCategoriesStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _categoriesState[index] = updateFn(_categoriesState[index]);
  }

  void insertAtIndexInCategoriesState(int index, String value) {
    _categoriesState.insert(index, value);
  }

  bool _isMarkerTapped = false;
  bool get isMarkerTapped => _isMarkerTapped;
  set isMarkerTapped(bool value) {
    _isMarkerTapped = value;
  }

  String _newCategoryTyped = '';
  String get newCategoryTyped => _newCategoryTyped;
  set newCategoryTyped(String value) {
    _newCategoryTyped = value;
  }

  dynamic _CCats;
  dynamic get CCats => _CCats;
  set CCats(dynamic value) {
    _CCats = value;
  }

  bool _mapDataReady = false;
  bool get mapDataReady => _mapDataReady;
  set mapDataReady(bool value) {
    _mapDataReady = value;
  }

  String _dowellKey = 'EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr';
  String get dowellKey => _dowellKey;
  set dowellKey(String value) {
    _dowellKey = value;
  }

  String _sessionId = 'null';
  String get sessionId => _sessionId;
  set sessionId(String value) {
    _sessionId = value;
    prefs.setString('ff_sessionId', value);
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
    prefs.setString('ff_username', value);
  }

  String _otherorgid = '';
  String get otherorgid => _otherorgid;
  set otherorgid(String value) {
    _otherorgid = value;
    prefs.setString('ff_otherorgid', value);
  }

  bool _isAuthUser = false;
  bool get isAuthUser => _isAuthUser;
  set isAuthUser(bool value) {
    _isAuthUser = value;
    prefs.setBool('ff_isAuthUser', value);
  }

  String _credit = '0';
  String get credit => _credit;
  set credit(String value) {
    _credit = value;
  }

  String _apiKey = '';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    prefs.setString('ff_apiKey', value);
  }

  bool _showBottomSheet = false;
  bool get showBottomSheet => _showBottomSheet;
  set showBottomSheet(bool value) {
    _showBottomSheet = value;
  }

  dynamic _MyMapResponseData;
  dynamic get MyMapResponseData => _MyMapResponseData;
  set MyMapResponseData(dynamic value) {
    _MyMapResponseData = value;
  }

  bool _isProfiledUser = false;
  bool get isProfiledUser => _isProfiledUser;
  set isProfiledUser(bool value) {
    _isProfiledUser = value;
  }

  List<String> _groupList = [];
  List<String> get groupList => _groupList;
  set groupList(List<String> value) {
    _groupList = value;
    prefs.setStringList('ff_groupList', value);
  }

  void addToGroupList(String value) {
    _groupList.add(value);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void removeFromGroupList(String value) {
    _groupList.remove(value);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void removeAtIndexFromGroupList(int index) {
    _groupList.removeAt(index);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void updateGroupListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _groupList[index] = updateFn(_groupList[index]);
    prefs.setStringList('ff_groupList', _groupList);
  }

  void insertAtIndexInGroupList(int index, String value) {
    _groupList.insert(index, value);
    prefs.setStringList('ff_groupList', _groupList);
  }

  List<dynamic> _groupLocs = [];
  List<dynamic> get groupLocs => _groupLocs;
  set groupLocs(List<dynamic> value) {
    _groupLocs = value;
  }

  void addToGroupLocs(dynamic value) {
    _groupLocs.add(value);
  }

  void removeFromGroupLocs(dynamic value) {
    _groupLocs.remove(value);
  }

  void removeAtIndexFromGroupLocs(int index) {
    _groupLocs.removeAt(index);
  }

  void updateGroupLocsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _groupLocs[index] = updateFn(_groupLocs[index]);
  }

  void insertAtIndexInGroupLocs(int index, dynamic value) {
    _groupLocs.insert(index, value);
  }

  bool _showMyLocs = false;
  bool get showMyLocs => _showMyLocs;
  set showMyLocs(bool value) {
    _showMyLocs = value;
  }

  List<LatLng> _groupCoordLocs = [];
  List<LatLng> get groupCoordLocs => _groupCoordLocs;
  set groupCoordLocs(List<LatLng> value) {
    _groupCoordLocs = value;
  }

  void addToGroupCoordLocs(LatLng value) {
    _groupCoordLocs.add(value);
  }

  void removeFromGroupCoordLocs(LatLng value) {
    _groupCoordLocs.remove(value);
  }

  void removeAtIndexFromGroupCoordLocs(int index) {
    _groupCoordLocs.removeAt(index);
  }

  void updateGroupCoordLocsAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    _groupCoordLocs[index] = updateFn(_groupCoordLocs[index]);
  }

  void insertAtIndexInGroupCoordLocs(int index, LatLng value) {
    _groupCoordLocs.insert(index, value);
  }

  List<String> _groupAddress = [];
  List<String> get groupAddress => _groupAddress;
  set groupAddress(List<String> value) {
    _groupAddress = value;
  }

  void addToGroupAddress(String value) {
    _groupAddress.add(value);
  }

  void removeFromGroupAddress(String value) {
    _groupAddress.remove(value);
  }

  void removeAtIndexFromGroupAddress(int index) {
    _groupAddress.removeAt(index);
  }

  void updateGroupAddressAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _groupAddress[index] = updateFn(_groupAddress[index]);
  }

  void insertAtIndexInGroupAddress(int index, String value) {
    _groupAddress.insert(index, value);
  }

  List<String> _groupIds = [];
  List<String> get groupIds => _groupIds;
  set groupIds(List<String> value) {
    _groupIds = value;
  }

  void addToGroupIds(String value) {
    _groupIds.add(value);
  }

  void removeFromGroupIds(String value) {
    _groupIds.remove(value);
  }

  void removeAtIndexFromGroupIds(int index) {
    _groupIds.removeAt(index);
  }

  void updateGroupIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _groupIds[index] = updateFn(_groupIds[index]);
  }

  void insertAtIndexInGroupIds(int index, String value) {
    _groupIds.insert(index, value);
  }

  dynamic _toEditJson;
  dynamic get toEditJson => _toEditJson;
  set toEditJson(dynamic value) {
    _toEditJson = value;
  }

  String _deleteId = '';
  String get deleteId => _deleteId;
  set deleteId(String value) {
    _deleteId = value;
  }

  dynamic _response;
  dynamic get response => _response;
  set response(dynamic value) {
    _response = value;
    prefs.setString('ff_response', jsonEncode(value));
  }

  bool _noMoreCredit = false;
  bool get noMoreCredit => _noMoreCredit;
  set noMoreCredit(bool value) {
    _noMoreCredit = value;
  }

  bool _isGettingDroupLocations = false;
  bool get isGettingDroupLocations => _isGettingDroupLocations;
  set isGettingDroupLocations(bool value) {
    _isGettingDroupLocations = value;
  }

  bool _showTrackingToggler = false;
  bool get showTrackingToggler => _showTrackingToggler;
  set showTrackingToggler(bool value) {
    _showTrackingToggler = value;
  }

  bool _isDestinationSelected = false;
  bool get isDestinationSelected => _isDestinationSelected;
  set isDestinationSelected(bool value) {
    _isDestinationSelected = value;
  }

  List<dynamic> _convertedCordinate = [];
  List<dynamic> get convertedCordinate => _convertedCordinate;
  set convertedCordinate(List<dynamic> value) {
    _convertedCordinate = value;
  }

  void addToConvertedCordinate(dynamic value) {
    _convertedCordinate.add(value);
  }

  void removeFromConvertedCordinate(dynamic value) {
    _convertedCordinate.remove(value);
  }

  void removeAtIndexFromConvertedCordinate(int index) {
    _convertedCordinate.removeAt(index);
  }

  void updateConvertedCordinateAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _convertedCordinate[index] = updateFn(_convertedCordinate[index]);
  }

  void insertAtIndexInConvertedCordinate(int index, dynamic value) {
    _convertedCordinate.insert(index, value);
  }

  int _squareCounts = 0;
  int get squareCounts => _squareCounts;
  set squareCounts(int value) {
    _squareCounts = value;
  }

  String _qr = '';
  String get qr => _qr;
  set qr(String value) {
    _qr = value;
  }

  dynamic _guestUserDetails;
  dynamic get guestUserDetails => _guestUserDetails;
  set guestUserDetails(dynamic value) {
    _guestUserDetails = value;
  }

  String _guestName = '';
  String get guestName => _guestName;
  set guestName(String value) {
    _guestName = value;
  }

  String _guestEmail = 'email';
  String get guestEmail => _guestEmail;
  set guestEmail(String value) {
    _guestEmail = value;
    prefs.setString('ff_guestEmail', value);
  }

  String _guestCompanyName = '';
  String get guestCompanyName => _guestCompanyName;
  set guestCompanyName(String value) {
    _guestCompanyName = value;
  }

  String _guestCountry = '';
  String get guestCountry => _guestCountry;
  set guestCountry(String value) {
    _guestCountry = value;
  }

  bool _allowLocationTracking = false;
  bool get allowLocationTracking => _allowLocationTracking;
  set allowLocationTracking(bool value) {
    _allowLocationTracking = value;
    prefs.setBool('ff_allowLocationTracking', value);
  }

  String _guestUserId = '';
  String get guestUserId => _guestUserId;
  set guestUserId(String value) {
    _guestUserId = value;
    prefs.setString('ff_guestUserId', value);
  }

  String _guestCompanyId = '';
  String get guestCompanyId => _guestCompanyId;
  set guestCompanyId(String value) {
    _guestCompanyId = value;
    prefs.setString('ff_guestCompanyId', value);
  }

  dynamic _userMembers;
  dynamic get userMembers => _userMembers;
  set userMembers(dynamic value) {
    _userMembers = value;
  }

  List<String> _teamList = [];
  List<String> get teamList => _teamList;
  set teamList(List<String> value) {
    _teamList = value;
  }

  void addToTeamList(String value) {
    _teamList.add(value);
  }

  void removeFromTeamList(String value) {
    _teamList.remove(value);
  }

  void removeAtIndexFromTeamList(int index) {
    _teamList.removeAt(index);
  }

  void updateTeamListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _teamList[index] = updateFn(_teamList[index]);
  }

  void insertAtIndexInTeamList(int index, String value) {
    _teamList.insert(index, value);
  }

  TeamModelStruct _activeTeam = TeamModelStruct();
  TeamModelStruct get activeTeam => _activeTeam;
  set activeTeam(TeamModelStruct value) {
    _activeTeam = value;
  }

  void updateActiveTeamStruct(Function(TeamModelStruct) updateFn) {
    updateFn(_activeTeam);
  }

  List<MemberModelStruct> _currentMemberList = [];
  List<MemberModelStruct> get currentMemberList => _currentMemberList;
  set currentMemberList(List<MemberModelStruct> value) {
    _currentMemberList = value;
  }

  void addToCurrentMemberList(MemberModelStruct value) {
    _currentMemberList.add(value);
  }

  void removeFromCurrentMemberList(MemberModelStruct value) {
    _currentMemberList.remove(value);
  }

  void removeAtIndexFromCurrentMemberList(int index) {
    _currentMemberList.removeAt(index);
  }

  void updateCurrentMemberListAtIndex(
    int index,
    MemberModelStruct Function(MemberModelStruct) updateFn,
  ) {
    _currentMemberList[index] = updateFn(_currentMemberList[index]);
  }

  void insertAtIndexInCurrentMemberList(int index, MemberModelStruct value) {
    _currentMemberList.insert(index, value);
  }

  bool _isFirstLaunchAfterInstall = true;
  bool get isFirstLaunchAfterInstall => _isFirstLaunchAfterInstall;
  set isFirstLaunchAfterInstall(bool value) {
    _isFirstLaunchAfterInstall = value;
    prefs.setBool('ff_isFirstLaunchAfterInstall', value);
  }

  String _linkId = '';
  String get linkId => _linkId;
  set linkId(String value) {
    _linkId = value;
    prefs.setString('ff_linkId', value);
  }

  String _qrlink = '';
  String get qrlink => _qrlink;
  set qrlink(String value) {
    _qrlink = value;
  }

  bool _isQrFinalized = false;
  bool get isQrFinalized => _isQrFinalized;
  set isQrFinalized(bool value) {
    _isQrFinalized = value;
  }

  List<dynamic> _trackingData = [];
  List<dynamic> get trackingData => _trackingData;
  set trackingData(List<dynamic> value) {
    _trackingData = value;
    prefs.setStringList(
        'ff_trackingData', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTrackingData(dynamic value) {
    _trackingData.add(value);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTrackingData(dynamic value) {
    _trackingData.remove(value);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTrackingData(int index) {
    _trackingData.removeAt(index);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void updateTrackingDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _trackingData[index] = updateFn(_trackingData[index]);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTrackingData(int index, dynamic value) {
    _trackingData.insert(index, value);
    prefs.setStringList(
        'ff_trackingData', _trackingData.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _teamMembers = [];
  List<dynamic> get teamMembers => _teamMembers;
  set teamMembers(List<dynamic> value) {
    _teamMembers = value;
  }

  void addToTeamMembers(dynamic value) {
    _teamMembers.add(value);
  }

  void removeFromTeamMembers(dynamic value) {
    _teamMembers.remove(value);
  }

  void removeAtIndexFromTeamMembers(int index) {
    _teamMembers.removeAt(index);
  }

  void updateTeamMembersAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _teamMembers[index] = updateFn(_teamMembers[index]);
  }

  void insertAtIndexInTeamMembers(int index, dynamic value) {
    _teamMembers.insert(index, value);
  }

  List<dynamic> _guestMembers = [];
  List<dynamic> get guestMembers => _guestMembers;
  set guestMembers(List<dynamic> value) {
    _guestMembers = value;
  }

  void addToGuestMembers(dynamic value) {
    _guestMembers.add(value);
  }

  void removeFromGuestMembers(dynamic value) {
    _guestMembers.remove(value);
  }

  void removeAtIndexFromGuestMembers(int index) {
    _guestMembers.removeAt(index);
  }

  void updateGuestMembersAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _guestMembers[index] = updateFn(_guestMembers[index]);
  }

  void insertAtIndexInGuestMembers(int index, dynamic value) {
    _guestMembers.insert(index, value);
  }

  List<String> _selectedMembers = [];
  List<String> get selectedMembers => _selectedMembers;
  set selectedMembers(List<String> value) {
    _selectedMembers = value;
  }

  void addToSelectedMembers(String value) {
    _selectedMembers.add(value);
  }

  void removeFromSelectedMembers(String value) {
    _selectedMembers.remove(value);
  }

  void removeAtIndexFromSelectedMembers(int index) {
    _selectedMembers.removeAt(index);
  }

  void updateSelectedMembersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _selectedMembers[index] = updateFn(_selectedMembers[index]);
  }

  void insertAtIndexInSelectedMembers(int index, String value) {
    _selectedMembers.insert(index, value);
  }

  String _trackingTeam = '';
  String get trackingTeam => _trackingTeam;
  set trackingTeam(String value) {
    _trackingTeam = value;
  }

  List<bool> _selectmode = [];
  List<bool> get selectmode => _selectmode;
  set selectmode(List<bool> value) {
    _selectmode = value;
  }

  void addToSelectmode(bool value) {
    _selectmode.add(value);
  }

  void removeFromSelectmode(bool value) {
    _selectmode.remove(value);
  }

  void removeAtIndexFromSelectmode(int index) {
    _selectmode.removeAt(index);
  }

  void updateSelectmodeAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    _selectmode[index] = updateFn(_selectmode[index]);
  }

  void insertAtIndexInSelectmode(int index, bool value) {
    _selectmode.insert(index, value);
  }

  String _activeTeamName = '';
  String get activeTeamName => _activeTeamName;
  set activeTeamName(String value) {
    _activeTeamName = value;
  }

  bool _deletingFromMain = false;
  bool get deletingFromMain => _deletingFromMain;
  set deletingFromMain(bool value) {
    _deletingFromMain = value;
  }

  List<String> _myMapOrgNames = [];
  List<String> get myMapOrgNames => _myMapOrgNames;
  set myMapOrgNames(List<String> value) {
    _myMapOrgNames = value;
  }

  void addToMyMapOrgNames(String value) {
    _myMapOrgNames.add(value);
  }

  void removeFromMyMapOrgNames(String value) {
    _myMapOrgNames.remove(value);
  }

  void removeAtIndexFromMyMapOrgNames(int index) {
    _myMapOrgNames.removeAt(index);
  }

  void updateMyMapOrgNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _myMapOrgNames[index] = updateFn(_myMapOrgNames[index]);
  }

  void insertAtIndexInMyMapOrgNames(int index, String value) {
    _myMapOrgNames.insert(index, value);
  }

  bool _timerStarted = false;
  bool get timerStarted => _timerStarted;
  set timerStarted(bool value) {
    _timerStarted = value;
  }

  GuestInfoStruct _guestGenInfo = GuestInfoStruct();
  GuestInfoStruct get guestGenInfo => _guestGenInfo;
  set guestGenInfo(GuestInfoStruct value) {
    _guestGenInfo = value;
    prefs.setString('ff_guestGenInfo', value.serialize());
  }

  void updateGuestGenInfoStruct(Function(GuestInfoStruct) updateFn) {
    updateFn(_guestGenInfo);
    prefs.setString('ff_guestGenInfo', _guestGenInfo.serialize());
  }

  List<dynamic> _myMapOrgs = [];
  List<dynamic> get myMapOrgs => _myMapOrgs;
  set myMapOrgs(List<dynamic> value) {
    _myMapOrgs = value;
    prefs.setStringList(
        'ff_myMapOrgs', value.map((x) => jsonEncode(x)).toList());
  }

  void addToMyMapOrgs(dynamic value) {
    _myMapOrgs.add(value);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMyMapOrgs(dynamic value) {
    _myMapOrgs.remove(value);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMyMapOrgs(int index) {
    _myMapOrgs.removeAt(index);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void updateMyMapOrgsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myMapOrgs[index] = updateFn(_myMapOrgs[index]);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInMyMapOrgs(int index, dynamic value) {
    _myMapOrgs.insert(index, value);
    prefs.setStringList(
        'ff_myMapOrgs', _myMapOrgs.map((x) => jsonEncode(x)).toList());
  }

  List<String> _orgByIdTeams = [];
  List<String> get orgByIdTeams => _orgByIdTeams;
  set orgByIdTeams(List<String> value) {
    _orgByIdTeams = value;
    prefs.setStringList('ff_orgByIdTeams', value);
  }

  void addToOrgByIdTeams(String value) {
    _orgByIdTeams.add(value);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void removeFromOrgByIdTeams(String value) {
    _orgByIdTeams.remove(value);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void removeAtIndexFromOrgByIdTeams(int index) {
    _orgByIdTeams.removeAt(index);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void updateOrgByIdTeamsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _orgByIdTeams[index] = updateFn(_orgByIdTeams[index]);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  void insertAtIndexInOrgByIdTeams(int index, String value) {
    _orgByIdTeams.insert(index, value);
    prefs.setStringList('ff_orgByIdTeams', _orgByIdTeams);
  }

  bool _clearmap = false;
  bool get clearmap => _clearmap;
  set clearmap(bool value) {
    _clearmap = value;
  }

  String _webGoogleApiKey = 'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ';
  String get webGoogleApiKey => _webGoogleApiKey;
  set webGoogleApiKey(String value) {
    _webGoogleApiKey = value;
  }

  String _publicScannedValue = '';
  String get publicScannedValue => _publicScannedValue;
  set publicScannedValue(String value) {
    _publicScannedValue = value;
    prefs.setString('ff_publicScannedValue', value);
  }

  bool _isOwner = false;
  bool get isOwner => _isOwner;
  set isOwner(bool value) {
    _isOwner = value;
    prefs.setBool('ff_isOwner', value);
  }

  List<dynamic> _emptyList = [];
  List<dynamic> get emptyList => _emptyList;
  set emptyList(List<dynamic> value) {
    _emptyList = value;
  }

  void addToEmptyList(dynamic value) {
    _emptyList.add(value);
  }

  void removeFromEmptyList(dynamic value) {
    _emptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    _emptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _emptyList[index] = updateFn(_emptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, dynamic value) {
    _emptyList.insert(index, value);
  }

  String _androidGoogleMapKey = 'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4';
  String get androidGoogleMapKey => _androidGoogleMapKey;
  set androidGoogleMapKey(String value) {
    _androidGoogleMapKey = value;
  }

  String _iosGoogleMapKey = 'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk';
  String get iosGoogleMapKey => _iosGoogleMapKey;
  set iosGoogleMapKey(String value) {
    _iosGoogleMapKey = value;
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
