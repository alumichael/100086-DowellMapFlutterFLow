import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_item_model.dart';
export 'category_item_model.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({
    Key? key,
    this.icon,
    this.categoryTitle,
    this.selectCategoryIcon,
  }) : super(key: key);

  final Widget? icon;
  final String? categoryTitle;
  final Widget? selectCategoryIcon;

  @override
  _CategoryItemWidgetState createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  late CategoryItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(-0.9, 0.15),
          child: Text(
            widget.categoryTitle!,
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.92, 0.21),
          child: widget.selectCategoryIcon!,
        ),
      ],
    );
  }
}
