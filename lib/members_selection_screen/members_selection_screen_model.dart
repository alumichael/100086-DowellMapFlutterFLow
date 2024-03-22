import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'members_selection_screen_widget.dart' show MembersSelectionScreenWidget;
import 'package:flutter/material.dart';

class MembersSelectionScreenModel
    extends FlutterFlowModel<MembersSelectionScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Custom Action - combineSelectedMembers] action in Button widget.
  List<dynamic>? combineSelectedResponse;
  // Stores action output result for [Backend Call - API (Add Member to Team)] action in Button widget.
  ApiCallResponse? addingMembers;
  // Stores action output result for [Custom Action - getSelectedEmail] action in Button widget.
  List<dynamic>? selectedListEmailResponse;
  // Stores action output result for [Backend Call - API (SendBulkEmail)] action in Button widget.
  ApiCallResponse? bulkMailresponse;

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
