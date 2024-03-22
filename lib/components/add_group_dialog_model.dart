import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_group_dialog_widget.dart' show AddGroupDialogWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddGroupDialogModel extends FlutterFlowModel<AddGroupDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for addgrouptextfield widget.
  FocusNode? addgrouptextfieldFocusNode;
  TextEditingController? addgrouptextfieldController;
  String? Function(BuildContext, String?)? addgrouptextfieldControllerValidator;
  // Stores action output result for [Backend Call - API (Create Location Group)] action in ButtonAdd widget.
  ApiCallResponse? apiResultfz0;
  // Stores action output result for [Backend Call - API (Create Profile)] action in ButtonAdd widget.
  ApiCallResponse? createprofileResponse;
  // Stores action output result for [Backend Call - API (Create Location Group)] action in ButtonAdd widget.
  ApiCallResponse? apiResultsf5;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addgrouptextfieldFocusNode?.dispose();
    addgrouptextfieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
