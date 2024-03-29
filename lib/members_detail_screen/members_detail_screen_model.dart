import '/flutter_flow/flutter_flow_util.dart';
import 'members_detail_screen_widget.dart' show MembersDetailScreenWidget;
import 'package:flutter/material.dart';

class MembersDetailScreenModel
    extends FlutterFlowModel<MembersDetailScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
