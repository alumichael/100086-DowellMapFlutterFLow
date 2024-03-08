import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_member_confirm_dialog_widget.dart'
    show AddMemberConfirmDialogWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMemberConfirmDialogModel
    extends FlutterFlowModel<AddMemberConfirmDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Add Member to Team)] action in Button widget.
  ApiCallResponse? addLoginTeamMemberResponse;
  // Stores action output result for [Backend Call - API (sendEmailToSingleUser)] action in Button widget.
  ApiCallResponse? singleMailresponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
