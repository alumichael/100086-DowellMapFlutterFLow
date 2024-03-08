import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'team_selector_form_dialog_widget.dart'
    show TeamSelectorFormDialogWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamSelectorFormDialogModel
    extends FlutterFlowModel<TeamSelectorFormDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for userNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldController;
  String? Function(BuildContext, String?)? userNameTextFieldControllerValidator;
  // State field(s) for fullNameTextField widget.
  FocusNode? fullNameTextFieldFocusNode;
  TextEditingController? fullNameTextFieldController;
  String? Function(BuildContext, String?)? fullNameTextFieldControllerValidator;
  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  // State field(s) for companyNameTextField widget.
  FocusNode? companyNameTextFieldFocusNode;
  TextEditingController? companyNameTextFieldController;
  String? Function(BuildContext, String?)?
      companyNameTextFieldControllerValidator;
  // State field(s) for countryNameTextField widget.
  FocusNode? countryNameTextFieldFocusNode;
  TextEditingController? countryNameTextFieldController;
  String? Function(BuildContext, String?)?
      countryNameTextFieldControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - API (FindTeamByOrgId)] action in DropDown widget.
  ApiCallResponse? fetchrgTeam;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldController?.dispose();

    fullNameTextFieldFocusNode?.dispose();
    fullNameTextFieldController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldController?.dispose();

    companyNameTextFieldFocusNode?.dispose();
    companyNameTextFieldController?.dispose();

    countryNameTextFieldFocusNode?.dispose();
    countryNameTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
