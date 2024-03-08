import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_member_confirm_dialog_model.dart';
export 'add_member_confirm_dialog_model.dart';

class AddMemberConfirmDialogWidget extends StatefulWidget {
  const AddMemberConfirmDialogWidget({
    super.key,
    required this.itemInfo,
  });

  final dynamic itemInfo;

  @override
  State<AddMemberConfirmDialogWidget> createState() =>
      _AddMemberConfirmDialogWidgetState();
}

class _AddMemberConfirmDialogWidgetState
    extends State<AddMemberConfirmDialogWidget> {
  late AddMemberConfirmDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMemberConfirmDialogModel());

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Are you sure to add ${getJsonField(
                    widget.itemInfo,
                    r'''$.first_name''',
                  ).toString()}  ${getJsonField(
                    widget.itemInfo,
                    r'''$.last_name''',
                  ).toString()}  into internal team?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).background,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'h0v5zbdo' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          _model.addLoginTeamMemberResponse =
                              await AddMemberToTeamCall.call(
                            username: FFAppState().username,
                            teamName: FFAppState().activeTeamName,
                            type: 'team_members',
                            membersJson:
                                functions.changeToList(<String, dynamic>{
                              'first_name': getJsonField(
                                widget.itemInfo,
                                r'''$.first_name''',
                              ),
                              'last_name': getJsonField(
                                widget.itemInfo,
                                r'''$.last_name''',
                              ),
                              'member_email': getJsonField(
                                widget.itemInfo,
                                r'''$.email''',
                              ),
                              'member_status': 'Inactive',
                            }),
                          );
                          if ((_model.addLoginTeamMemberResponse?.succeeded ??
                              true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Member Added succesfully',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                            Navigator.pop(context);
                            await actions.transformToInternalTeamItem(
                              widget.itemInfo!,
                            );
                            _model.singleMailresponse =
                                await SendEmailToSingleUserCall.call(
                              toname: '${getJsonField(
                                widget.itemInfo,
                                r'''$.first_name''',
                              ).toString()}  ${getJsonField(
                                widget.itemInfo,
                                r'''$.last_name''',
                              ).toString()}',
                              toemail: getJsonField(
                                widget.itemInfo,
                                r'''$.email''',
                              ).toString(),
                              subject: 'Welcome to the Team!',
                              emailContent: functions.formatTeamInviteMailBody(
                                  getJsonField(
                                    widget.itemInfo,
                                    r'''$.first_name''',
                                  ).toString(),
                                  FFAppState().activeTeam.teamName),
                            );
                            if ((_model.singleMailresponse?.succeeded ??
                                true)) {
                              context.goNamed('MembersScreen');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Added  team member, but unable to send  invite mail ',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );

                              context.goNamed('MembersScreen');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  getJsonField(
                                    (_model.addLoginTeamMemberResponse
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.error''',
                                  ).toString(),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                            Navigator.pop(context);
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'rvpm0mcq' /* Accept */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
