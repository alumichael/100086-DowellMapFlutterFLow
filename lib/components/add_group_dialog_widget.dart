import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_group_dialog_model.dart';
export 'add_group_dialog_model.dart';

class AddGroupDialogWidget extends StatefulWidget {
  const AddGroupDialogWidget({super.key});

  @override
  State<AddGroupDialogWidget> createState() => _AddGroupDialogWidgetState();
}

class _AddGroupDialogWidgetState extends State<AddGroupDialogWidget> {
  late AddGroupDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddGroupDialogModel());

    _model.addgrouptextfieldController ??= TextEditingController();
    _model.addgrouptextfieldFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 210.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).white,
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 220.0,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 60.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.addgrouptextfieldController,
                    focusNode: _model.addgrouptextfieldFocusNode,
                    autofocus: true,
                    autofillHints: [AutofillHints.name],
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'wy7twllq' /* Group Name */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'w389jou7' /* Hint:  Employees, or Junior cl... */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).success,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: _model.addgrouptextfieldControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ant38qi8' /* Type in the new group you will... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'nunufabo' /* Cancel */,
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
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.addgrouptextfieldController.text != null &&
                              _model.addgrouptextfieldController.text != '') {
                            if (FFAppState().isProfiledUser) {
                              _model.apiResultfz0 =
                                  await CreateLocationGroupCall.call(
                                username: FFAppState().username,
                                groupName:
                                    _model.addgrouptextfieldController.text,
                                apiKey: FFAppState().apiKey,
                              );
                              if ((_model.apiResultfz0?.succeeded ?? true)) {
                                FFAppState().addToGroupList(
                                    _model.addgrouptextfieldController.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Group created succesfully',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Unable to create group',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                  ),
                                );
                              }
                            } else {
                              _model.createprofileResponse =
                                  await CreateProfileCall.call(
                                apiKey: FFAppState().apiKey,
                                username: FFAppState().username,
                              );
                              if ((_model.createprofileResponse?.succeeded ??
                                  true)) {
                                _model.apiResultsf5 =
                                    await CreateLocationGroupCall.call(
                                  username: FFAppState().username,
                                  groupName:
                                      _model.addgrouptextfieldController.text,
                                  apiKey: FFAppState().apiKey,
                                );
                                if ((_model.apiResultsf5?.succeeded ?? true)) {
                                  FFAppState().addToGroupList(
                                      _model.addgrouptextfieldController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Group created succesfully',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Unable to create group',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Operation failed',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                  ),
                                );
                              }
                            }

                            Navigator.pop(context);
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text('invalid request '),
                                    content:
                                        Text('Please enter the group name.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            Navigator.pop(context);
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'n4h0tw7w' /* Add */,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
