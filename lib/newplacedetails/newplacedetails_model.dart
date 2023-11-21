import '/backend/api_requests/api_calls.dart';
import '/components/add_group_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'newplacedetails_widget.dart' show NewplacedetailsWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewplacedetailsModel extends FlutterFlowModel<NewplacedetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for selectgroup widget.
  String? selectgroupValue;
  FormFieldController<String>? selectgroupValueController;
  // State field(s) for PlaceName_edt widget.
  FocusNode? placeNameEdtFocusNode;
  TextEditingController? placeNameEdtController;
  String? Function(BuildContext, String?)? placeNameEdtControllerValidator;
  // State field(s) for Address_edt widget.
  FocusNode? addressEdtFocusNode;
  TextEditingController? addressEdtController;
  String? Function(BuildContext, String?)? addressEdtControllerValidator;
  // State field(s) for category_dropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // State field(s) for SelectedLocation_edt widget.
  FocusNode? selectedLocationEdtFocusNode;
  TextEditingController? selectedLocationEdtController;
  String? Function(BuildContext, String?)?
      selectedLocationEdtControllerValidator;
  // State field(s) for Open_hours_edt widget.
  FocusNode? openHoursEdtFocusNode;
  TextEditingController? openHoursEdtController;
  String? Function(BuildContext, String?)? openHoursEdtControllerValidator;
  // State field(s) for phonr_num_edt widget.
  FocusNode? phonrNumEdtFocusNode;
  TextEditingController? phonrNumEdtController;
  String? Function(BuildContext, String?)? phonrNumEdtControllerValidator;
  // State field(s) for country_edt widget.
  FocusNode? countryEdtFocusNode;
  TextEditingController? countryEdtController;
  String? Function(BuildContext, String?)? countryEdtControllerValidator;
  // State field(s) for website_edt widget.
  FocusNode? websiteEdtFocusNode;
  TextEditingController? websiteEdtController;
  String? Function(BuildContext, String?)? websiteEdtControllerValidator;
  // Stores action output result for [Backend Call - API (Create Location)] action in Button widget.
  ApiCallResponse? addLocation;
  // Stores action output result for [Backend Call - API (Update Location)] action in Button widget.
  ApiCallResponse? apiResultms0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    placeNameEdtFocusNode?.dispose();
    placeNameEdtController?.dispose();

    addressEdtFocusNode?.dispose();
    addressEdtController?.dispose();

    selectedLocationEdtFocusNode?.dispose();
    selectedLocationEdtController?.dispose();

    openHoursEdtFocusNode?.dispose();
    openHoursEdtController?.dispose();

    phonrNumEdtFocusNode?.dispose();
    phonrNumEdtController?.dispose();

    countryEdtFocusNode?.dispose();
    countryEdtController?.dispose();

    websiteEdtFocusNode?.dispose();
    websiteEdtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
