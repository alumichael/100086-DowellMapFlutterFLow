import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_member_confirm_dialog_widget.dart'
    show AddMemberConfirmDialogWidget;
import 'package:flutter/material.dart';

class AddMemberConfirmDialogModel
    extends FlutterFlowModel<AddMemberConfirmDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Add Member to Team)] action in Button widget.
  ApiCallResponse? addLoginTeamMemberResponse;
  // Stores action output result for [Backend Call - API (sendEmailToSingleUser)] action in Button widget.
  ApiCallResponse? singleMailresponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
