import '/components/category_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for categoryItem component.
  late CategoryItemModel categoryItemModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    categoryItemModel = createModel(context, () => CategoryItemModel());
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    categoryItemModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
