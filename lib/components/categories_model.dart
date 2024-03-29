import '/components/category_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for categoryItem component.
  late CategoryItemModel categoryItemModel;

  @override
  void initState(BuildContext context) {
    categoryItemModel = createModel(context, () => CategoryItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    categoryItemModel.dispose();
  }
}
