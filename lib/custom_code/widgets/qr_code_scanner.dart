// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  QrCodeScanner({
    Key? key,
    this.width,
    this.height,
    required this.action,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() action;

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  QRViewController? _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  String _scannedCode = '';
  String scaned = '';

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  checkType(String scannedCode) {
    final splitedString = scannedCode.split(' ');
    if (splitedString.length == 1) {
      //either an old qr or link
      setState(() {
        _scannedCode = scannedCode;
        scaned = scannedCode;
        FFAppState().qr = scannedCode;
      });
    } else {
      final qrId = splitedString[4];
      setState(() {
        _scannedCode = qrId;
        scaned = qrId;
        FFAppState().qr = qrId;
      });
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    _controller!.scannedDataStream.listen((scanData) {
      final scanned = scanData.code!;
      // setState(() {
      //   _scannedCode = scanned;
      //   scaned = scanned;
      //   FFAppState().qr = scaned;
      // });
      checkType(scanned);
      widget.action();
    });
  }

  void _launchURL() {
    final uri = Uri.parse(_scannedCode);

    // if (await canLaunchUrl(uri)) {
    launchUrl(uri);
    // } else {
    //   // can't launch url
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _scannedCode == ''
              ? QRView(
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: const Color.fromARGB(30, 76, 175, 79),
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                )
              : GestureDetector(
                  onTap: _launchURL,
                  child: Center(
                    child: SelectableText(
                      _scannedCode,
                      onTap: _launchURL,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
