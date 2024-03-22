import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_member_dialog_model.dart';
export 'add_member_dialog_model.dart';

class AddMemberDialogWidget extends StatefulWidget {
  const AddMemberDialogWidget({super.key});

  @override
  State<AddMemberDialogWidget> createState() => _AddMemberDialogWidgetState();
}

class _AddMemberDialogWidgetState extends State<AddMemberDialogWidget> {
  late AddMemberDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMemberDialogModel());

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (FFAppState().teamMembers.length > 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    context.pushNamed(
                      'MembersSelectionScreen',
                      queryParameters: {
                        'teamName': serializeParam(
                          FFLocalizations.of(context).getText(
                            'vt4ajvw6' /* Team Members */,
                          ),
                          ParamType.String,
                        ),
                        'members': serializeParam(
                          FFAppState().teamMembers,
                          ParamType.JSON,
                          true,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 340),
                        ),
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ukfpisah' /* From Team members */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
            if (FFAppState().guestMembers.length > 0)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.pop(context);

                  context.pushNamed(
                    'MembersSelectionScreen',
                    queryParameters: {
                      'teamName': serializeParam(
                        FFLocalizations.of(context).getText(
                          'jp6ghp6y' /* Guest Members */,
                        ),
                        ParamType.String,
                      ),
                      'members': serializeParam(
                        FFAppState().guestMembers,
                        ParamType.JSON,
                        true,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 340),
                      ),
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'oqn57nuj' /* From Guest  members */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
