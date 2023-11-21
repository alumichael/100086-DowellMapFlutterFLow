import '/backend/api_requests/api_calls.dart';
import '/components/searchbox_copy_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import 'maps_widget.dart' show MapsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class MapsModel extends FlutterFlowModel<MapsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getIpAddress] action in maps widget.
  String? ip;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Model for searchboxCopy component.
  late SearchboxCopyModel searchboxCopyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchboxCopyModel = createModel(context, () => SearchboxCopyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchboxCopyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
