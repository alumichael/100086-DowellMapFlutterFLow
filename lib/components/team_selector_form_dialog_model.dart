import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'team_selector_form_dialog_widget.dart'
    show TeamSelectorFormDialogWidget;
import 'package:flutter/material.dart';

class TeamSelectorFormDialogModel
    extends FlutterFlowModel<TeamSelectorFormDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - API (FindTeamByOrgId)] action in DropDown widget.
  ApiCallResponse? fetchrgTeam;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
