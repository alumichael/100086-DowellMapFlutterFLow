import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_qr_code_widget.dart' show CreateQrCodeWidget;
import 'package:flutter/material.dart';

class CreateQrCodeModel extends FlutterFlowModel<CreateQrCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getUserInfo)] action in Button widget.
  ApiCallResponse? getUserInfoResponse;
  // Stores action output result for [Backend Call - API (Get Public Links)] action in Button widget.
  ApiCallResponse? getPublicUseIdResponse;
  // Stores action output result for [Backend Call - API (Generate QRcode)] action in Button widget.
  ApiCallResponse? getQRCodeResponse;

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
