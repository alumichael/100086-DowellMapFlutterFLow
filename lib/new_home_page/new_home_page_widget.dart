import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_group_dialog_widget.dart';
import '/components/group_list_dialog_component_widget.dart';
import '/components/image_widget.dart';
import '/components/team_selector_form_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'new_home_page_model.dart';
export 'new_home_page_model.dart';

class NewHomePageWidget extends StatefulWidget {
  const NewHomePageWidget({super.key});

  @override
  State<NewHomePageWidget> createState() => _NewHomePageWidgetState();
}

class _NewHomePageWidgetState extends State<NewHomePageWidget> {
  late NewHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if (FFAppState().sessionId != 'null') {
        setState(() {
          FFAppState().isAuthUser = true;
        });
        setState(() {
          FFAppState().username = functions.username(getJsonField(
            FFAppState().response,
            r'''$.userinfo.username''',
          ).toString().toString())!;
        });
      } else {
        setState(() {
          FFAppState().isAuthUser = false;
        });
      }

      _model.isLocationEnable = await actions.checkLocationEnabled();
      if (_model.isLocationEnable != true) {
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: const Text('Location Service'),
                    content: const Text(
                        'To continue, please turn on  your location using Google  location service.'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: const Text('Turn on'),
                      ),
                    ],
                  ),
                );
              },
            ) ??
            false;
        await actions.gotoSettings();
      }
      _model.myIPAddress = await IpifyCall.call();
      if ((_model.myIPAddress?.succeeded ?? true)) {
        setState(() {
          FFAppState().myIpAddress = IpifyCall.deviceIP(
            (_model.myIPAddress?.jsonBody ?? ''),
          ).toString();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Unable to get device IP address',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }

      if (FFAppState().isAuthUser == false) {
        _model.apiResultzlp = await LinkBageLoginCall.call(
          time: dateTimeFormat(
            'yMd',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ),
          location: functions.latlngToString(currentUserLocationValue!),
          username: 'username',
          os: 'linux',
          device: 'mobile',
          browser: 'chrome',
          connection: 'wifi',
          ip: FFAppState().myIpAddress,
        );
        if ((_model.apiResultzlp?.succeeded ?? true)) {
          setState(() {
            FFAppState().apiKey = '4f0bd662-8456-4b2e-afa6-293d4135facf';
            FFAppState().credit = '0';
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Public login failed',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      } else {
        _model.serviceApiKey = await GetUserAPIKeyCall.call(
          workspaceId: getJsonField(
            FFAppState().response,
            r'''$.selectedWorkspaceId''',
          ).toString().toString(),
        );
        if ((_model.serviceApiKey?.succeeded ?? true)) {
          setState(() {
            FFAppState().apiKey = GetUserAPIKeyCall.apiKey(
              (_model.serviceApiKey?.jsonBody ?? ''),
            )!;
            FFAppState().credit = valueOrDefault<String>(
              GetUserAPIKeyCall.totalCredits(
                (_model.serviceApiKey?.jsonBody ?? ''),
              ).toString(),
              '0',
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'The workspace you are logged in doesn\'t have SERVICE KEY',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }

      if ((FFAppState().isAuthUser == true) &&
          (FFAppState().isFirstLaunchAfterInstall == true)) {
        _model.userMemberType = await actions.getUserMemberType();
        if (_model.userMemberType != 'not a member') {
          if (_model.userMemberType != 'owner') {
            FFAppState().isOwner = false;
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
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: const TeamSelectorFormDialogWidget(),
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          } else {
            setState(() {
              FFAppState().isOwner = true;
            });
          }

          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'you don\'t have a portfolio set up in Living Lap Maps',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 13.0,
                ),
              ),
              duration: const Duration(milliseconds: 5000),
              backgroundColor: FlutterFlowTheme.of(context).alternate,
            ),
          );
        }
      } else {
        _model.userMemberType2 = await actions.getUserMemberType();
        if (_model.userMemberType2 != 'not a member') {
          if (_model.userMemberType2 != 'owner') {
            FFAppState().isOwner = false;
          } else {
            setState(() {
              FFAppState().isOwner = true;
            });
          }

          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'You don\'t have a portfolio set up in Living Lap Maps',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 13.0,
                ),
              ),
              duration: const Duration(milliseconds: 5000),
              backgroundColor: FlutterFlowTheme.of(context).alternate,
            ),
          );
        }
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.searchController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          drawer: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 165.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  22.0, 0.0, 9.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: const ImageWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: 52.0,
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        functions
                                            .userprofile(getJsonField(
                                              FFAppState().response,
                                              r'''$.userinfo.profile_img''',
                                            ).toString())!
                                            .toString(),
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).btnText,
                                      width: 4.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.username(FFAppState().username),
                                  'username',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions.email(valueOrDefault<String>(
                                    getJsonField(
                                      FFAppState().response,
                                      r'''$.userinfo.email''',
                                    )?.toString(),
                                    'email@gmail.com',
                                  )),
                                  'email@gmail.com',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                  if (functions.isuserlogedin(getJsonField(
                                    FFAppState().response,
                                    r'''$.userinfo.username''',
                                  ).toString())!) {
                                    context.pushNamed('Userdetails');

                                    _model.serviceApiKeyCopy =
                                        await GetUserAPIKeyCall.call(
                                      workspaceId: getJsonField(
                                        FFAppState().response,
                                        r'''$.selectedWorkspaceId''',
                                      ).toString(),
                                    );
                                    if ((_model.serviceApiKeyCopy?.succeeded ??
                                        true)) {
                                      FFAppState().update(() {
                                        FFAppState().credit =
                                            GetUserAPIKeyCall.totalCredits(
                                          (_model.serviceApiKeyCopy?.jsonBody ??
                                              ''),
                                        ).toString();
                                      });
                                    }
                                  } else {
                                    context.pushNamed('LoginComponent');
                                  }

                                  setState(() {});
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'odsts4lf' /* View Profile */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 460.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            22.0, 32.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 1.036,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FlutterFlowLanguageSelector(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height: 50.0,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent2,
                                    dropdownColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    dropdownIconColor: const Color(0x001C5F92),
                                    borderRadius: 8.0,
                                    textStyle: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13.0,
                                    ),
                                    hideFlags: false,
                                    flagSize: 24.0,
                                    flagTextGap: 8.0,
                                    currentLanguage: FFLocalizations.of(context)
                                        .languageCode,
                                    languages: FFLocalizations.languages(),
                                    onChanged: (lang) =>
                                        setAppLanguage(context, lang),
                                  ),
                                ),
                              ),
                            ),
                            if (kDebugMode)
                              Builder(
                                builder: (context) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 25.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().noMoreCredit) {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'No more credit.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 5000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .background,
                                          ),
                                        );
                                      } else {
                                        Navigator.pop(context);
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: const AddGroupDialogWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.post_add,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'tos25ie5' /* Add Group */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (FFAppState().isOwner)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 25.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await actions.getUserMemberType();
                                    Navigator.pop(context);

                                    context.pushNamed('Teams');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.post_add,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ugzuwa0k' /* My Team */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().isAuthUser == false) &&
                                (FFAppState().isOwner == false))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await actions.qRCodeScanner();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Scan Successful',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );

                                    context.pushNamed(
                                      'TrackingDetailsForm',
                                      pathParameters: {
                                        'userid': serializeParam(
                                          FFAppState().guestUserId,
                                          ParamType.String,
                                        ),
                                        'workspaceid': serializeParam(
                                          FFAppState().guestCompanyId,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.qr_code_scanner,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ux1xlg8y' /* Scan QRCode */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (!FFAppState().isAuthUser)
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 25.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                              ),
                            if (isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.slidersH,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          's7bromby' /* Settings */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: Icon(
                                        Icons.contact_support_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'xhy66cy5' /* Support */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await actions.httpLoader(
                                          'https://www.qrcodereviews.uxlivinglab.online/api/v3/masterlink/?api_key=2304034444490576366',
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Icon(
                                              Icons.info_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '97mp010r' /* About */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if ((FFAppState().isOwner == true) &&
                                FFAppState().isAuthUser)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);

                                    context.pushNamed('Create_Qr_Code');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (FFAppState().isAuthUser == true)
                                        Icon(
                                          Icons.qr_code_2_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      if (FFAppState().isAuthUser == true)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'opr5mowk' /* Generate QR Code */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
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
                  Container(
                    width: double.infinity,
                    height: 170.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (FFAppState().isAuthUser == false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      22.0, 0.0, 9.0, 0.0),
                                  child: Container(
                                    width: 238.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0x37005734),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .btnText,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'r3p5dnq7' /* You are not Logged in */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    'LoginComponent');
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'obtnbk5o' /* Click here to Log in */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (FFAppState().isAuthUser)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                22.0, 16.0, 0.0, 32.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: const Text('Log Out'),
                                                    content:
                                                        const Text('Are you sure?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: const Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: const Text('Confirm'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      FFAppState().update(() {
                                        FFAppState().isAuthUser = false;
                                        FFAppState().sessionId = 'null';
                                        FFAppState().groupList = [];
                                        FFAppState().response = null;
                                        FFAppState().username = '';
                                        FFAppState().publicScannedValue = '';
                                        FFAppState().isOwner = false;
                                        FFAppState().guestGenInfo =
                                            GuestInfoStruct();
                                        FFAppState().clearmap = true;
                                        FFAppState().allowLocationTracking =
                                            false;
                                        FFAppState().isFirstLaunchAfterInstall =
                                            true;
                                      });
                                    } else {
                                      Navigator.pop(context);
                                    }

                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: Icon(
                                          Icons.logout,
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'aizjlehk' /* Logout */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor3,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: custom_widgets.MyMapWidget(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              radius1: valueOrDefault<double>(
                                double.tryParse(_model.textController1.text),
                                0.0,
                              ),
                              radius2: valueOrDefault<double>(
                                double.tryParse(_model.textController2.text),
                                2000.0,
                              ),
                              query: valueOrDefault<String>(
                                _model.searchController.text,
                                'School',
                              ),
                              clearmap: FFAppState().clearmap,
                              iOSGoogleMapsApiKey: FFAppState().iosGoogleMapKey,
                              androidGoogleMapsApiKey:
                                  FFAppState().androidGoogleMapKey,
                              webGoogleMapsApiKey: FFAppState().webGoogleApiKey,
                              origin:
                                  _model.radioButtonValue == 'Current Location'
                                      ? currentUserLocationValue
                                      : _model.placePickerValue.latLng,
                              result: _model.googleResult,
                              address: _model.googlePlaceName,
                              dbResult: _model.dblocationCord,
                              dbAddress: _model.dbPlacename,
                              PlaceIds: _model.placeIDs,
                              groupLocList: FFAppState().groupCoordLocs,
                              groupLocAddress: FFAppState().groupAddress,
                              googleLocsId: FFAppState().groupIds,
                              navigateTo: () async {
                                setState(() {
                                  FFAppState().clearmap = true;
                                });

                                context.pushNamed(
                                  'newplacedetails',
                                  queryParameters: {
                                    'currentCord': serializeParam(
                                      FFAppState().currentLocation,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );

                                setState(() {
                                  FFAppState().clearmap = true;
                                });
                              },
                              deleteAction: () async {
                                _model.apiResulti6o = await DeleteLocCall.call(
                                  apiKey: FFAppState().apiKey,
                                  dataId: FFAppState().deleteId,
                                );
                                if ((_model.apiResulti6o?.succeeded ?? true)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Location deleted succesfully',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Operation Failed',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }

                                setState(() {});
                              },
                              updateAction: () async {
                                context.pushNamed(
                                  'newplacedetails',
                                  queryParameters: {
                                    'currentCord': serializeParam(
                                      FFAppState().currentLocation,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                    ),
                                  },
                                );
                              },
                              teamTrackingAction: () async {
                                _model.populatingDataInfo =
                                    await SaveTrackingDetailsCall.call(
                                  apiKey: FFAppState().apiKey,
                                  jsonBodyJson: FFAppState().trackingData,
                                );
                                if ((_model.populatingDataInfo?.succeeded ??
                                    true)) {
                                  setState(() {
                                    FFAppState().trackingData = [];
                                  });
                                }

                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (FFAppState().showBottomSheet)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 5.0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 310),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      FFAppState()
                                                              .showBottomSheet =
                                                          false;
                                                    });
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (valueOrDefault<bool>(
                                                      _model.radioButtonValue ==
                                                          'Select Location',
                                                      false,
                                                    ))
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.05, -1.0),
                                                          child:
                                                              FlutterFlowPlacePicker(
                                                            iOSGoogleMapsApiKey:
                                                                'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk',
                                                            androidGoogleMapsApiKey:
                                                                'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4',
                                                            webGoogleMapsApiKey:
                                                                'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                                            onSelect:
                                                                (place) async {
                                                              setState(() =>
                                                                  _model.placePickerValue =
                                                                      place);
                                                            },
                                                            defaultText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'fz3xrc4g' /* Search Location */,
                                                            ),
                                                            icon: const Icon(
                                                              Icons.place,
                                                              color:
                                                                  Colors.white,
                                                              size: 16.0,
                                                            ),
                                                            buttonOptions:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 56.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            2.0,
                                                                      ),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FlutterFlowRadioButton(
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        's9n78sg8' /* Current Location */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'hgx4ok5m' /* Select Location */,
                                                      )
                                                    ].toList(),
                                                    onChanged: (val) async {
                                                      setState(() {});
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .currentLocation =
                                                            _model
                                                                .radioButtonValue!;
                                                      });
                                                    },
                                                    controller: _model
                                                            .radioButtonValueController ??=
                                                        FormFieldController<
                                                                String>(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                      '44krtudf' /* Current Location */,
                                                    )),
                                                    optionHeight: 24.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    textPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    buttonPosition:
                                                        RadioButtonPosition
                                                            .left,
                                                    direction: Axis.horizontal,
                                                    radioButtonColor:
                                                        const Color(0xFF015534),
                                                    inactiveRadioButtonColor:
                                                        const Color(0x8A000000),
                                                    toggleable: false,
                                                    horizontalAlignment:
                                                        WrapAlignment.start,
                                                    verticalAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(25.0, 16.0,
                                                          25.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'jgnwzq85' /* Distance
Between */
                                                          ,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: SizedBox(
                                                            width: 88.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController1,
                                                              focusNode: _model
                                                                  .textFieldFocusNode1,
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  '7i1t896a' /* From */,
                                                                ),
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  '0ckxd2o7' /* e.g 0 */,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .background,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Color(
                                                                        0x4C005734),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              minLines: null,
                                                              keyboardType:
                                                                  const TextInputType
                                                                      .numberWithOptions(
                                                                      decimal:
                                                                          true),
                                                              validator: _model
                                                                  .textController1Validator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 10.0,
                                                        height: 2.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: SizedBox(
                                                            width: 88.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController2,
                                                              focusNode: _model
                                                                  .textFieldFocusNode2,
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'aphmltz6' /* To */,
                                                                ),
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'v6s1i2tm' /* e.g 2000 */,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .background,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Color(
                                                                        0x4C005734),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              minLines: null,
                                                              keyboardType:
                                                                  const TextInputType
                                                                      .numberWithOptions(
                                                                      decimal:
                                                                          true),
                                                              validator: _model
                                                                  .textController2Validator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'cvep8u39' /* M */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        25.0, 0.0, 25.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 8.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 44.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons.redo,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                    .isDestinationSelected =
                                                                false;
                                                            FFAppState()
                                                                    .showTrackingToggler =
                                                                false;
                                                            FFAppState()
                                                                    .clearmap =
                                                                true;
                                                          });
                                                          if (FFAppState()
                                                                  .clearmap ==
                                                              true) {
                                                            setState(() {
                                                              _model
                                                                  .textController1
                                                                  ?.clear();
                                                              _model
                                                                  .textController2
                                                                  ?.clear();
                                                              _model
                                                                  .searchController
                                                                  ?.clear();
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.6,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        14.0,
                                                                        0.0,
                                                                        14.0,
                                                                        0.0),
                                                            child: SizedBox(
                                                              width: 88.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .searchController,
                                                                focusNode: _model
                                                                    .searchFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.searchController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'rp439f9l' /* categories */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .background,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'sgyz8ovg' /* e.g school */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x4C005734),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .searchController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.searchController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              const Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                minLines: null,
                                                                validator: _model
                                                                    .searchControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 8.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 44.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        icon: Icon(
                                                          Icons.search,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          size: 20.0,
                                                        ),
                                                        showLoadingIndicator:
                                                            true,
                                                        onPressed: () async {
                                                          currentUserLocationValue =
                                                              await getCurrentUserLocation(
                                                                  defaultLocation:
                                                                      const LatLng(
                                                                          0.0,
                                                                          0.0));
                                                          if (_model.searchController
                                                                      .text !=
                                                                  '') {
                                                            setState(() {
                                                              FFAppState()
                                                                      .showMyLocs =
                                                                  false;
                                                              FFAppState()
                                                                      .clearmap =
                                                                  false;
                                                            });
                                                            await actions
                                                                .hideSoftKeyboard();
                                                            _model.nearbyPlaceResponse =
                                                                await NearbyPlaceCall
                                                                    .call(
                                                              query: _model
                                                                  .searchController
                                                                  .text,
                                                              location: functions.latlngToString(FFAppState()
                                                                          .currentLocation ==
                                                                      'Current Location'
                                                                  ? currentUserLocationValue!
                                                                  : _model
                                                                      .placePickerValue
                                                                      .latLng),
                                                              radius:
                                                                  valueOrDefault<
                                                                      int>(
                                                                int.tryParse(_model
                                                                    .textController2
                                                                    .text),
                                                                2000,
                                                              ),
                                                              key: () {
                                                                if (isAndroid) {
                                                                  return FFAppState()
                                                                      .androidGoogleMapKey;
                                                                } else if (isiOS) {
                                                                  return FFAppState()
                                                                      .iosGoogleMapKey;
                                                                } else {
                                                                  return FFAppState()
                                                                      .webGoogleApiKey;
                                                                }
                                                              }(),
                                                            );
                                                            if ((_model
                                                                    .nearbyPlaceResponse
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if (NearbyPlaceCall
                                                                      .data(
                                                                    (_model.nearbyPlaceResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).isNotEmpty) {
                                                                _model.searchServiceResponse =
                                                                    await ProcessProductRequestCall
                                                                        .call(
                                                                  apiKey:
                                                                      FFAppState()
                                                                          .apiKey,
                                                                  subServiceIds:
                                                                      'DOWELL100413',
                                                                );
                                                                if ((_model
                                                                        .searchServiceResponse
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .credit =
                                                                        ProcessProductRequestCall
                                                                            .credits(
                                                                      (_model.searchServiceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString();
                                                                    FFAppState()
                                                                            .clearmap =
                                                                        false;
                                                                  });
                                                                  _model.googleResult =
                                                                      await actions
                                                                          .refineGoogleResult(
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].geometry.location.lat''',
                                                                      true,
                                                                    )!,
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].geometry.location.lng''',
                                                                      true,
                                                                    )!,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      double.tryParse(_model
                                                                          .textController1
                                                                          .text),
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      double.tryParse(_model
                                                                          .textController2
                                                                          .text),
                                                                      2000.0,
                                                                    ),
                                                                    FFAppState().currentLocation ==
                                                                            'Current Location'
                                                                        ? currentUserLocationValue!
                                                                        : _model
                                                                            .placePickerValue
                                                                            .latLng,
                                                                  );
                                                                  _model.placeIDs =
                                                                      await actions
                                                                          .refineplaceid(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      double.tryParse(_model
                                                                          .textController1
                                                                          .text),
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      double.tryParse(_model
                                                                          .textController2
                                                                          .text),
                                                                      2000.0,
                                                                    ),
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].geometry.location.lat''',
                                                                      true,
                                                                    )!,
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].geometry.location.lng''',
                                                                      true,
                                                                    )!,
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].place_id''',
                                                                      true,
                                                                    )!,
                                                                    FFAppState().currentLocation ==
                                                                            'Current Location'
                                                                        ? currentUserLocationValue!
                                                                        : _model
                                                                            .placePickerValue
                                                                            .latLng,
                                                                  );
                                                                  _model.googlePlaceName =
                                                                      await actions
                                                                          .getGooglePlaceName(
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].name''',
                                                                      true,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      double.tryParse(_model
                                                                          .textController1
                                                                          .text),
                                                                      0.0,
                                                                    ),
                                                                    FFAppState().currentLocation ==
                                                                            'Current Location'
                                                                        ? currentUserLocationValue!
                                                                        : _model
                                                                            .placePickerValue
                                                                            .latLng,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      double.tryParse(_model
                                                                          .textController2
                                                                          .text),
                                                                      2000.0,
                                                                    ),
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].geometry.location.lat''',
                                                                      true,
                                                                    )!,
                                                                    getJsonField(
                                                                      (_model.nearbyPlaceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.results[:].geometry.location.lng''',
                                                                      true,
                                                                    )!,
                                                                  );
                                                                  _model.evenntID =
                                                                      await CreateEventCall
                                                                          .call(
                                                                    ipAddress:
                                                                        FFAppState()
                                                                            .myIpAddress,
                                                                    loginId:
                                                                        FFAppState()
                                                                            .sessionId,
                                                                    sessionId:
                                                                        FFAppState()
                                                                            .sessionId,
                                                                  );
                                                                  if ((_model
                                                                          .evenntID
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model.currentAddress =
                                                                        await actions
                                                                            .getAddressFromLatLng(
                                                                      FFAppState().currentLocation ==
                                                                              'Current Location'
                                                                          ? currentUserLocationValue!
                                                                          : _model
                                                                              .placePickerValue
                                                                              .latLng,
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Search event failed!',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        ProcessProductRequestCall
                                                                            .message(
                                                                          (_model.searchServiceResponse?.jsonBody ??
                                                                              ''),
                                                                        )!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      functions.latlngToString(FFAppState().currentLocation ==
                                                                              'Current Location'
                                                                          ? currentUserLocationValue!
                                                                          : _model
                                                                              .placePickerValue
                                                                              .latLng),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                            _model.mymapBackendRefinedResult =
                                                                await GetMymapCall
                                                                    .call(
                                                              radius1:
                                                                  valueOrDefault<
                                                                      double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .textController1
                                                                        .text),
                                                                0.0,
                                                              ),
                                                              radius2:
                                                                  valueOrDefault<
                                                                      double>(
                                                                double.tryParse(
                                                                    _model
                                                                        .textController2
                                                                        .text),
                                                                2000.0,
                                                              ),
                                                              query: _model
                                                                  .searchController
                                                                  .text,
                                                              centerLat: functions.getlan(FFAppState()
                                                                          .currentLocation ==
                                                                      'Current Location'
                                                                  ? currentUserLocationValue!
                                                                  : _model
                                                                      .placePickerValue
                                                                      .latLng),
                                                              centerLon: functions.getlon(FFAppState()
                                                                          .currentLocation ==
                                                                      'Current Location'
                                                                  ? currentUserLocationValue!
                                                                  : _model
                                                                      .placePickerValue
                                                                      .latLng),
                                                              apiKey:
                                                                  FFAppState()
                                                                      .dowellKey,
                                                            );
                                                            if ((_model
                                                                    .mymapBackendRefinedResult
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if (GetMymapCall
                                                                      .refinedData(
                                                                    (_model.mymapBackendRefinedResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).isNotEmpty) {
                                                                _model.getLocationServiceResponse =
                                                                    await ProcessProductRequestCall
                                                                        .call(
                                                                  apiKey:
                                                                      FFAppState()
                                                                          .apiKey,
                                                                  subServiceIds:
                                                                      'DOWELL100412',
                                                                );
                                                                if ((_model
                                                                        .getLocationServiceResponse
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .credit =
                                                                        ProcessProductRequestCall
                                                                            .credits(
                                                                      (_model.getLocationServiceResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString();
                                                                  });
                                                                  _model.dblocationCord =
                                                                      await actions
                                                                          .getLocatCordFromString(
                                                                    (getJsonField(
                                                                      (_model.mymapBackendRefinedResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data[:].location_coord''',
                                                                      true,
                                                                    ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList(),
                                                                  );
                                                                  _model.dbPlacename =
                                                                      await actions
                                                                          .getDbPlaceName(
                                                                    getJsonField(
                                                                      (_model.mymapBackendRefinedResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data[:].place_name''',
                                                                      true,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        ProcessProductRequestCall
                                                                            .message(
                                                                          (_model.getLocationServiceResponse?.jsonBody ??
                                                                              ''),
                                                                        )!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                    ),
                                                                  );
                                                                }
                                                              }
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Category field can\'t be empty.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                              ),
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                21.0, 50.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: const CircleBorder(),
                                    child: ClipOval(
                                      child: Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              valueOrDefault<String>(
                                                functions
                                                    .userprofile(getJsonField(
                                                      FFAppState().response,
                                                      r'''$.userinfo.profile_img''',
                                                    ).toString())
                                                    ?.toString(),
                                                'https://100014.pythonanywhere.com/media/user.png',
                                              ),
                                            ),
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            width: 4.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().isAuthUser == false)
                                  Container(
                                    width: 94.0,
                                    height: 52.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(60.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(60.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Visibility(
                                      visible: FFAppState().isAuthUser == false,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('LoginComponent');
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.userSlash,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xww5jydn' /* Login */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if (kDebugMode)
                                  Container(
                                    width: 120.0,
                                    height: 52.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(60.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(60.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState().noMoreCredit) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You have less credits.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .btnText,
                                              ),
                                            );
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: SizedBox(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.8,
                                                        child:
                                                            const GroupListDialogComponentWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.domain_add_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tkk4nv2b' /* Group */,
                                                ),
                                                textAlign: TextAlign.justify,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
