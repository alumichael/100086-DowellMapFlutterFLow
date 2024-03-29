import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_group_dialog_widget.dart' show AddGroupDialogWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addgrouptextfieldFocusNode?.dispose();
    addgrouptextfieldController?.dispose();
  }
}
