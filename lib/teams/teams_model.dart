import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/newteam_widget.dart';
import '/components/team_deletion_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'teams_widget.dart' show TeamsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TeamsModel extends FlutterFlowModel<TeamsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetTeamsByUsername)] action in Teams widget.
  ApiCallResponse? getTeamsResponse;
  // Stores action output result for [Backend Call - API (GetMemberByTeamName)] action in Container widget.
  ApiCallResponse? fetchMembers;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
