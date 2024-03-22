import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'member_selection_box_model.dart';
export 'member_selection_box_model.dart';

class MemberSelectionBoxWidget extends StatefulWidget {
  const MemberSelectionBoxWidget({
    super.key,
    required this.itemInfo,
  });

  final dynamic itemInfo;

  @override
  State<MemberSelectionBoxWidget> createState() =>
      _MemberSelectionBoxWidgetState();
}

class _MemberSelectionBoxWidgetState extends State<MemberSelectionBoxWidget> {
  late MemberSelectionBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberSelectionBoxModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (FFAppState().selectedMembers.contains(getJsonField(
                        widget.itemInfo,
                        r'''$.email''',
                      ).toString()) ==
                  true)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await actions.updateSeletedEmails(
                      false,
                      getJsonField(
                        widget.itemInfo,
                        r'''$.email''',
                      ).toString(),
                    );
                    setState(() {});
                  },
                  child: Icon(
                    Icons.check_box_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
              if (FFAppState().selectedMembers.contains(getJsonField(
                        widget.itemInfo,
                        r'''$.email''',
                      ).toString()) ==
                  false)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await actions.updateSeletedEmails(
                      true,
                      getJsonField(
                        widget.itemInfo,
                        r'''$.email''',
                      ).toString(),
                    );
                    setState(() {});
                  },
                  child: Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${getJsonField(
                        widget.itemInfo,
                        r'''$.first_name''',
                      ).toString()} ${getJsonField(
                        widget.itemInfo,
                        r'''$.last_name''',
                      ).toString()}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                          ),
                    ),
                    Text(
                      getJsonField(
                        widget.itemInfo,
                        r'''$.email''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).accent1,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.0,
          thickness: 1.0,
          color: Color(0x5A616161),
        ),
      ],
    );
  }
}
