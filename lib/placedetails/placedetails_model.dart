import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'placedetails_widget.dart' show PlacedetailsWidget;
import 'package:flutter/material.dart';

class PlacedetailsModel extends FlutterFlowModel<PlacedetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Create Event)] action in Stack widget.
  ApiCallResponse? myMapEventId;
  // State field(s) for Address_edt widget.
  FocusNode? addressEdtFocusNode;
  TextEditingController? addressEdtController;
  String? Function(BuildContext, String?)? addressEdtControllerValidator;
  // State field(s) for Open_hours_edt widget.
  FocusNode? openHoursEdtFocusNode;
  TextEditingController? openHoursEdtController;
  String? Function(BuildContext, String?)? openHoursEdtControllerValidator;
  // State field(s) for phonr_num_edt widget.
  FocusNode? phonrNumEdtFocusNode;
  TextEditingController? phonrNumEdtController;
  String? Function(BuildContext, String?)? phonrNumEdtControllerValidator;
  // Stores action output result for [Backend Call - API (Process Product Request)] action in Button widget.
  ApiCallResponse? addMyMapServiceResponse;
  // Stores action output result for [Backend Call - API (Create Event)] action in Button widget.
  ApiCallResponse? myMapEvent;
  // Stores action output result for [Backend Call - API (mymap)] action in Button widget.
  ApiCallResponse? addMyMap;
  // State field(s) for country_edt widget.
  FocusNode? countryEdtFocusNode;
  TextEditingController? countryEdtController;
  String? Function(BuildContext, String?)? countryEdtControllerValidator;
  // State field(s) for website_edt widget.
  FocusNode? websiteEdtFocusNode1;
  TextEditingController? websiteEdtController1;
  String? Function(BuildContext, String?)? websiteEdtController1Validator;
  // State field(s) for PlaceName_edt widget.
  FocusNode? placeNameEdtFocusNode;
  TextEditingController? placeNameEdtController;
  String? Function(BuildContext, String?)? placeNameEdtControllerValidator;
  // State field(s) for SelectedLocation_edt widget.
  FocusNode? selectedLocationEdtFocusNode;
  TextEditingController? selectedLocationEdtController;
  String? Function(BuildContext, String?)?
      selectedLocationEdtControllerValidator;
  // State field(s) for website_edt widget.
  FocusNode? websiteEdtFocusNode2;
  TextEditingController? websiteEdtController2;
  String? Function(BuildContext, String?)? websiteEdtController2Validator;
  // State field(s) for select_collection_dropdown widget.
  String? selectCollectionDropdownValue;
  FormFieldController<String>? selectCollectionDropdownValueController;
  // State field(s) for category_dropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    addressEdtFocusNode?.dispose();
    addressEdtController?.dispose();

    openHoursEdtFocusNode?.dispose();
    openHoursEdtController?.dispose();

    phonrNumEdtFocusNode?.dispose();
    phonrNumEdtController?.dispose();

    countryEdtFocusNode?.dispose();
    countryEdtController?.dispose();

    websiteEdtFocusNode1?.dispose();
    websiteEdtController1?.dispose();

    placeNameEdtFocusNode?.dispose();
    placeNameEdtController?.dispose();

    selectedLocationEdtFocusNode?.dispose();
    selectedLocationEdtController?.dispose();

    websiteEdtFocusNode2?.dispose();
    websiteEdtController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
