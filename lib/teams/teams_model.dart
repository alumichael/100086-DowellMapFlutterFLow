import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'teams_widget.dart' show TeamsWidget;
import 'package:flutter/material.dart';

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
