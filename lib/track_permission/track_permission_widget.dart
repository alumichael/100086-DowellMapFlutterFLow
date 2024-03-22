import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'track_permission_model.dart';
export 'track_permission_model.dart';

class TrackPermissionWidget extends StatefulWidget {
  const TrackPermissionWidget({super.key});

  @override
  State<TrackPermissionWidget> createState() => _TrackPermissionWidgetState();
}

class _TrackPermissionWidgetState extends State<TrackPermissionWidget> {
  late TrackPermissionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackPermissionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '2gh9o4g9' /* I permit DoWell UX Living Lab ... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).background,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  context.safePop();
                                },
                                text: FFLocalizations.of(context).getText(
                                  'i3i9itay' /* Cancel */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().isAuthUser == true) {
                                    _model.fetchResultAuthUser =
                                        await FetchUserCall.call(
                                      apiKey: FFAppState().apiKey,
                                      email: FFAppState().guestEmail,
                                    );
                                    if ((_model
                                            .fetchResultAuthUser?.succeeded ??
                                        true)) {
                                      if (FetchUserCall.data(
                                            (_model.fetchResultAuthUser
                                                    ?.jsonBody ??
                                                ''),
                                          )?.isEmpty) {
                                        _model.insertionResultAuthUser =
                                            await InsertUserCall.call(
                                          apiKey: FFAppState().apiKey,
                                          name: FFAppState().guestName,
                                          email: FFAppState().guestEmail,
                                          comapnyName:
                                              FFAppState().guestCompanyName,
                                          userid: FFAppState().guestUserId,
                                        );
                                        if ((_model.insertionResultAuthUser
                                                ?.succeeded ??
                                            true)) {
                                          setState(() {
                                            FFAppState().allowLocationTracking =
                                                true;
                                            FFAppState()
                                                    .isFirstLaunchAfterInstall =
                                                false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Successfully registered tracking',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Email already used',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        );
                                        setState(() {
                                          FFAppState().allowLocationTracking =
                                              true;
                                          FFAppState()
                                                  .isFirstLaunchAfterInstall =
                                              false;
                                        });
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Failed to fetch user',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                    }
                                  } else {
                                    _model.fetchResult =
                                        await FetchUserCall.call(
                                      apiKey:
                                          '0699dbbb-2786-4dfa-a1db-fc12f2210228',
                                      email: FFAppState().guestEmail,
                                    );
                                    if ((_model.fetchResult?.succeeded ??
                                        true)) {
                                      if (FetchUserCall.data(
                                            (_model.fetchResult?.jsonBody ??
                                                ''),
                                          )?.isEmpty) {
                                        _model.insertionResult =
                                            await InsertUserCall.call(
                                          apiKey:
                                              '0699dbbb-2786-4dfa-a1db-fc12f2210228',
                                          name: FFAppState().guestName,
                                          email: FFAppState().guestEmail,
                                          comapnyName:
                                              FFAppState().guestCompanyName,
                                          userid: FFAppState().guestUserId,
                                        );
                                        if ((_model
                                                .insertionResult?.succeeded ??
                                            true)) {
                                          _model.finalizeReponse =
                                              await FinalizedLinkCall.call(
                                            linkId: FFAppState().linkId,
                                            product: 'maps',
                                          );
                                          if ((_model
                                                  .finalizeReponse?.succeeded ??
                                              true)) {
                                            setState(() {
                                              FFAppState()
                                                  .allowLocationTracking = true;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Successfully registered tracking',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Failed to register tracking',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            );
                                          }
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Email already used',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        );
                                        setState(() {
                                          FFAppState().allowLocationTracking =
                                              true;
                                        });
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Failed to fetch user',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                    }
                                  }

                                  context.pushNamed('NewHomePage');

                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'p5szsrpz' /* Accept */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
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
            ),
          ),
        ),
      ),
    );
  }
}
