import '/backend/schema/structs/index.dart';
import '/components/internal_member_box_widget.dart';
import '/components/member_main_options_widget.dart';
import '/components/new_member_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'members_screen_widget.dart' show MembersScreenWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
