import '/backend/api_requests/api_calls.dart';
import '/components/add_group_dialog_widget.dart';
import '/components/image_widget.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'tracking_page_widget.dart' show TrackingPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TrackingPageModel extends FlutterFlowModel<TrackingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkLocationEnabled] action in TrackingPage widget.
  bool? isLocationEnable;
  // Stores action output result for [Backend Call - API (ipify)] action in TrackingPage widget.
  ApiCallResponse? myIPAddress;
  // Stores action output result for [Backend Call - API (link bage login )] action in TrackingPage widget.
  ApiCallResponse? apiResultzlp;
  // Stores action output result for [Backend Call - API (Get User API Key)] action in TrackingPage widget.
  ApiCallResponse? serviceApiKey;
  // Stores action output result for [Backend Call - API (Get Location by User)] action in TrackingPage widget.
  ApiCallResponse? getLocationByUserResponse;
  // Stores action output result for [Backend Call - API (Get User API Key)] action in Text widget.
  ApiCallResponse? serviceApiKeyCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Convert coordinates)] action in TextField widget.
  ApiCallResponse? convertedCordinateResponse;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
