import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_bottom_sheet_widget.dart' show SearchBottomSheetWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchBottomSheetModel extends FlutterFlowModel<SearchBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

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
  // Stores action output result for [Backend Call - API (GetMymap)] action in searchButton widget.
  ApiCallResponse? mymapBackendRefinedResult;
  // Stores action output result for [Custom Action - getLocatCordFromString] action in searchButton widget.
  List<LatLng>? dblocationCord;
  // Stores action output result for [Custom Action - getDbPlaceName] action in searchButton widget.
  List<String>? dbPlacename;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    searchFocusNode?.dispose();
    searchController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
