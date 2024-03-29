import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qr_scanner_widget.dart' show QrScannerWidget;
import 'package:flutter/material.dart';

class QrScannerModel extends FlutterFlowModel<QrScannerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API ( GetQrCodeById)] action in QrCodeScanner widget.
  ApiCallResponse? apiResult85j;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
