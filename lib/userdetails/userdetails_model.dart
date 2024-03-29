import '/flutter_flow/flutter_flow_util.dart';
import 'userdetails_widget.dart' show UserdetailsWidget;
import 'package:flutter/material.dart';

class UserdetailsModel extends FlutterFlowModel<UserdetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
