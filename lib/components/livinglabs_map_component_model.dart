import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LivinglabsMapComponentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - API (NearbyPlace)] action in IconButton widget.
  ApiCallResponse? nearbyPlaceResponse;
  // Stores action output result for [Custom Action - refineGoogleResult] action in IconButton widget.
  List<LatLng>? googleResult;
  // Stores action output result for [Custom Action - refineplaceid] action in IconButton widget.
  List<String>? placeIDs;
  // Stores action output result for [Custom Action - getGooglePlaceName] action in IconButton widget.
  List<String>? googlePlaceName;
  // Stores action output result for [Backend Call - API (Create Event)] action in IconButton widget.
  ApiCallResponse? evenntID;
  // Stores action output result for [Custom Action - getAddressFromLatLng] action in IconButton widget.
  String? currentAddress;
  // Stores action output result for [Backend Call - API (Send Log Data)] action in IconButton widget.
  ApiCallResponse? logResponse;
  // Stores action output result for [Backend Call - API (GetMymap)] action in IconButton widget.
  ApiCallResponse? mymapBackendRefinedResult;
  // Stores action output result for [Custom Action - getLocatCordFromString] action in IconButton widget.
  List<LatLng>? dblocationCord;
  // Stores action output result for [Custom Action - getDbPlaceName] action in IconButton widget.
  List<String>? dbPlacename;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
