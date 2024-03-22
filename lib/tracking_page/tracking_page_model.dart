import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tracking_page_widget.dart' show TrackingPageWidget;
import 'package:flutter/material.dart';

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
