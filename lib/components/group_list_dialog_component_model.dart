import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'group_list_dialog_component_widget.dart'
    show GroupListDialogComponentWidget;
import 'package:flutter/material.dart';

class GroupListDialogComponentModel
    extends FlutterFlowModel<GroupListDialogComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Get Location by group name)] action in DropDown widget.
  ApiCallResponse? getLocationbyGroupResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
