import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'track_permission_widget.dart' show TrackPermissionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackPermissionModel extends FlutterFlowModel<TrackPermissionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Fetch User)] action in Button widget.
  ApiCallResponse? fetchResultAuthUser;
  // Stores action output result for [Backend Call - API (Insert User)] action in Button widget.
  ApiCallResponse? insertionResultAuthUser;
  // Stores action output result for [Backend Call - API (Fetch User)] action in Button widget.
  ApiCallResponse? fetchResult;
  // Stores action output result for [Backend Call - API (Insert User)] action in Button widget.
  ApiCallResponse? insertionResult;
  // Stores action output result for [Backend Call - API (FinalizedLink)] action in Button widget.
  ApiCallResponse? finalizeReponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
