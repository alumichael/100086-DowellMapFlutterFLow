import '/backend/api_requests/api_calls.dart';
import '/components/add_group_dialog_widget.dart';
import '/components/group_list_dialog_component_widget.dart';
import '/components/image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:async';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'new_home_page_widget.dart' show NewHomePageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewHomePageModel extends FlutterFlowModel<NewHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkLocationEnabled] action in NewHomePage widget.
  bool? isLocationEnable;
  // Stores action output result for [Backend Call - API (ipify)] action in NewHomePage widget.
  ApiCallResponse? myIPAddress;
  // Stores action output result for [Backend Call - API (link bage login )] action in NewHomePage widget.
  ApiCallResponse? apiResultzlp;
  // Stores action output result for [Backend Call - API (Get User API Key)] action in NewHomePage widget.
  ApiCallResponse? serviceApiKey;
  // Stores action output result for [Backend Call - API (Get Location by User)] action in NewHomePage widget.
  ApiCallResponse? getLocationByUserResponse;
  // Stores action output result for [Backend Call - API (Get User API Key)] action in Text widget.
  ApiCallResponse? serviceApiKeyCopy;
  // Stores action output result for [Backend Call - API (Delete Loc)] action in MyMapWidget widget.
  ApiCallResponse? apiResulti6o;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  // Stores action output result for [Backend Call - API (NearbyPlace)] action in searchButton widget.
  ApiCallResponse? nearbyPlaceResponse;
  // Stores action output result for [Backend Call - API (Process Product Request)] action in searchButton widget.
  ApiCallResponse? searchServiceResponse;
  // Stores action output result for [Custom Action - refineGoogleResult] action in searchButton widget.
  List<LatLng>? googleResult;
  // Stores action output result for [Custom Action - refineplaceid] action in searchButton widget.
  List<String>? placeIDs;
  // Stores action output result for [Custom Action - getGooglePlaceName] action in searchButton widget.
  List<String>? googlePlaceName;
  // Stores action output result for [Backend Call - API (Create Event)] action in searchButton widget.
  ApiCallResponse? evenntID;
  // Stores action output result for [Custom Action - getAddressFromLatLng] action in searchButton widget.
  String? currentAddress;
  // Stores action output result for [Backend Call - API (Send Log Data)] action in searchButton widget.
  ApiCallResponse? logResponse;
  // Stores action output result for [Backend Call - API (GetMymap)] action in searchButton widget.
  ApiCallResponse? mymapBackendRefinedResult;
  // Stores action output result for [Backend Call - API (Process Product Request)] action in searchButton widget.
  ApiCallResponse? getLocationServiceResponse;
  // Stores action output result for [Custom Action - getLocatCordFromString] action in searchButton widget.
  List<LatLng>? dblocationCord;
  // Stores action output result for [Custom Action - getDbPlaceName] action in searchButton widget.
  List<String>? dbPlacename;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    searchFocusNode?.dispose();
    searchController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
