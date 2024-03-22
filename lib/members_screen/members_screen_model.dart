import '/components/internal_member_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'members_screen_widget.dart' show MembersScreenWidget;
import 'package:flutter/material.dart';

class MembersScreenModel extends FlutterFlowModel<MembersScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for InternalMemberBox dynamic component.
  late FlutterFlowDynamicModels<InternalMemberBoxModel> internalMemberBoxModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    internalMemberBoxModels =
        FlutterFlowDynamicModels(() => InternalMemberBoxModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    internalMemberBoxModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
