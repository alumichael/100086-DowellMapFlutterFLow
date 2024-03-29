import '/components/member_sub_options_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'new_member_box_model.dart';
export 'new_member_box_model.dart';

class NewMemberBoxWidget extends StatefulWidget {
  const NewMemberBoxWidget({
    super.key,
    required this.itemInfo,
    required this.isInternal,
  });

  final dynamic itemInfo;
  final bool? isInternal;

  @override
  State<NewMemberBoxWidget> createState() => _NewMemberBoxWidgetState();
}

class _NewMemberBoxWidgetState extends State<NewMemberBoxWidget> {
  late NewMemberBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewMemberBoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                              letterSpacing: 0.0,
                            ),
                      ),
                      if (widget.isInternal == true)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.circle_rounded,
                            color: getJsonField(
                                      widget.itemInfo,
                                      r'''$.status''',
                                    ) ==
                                    getJsonField(
                                      <String, dynamic>{
                                        'status': 'Inactive',
                                      },
                                      r'''$.status''',
                                    )
                                ? FlutterFlowTheme.of(context).secondaryText
                                : FlutterFlowTheme.of(context).primary,
                            size: 12.0,
                          ),
                        ),
                    ],
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
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showAlignedDialog(
                      context: context,
                      isGlobal: false,
                      avoidOverflow: true,
                      targetAnchor: const AlignmentDirectional(1.0, 1.0)
                          .resolve(Directionality.of(context)),
                      followerAnchor: const AlignmentDirectional(-1.0, -1.0)
                          .resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: WebViewAware(
                            child: MemberSubOptionsWidget(
                              itemInfo: widget.itemInfo!,
                              isInternal: widget.isInternal!,
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Icon(
                    Icons.keyboard_control_sharp,
                    color: FlutterFlowTheme.of(context).accent1,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.0,
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ],
    );
  }
}
