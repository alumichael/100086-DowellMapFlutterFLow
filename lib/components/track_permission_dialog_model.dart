import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'track_permission_dialog_widget.dart' show TrackPermissionDialogWidget;
import 'package:flutter/material.dart';

class TrackPermissionDialogModel
    extends FlutterFlowModel<TrackPermissionDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Fetch User)] action in Button widget.
  ApiCallResponse? fetchResult;
  // Stores action output result for [Backend Call - API (Insert User)] action in Button widget.
  ApiCallResponse? insertionResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
