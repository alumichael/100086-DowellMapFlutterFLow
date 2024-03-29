import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'track_permission_widget.dart' show TrackPermissionWidget;
import 'package:flutter/material.dart';

class TrackPermissionModel extends FlutterFlowModel<TrackPermissionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (FinalizedLink)] action in Button widget.
  ApiCallResponse? finalizeReponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
