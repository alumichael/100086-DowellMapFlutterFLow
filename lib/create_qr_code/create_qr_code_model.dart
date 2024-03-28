import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_qr_code_widget.dart' show CreateQrCodeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateQrCodeModel extends FlutterFlowModel<CreateQrCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getUserInfo)] action in Button widget.
  ApiCallResponse? getUserInfoResponse;
  // Stores action output result for [Backend Call - API (Get Public Links)] action in Button widget.
  ApiCallResponse? getPublicUseIdResponse;
  // Stores action output result for [Backend Call - API (Generate QRcode)] action in Button widget.
  ApiCallResponse? getQRCodeResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
