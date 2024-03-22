import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'buttom_sheet_widget.dart' show ButtomSheetWidget;
import 'package:flutter/material.dart';

class ButtomSheetModel extends FlutterFlowModel<ButtomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  // Stores action output result for [Backend Call - API (NearbyPlace)] action in searchButton widget.
  ApiCallResponse? nearbyPlaceResponse;
  // Stores action output result for [Custom Action - refineGoogleResult] action in searchButton widget.
  List<LatLng>? googleResult;
  // Stores action output result for [Custom Action - refineplaceid] action in searchButton widget.
  List<String>? placeIDs;
  // Stores action output result for [Custom Action - getGooglePlaceName] action in searchButton widget.
  List<String>? googlePlaceName;
  // Stores action output result for [Backend Call - API (Create Event)] action in searchButton widget.
  ApiCallResponse? evenntID;
  // Stores action output result for [Custom Action - getAddressFromLatLng] action in searchButton widget.
  String? currentAddress;
  // Stores action output result for [Backend Call - API (GetMymap)] action in searchButton widget.
  ApiCallResponse? mymapBackendRefinedResult;
  // Stores action output result for [Custom Action - getLocatCordFromString] action in searchButton widget.
  List<LatLng>? dblocationCord;
  // Stores action output result for [Custom Action - getDbPlaceName] action in searchButton widget.
  List<String>? dbPlacename;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    searchFocusNode?.dispose();
    searchController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
