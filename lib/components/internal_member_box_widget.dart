import '/components/member_sub_options_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'internal_member_box_model.dart';
export 'internal_member_box_model.dart';

class InternalMemberBoxWidget extends StatefulWidget {
  const InternalMemberBoxWidget({
    super.key,
    required this.itemInfo,
  });

  final dynamic itemInfo;

  @override
  State<InternalMemberBoxWidget> createState() =>
      _InternalMemberBoxWidgetState();
}

class _InternalMemberBoxWidgetState extends State<InternalMemberBoxWidget> {
  late InternalMemberBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InternalMemberBoxModel());

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
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${getJsonField(
                            widget.itemInfo,
                            r'''$.first_name''',
                          ).toString()}  ${getJsonField(
                            widget.itemInfo,
                            r'''$.last_name''',
                          ).toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          getJsonField(
                            widget.itemInfo,
                            r'''$.email''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
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
                                  isInternal: true,
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Icon(
                        Icons.circle_rounded,
                        color: MemberModelStruct.maybeFromMap(widget.itemInfo)
                                    ?.status ==
                                ("Inactive")
                            ? FlutterFlowTheme.of(context).secondaryText
                            : FlutterFlowTheme.of(context).success,
                        size: 15.0,
                      ),
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
                              isInternal: true,
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
