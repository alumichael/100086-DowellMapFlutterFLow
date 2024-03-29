import '/components/add_member_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'member_main_options_model.dart';
export 'member_main_options_model.dart';

class MemberMainOptionsWidget extends StatefulWidget {
  const MemberMainOptionsWidget({
    super.key,
    required this.isInternal,
    this.teamType,
  });

  final bool? isInternal;
  final String? teamType;

  @override
  State<MemberMainOptionsWidget> createState() =>
      _MemberMainOptionsWidgetState();
}

class _MemberMainOptionsWidgetState extends State<MemberMainOptionsWidget> {
  late MemberMainOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberMainOptionsModel());

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
            if (widget.isInternal ?? true)
              Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showAlignedDialog(
                        context: context,
                        isGlobal: false,
                        avoidOverflow: false,
                        targetAnchor: const AlignmentDirectional(-1.0, 1.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: const AlignmentDirectional(1.0, -1.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return const Material(
                            color: Colors.transparent,
                            child: WebViewAware(
                              child: AddMemberDialogWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'nvyratzz' /* Add member */,
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
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'rliacw6m' /* Move members */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
