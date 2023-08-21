import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlacedetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Create Event)] action in Stack widget.
  ApiCallResponse? myMapEventId;
  // State field(s) for PlaceName_edt widget.
  TextEditingController? placeNameEdtController;
  String? Function(BuildContext, String?)? placeNameEdtControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Address_edt widget.
  TextEditingController? addressEdtController;
  String? Function(BuildContext, String?)? addressEdtControllerValidator;
  // State field(s) for Open_hours_edt widget.
  TextEditingController? openHoursEdtController;
  String? Function(BuildContext, String?)? openHoursEdtControllerValidator;
  // State field(s) for phonr_num_edt widget.
  TextEditingController? phonrNumEdtController;
  String? Function(BuildContext, String?)? phonrNumEdtControllerValidator;
  // Stores action output result for [Backend Call - API (Create Event)] action in Button widget.
  ApiCallResponse? myMapEvent;
  // Stores action output result for [Backend Call - API (mymap)] action in Button widget.
  ApiCallResponse? addMyMap;
  // State field(s) for country_edt widget.
  TextEditingController? countryEdtController;
  String? Function(BuildContext, String?)? countryEdtControllerValidator;
  // State field(s) for SelectedLocation_edt widget.
  TextEditingController? selectedLocationEdtController;
  String? Function(BuildContext, String?)?
      selectedLocationEdtControllerValidator;
  // State field(s) for website_edt widget.
  TextEditingController? websiteEdtController;
  String? Function(BuildContext, String?)? websiteEdtControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    placeNameEdtController?.dispose();
    addressEdtController?.dispose();
    openHoursEdtController?.dispose();
    phonrNumEdtController?.dispose();
    countryEdtController?.dispose();
    selectedLocationEdtController?.dispose();
    websiteEdtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
