import '/components/image_widget.dart';
import '/components/search_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_home_page_copy2_widget.dart' show NewHomePageCopy2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewHomePageCopy2Model extends FlutterFlowModel<NewHomePageCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for SearchBottomSheet component.
  late SearchBottomSheetModel searchBottomSheetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBottomSheetModel =
        createModel(context, () => SearchBottomSheetModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchBottomSheetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
