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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenVersion2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? iip;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ipify)] action in HomeScreenVersion2 widget.
  ApiCallResponse? ipAddress;
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
  // Stores action output result for [Custom Action - newCustomAction] action in IconButton widget.
  List<LatLng>? result;
  // Stores action output result for [Custom Action - newCustomAction3] action in IconButton widget.
  List<String>? addr;
  // Stores action output result for [Backend Call - API (Create Event)] action in IconButton widget.
  ApiCallResponse? evenntID;
  // Stores action output result for [Backend Call - API (Nearby Places Data)] action in IconButton widget.
  ApiCallResponse? doWellMap;
  // Stores action output result for [Backend Call - API (Send Log Data)] action in IconButton widget.
  ApiCallResponse? logResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
