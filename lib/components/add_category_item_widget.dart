import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'add_category_item_model.dart';
export 'add_category_item_model.dart';

class AddCategoryItemWidget extends StatefulWidget {
  const AddCategoryItemWidget({super.key});

  @override
  State<AddCategoryItemWidget> createState() => _AddCategoryItemWidgetState();
}

class _AddCategoryItemWidgetState extends State<AddCategoryItemWidget> {
  late AddCategoryItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCategoryItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'kht4sogw' /* Add Categoty */,
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: Icon(
              Icons.add_circle_outline,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}
