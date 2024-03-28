import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'member_box_model.dart';
export 'member_box_model.dart';

class MemberBoxWidget extends StatefulWidget {
  const MemberBoxWidget({
    super.key,
    required this.itemInfo,
  });

  final MemberModelStruct? itemInfo;

  @override
  State<MemberBoxWidget> createState() => _MemberBoxWidgetState();
}

class _MemberBoxWidgetState extends State<MemberBoxWidget> {
  late MemberBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberBoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.itemInfo?.email,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Container(
              width: 15.0,
              height: 15.0,
              decoration: BoxDecoration(
                color: widget.itemInfo?.status != 'Inactive'
                    ? FlutterFlowTheme.of(context).success
                    : FlutterFlowTheme.of(context).accent2,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
