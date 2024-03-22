import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_members_dialog_widget.dart' show NewMembersDialogWidget;
import 'package:flutter/material.dart';

class NewMembersDialogModel extends FlutterFlowModel<NewMembersDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Add Member to Team)] action in Button widget.
  ApiCallResponse? createMemberResponse;
  // Stores action output result for [Backend Call - API (GetTeamsByUsername)] action in Button widget.
  ApiCallResponse? fetchUser;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
