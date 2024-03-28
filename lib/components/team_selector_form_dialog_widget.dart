import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_selector_form_dialog_model.dart';
export 'team_selector_form_dialog_model.dart';

class TeamSelectorFormDialogWidget extends StatefulWidget {
  const TeamSelectorFormDialogWidget({super.key});

  @override
  State<TeamSelectorFormDialogWidget> createState() =>
      _TeamSelectorFormDialogWidgetState();
}

class _TeamSelectorFormDialogWidgetState
    extends State<TeamSelectorFormDialogWidget> {
  late TeamSelectorFormDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamSelectorFormDialogModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qddovdqm' /* Tracking  Form registration */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController1 ??=
                            FormFieldController<String>(null),
                        options: FFAppState().myMapOrgNames,
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue1 = val);
                          await actions.saveCompanyId(
                            _model.dropDownValue1!,
                          );
                          _model.fetchrgTeam = await FindTeamByOrgIdCall.call(
                            memberEmail: getJsonField(
                              FFAppState().response,
                              r'''$.userinfo.email''',
                            ).toString(),
                            clientAdminId: FFAppState().guestCompanyId,
                          );
                          if ((_model.fetchrgTeam?.succeeded ?? true)) {
                            await actions.saveOrgByIdTeams(
                              FindTeamByOrgIdCall.responseBody(
                                (_model.fetchrgTeam?.jsonBody ?? ''),
                              )!
                                  .toList(),
                            );
                          }

                          setState(() {});
                        },
                        width: double.infinity,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          '7ictapmq' /* Select Orgainsation */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).accent2,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 4.0, 12.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'dyx9mlif' /* Teams */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      if (FFAppState().orgByIdTeams.length == 1)
                        Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFAppState().orgByIdTeams.take(1).toList().first,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      if (FFAppState().orgByIdTeams.length > 1)
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController2 ??=
                              FormFieldController<String>(null),
                          options: FFAppState().orgByIdTeams,
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue2 = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'j770ya70' /* Select Team */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).accent2,
                          borderWidth: 1.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      if (FFAppState().orgByIdTeams.length == 0)
                        Text(
                          FFLocalizations.of(context).getText(
                            'vlilbut8' /* No team attached to this team */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: (_model.dropDownValue1 == null ||
                            _model.dropDownValue1 == '')
                        ? null
                        : () async {
                            setState(() {
                              FFAppState().guestName = '${getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.first_name''',
                              ).toString()} ${getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.last_name''',
                              ).toString()}';
                              FFAppState().guestEmail = getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.email''',
                              ).toString();
                              FFAppState().guestCompanyName =
                                  _model.dropDownValue1!;
                              FFAppState().guestCountry = getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.country''',
                              ).toString();
                              FFAppState().guestUserId = getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.userID''',
                              ).toString();
                              FFAppState().trackingTeam =
                                  _model.dropDownValue2 == null ||
                                          _model.dropDownValue2 == ''
                                      ? 'No team'
                                      : _model.dropDownValue2!;
                              FFAppState().guestGenInfo = GuestInfoStruct(
                                name: '${getJsonField(
                                  FFAppState().response,
                                  r'''$.userinfo.first_name''',
                                ).toString()} ${getJsonField(
                                  FFAppState().response,
                                  r'''$.userinfo.last_name''',
                                ).toString()}',
                                email: getJsonField(
                                  FFAppState().response,
                                  r'''$.userinfo.email''',
                                ).toString(),
                                userId: getJsonField(
                                  FFAppState().response,
                                  r'''$.userinfo.userID''',
                                ).toString(),
                                country: getJsonField(
                                  FFAppState().response,
                                  r'''$.userinfo.country''',
                                ).toString(),
                                companyName: _model.dropDownValue1,
                                companyId: FFAppState().guestCompanyId,
                                orgByIdTeams: FFAppState().orgByIdTeams,
                              );
                            });
                            Navigator.pop(context);

                            context.pushNamed('TrackPermission');
                          },
                    text: FFLocalizations.of(context).getText(
                      '0hoa9wow' /* Continue */,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      disabledColor: FlutterFlowTheme.of(context).accent3,
                      disabledTextColor:
                          FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
