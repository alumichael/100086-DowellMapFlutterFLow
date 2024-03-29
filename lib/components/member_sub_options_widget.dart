import '/components/add_member_confirm_dialog_widget.dart';
import '/components/delete_member_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'member_sub_options_model.dart';
export 'member_sub_options_model.dart';

class MemberSubOptionsWidget extends StatefulWidget {
  const MemberSubOptionsWidget({
    super.key,
    required this.itemInfo,
    required this.isInternal,
  });

  final dynamic itemInfo;
  final bool? isInternal;

  @override
  State<MemberSubOptionsWidget> createState() => _MemberSubOptionsWidgetState();
}

class _MemberSubOptionsWidgetState extends State<MemberSubOptionsWidget> {
  late MemberSubOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberSubOptionsModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: WebViewAware(
                            child: DeleteMemberDialogWidget(
                              itemInfo: widget.itemInfo!,
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '3afckevs' /* Delete */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.isInternal == false)
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: WebViewAware(
                            child: AddMemberConfirmDialogWidget(
                              itemInfo: widget.itemInfo!,
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '2gnst597' /* Add To Internal */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
