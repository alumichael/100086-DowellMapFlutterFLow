// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

Future<dynamic> qRCodeScanner() async {
  // Add your function code here!
  dynamic barcodeScanRes;
  dynamic scanResultString;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    scanResultString = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    // barcodeScanResult(barcodeScanRes);
    print("::::: the qrCode scanner is ::::: $scanResultString");
    barcodeScanRes =
        scanResultString.replaceAll("\'", "\"").replaceAll("Fa", "fa");
  } on PlatformException {
    scanResultString = 'Failed to get platform version.';
  }

  return barcodeScanRes;
}
