import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_screen_version1_model.dart';
export 'home_screen_version1_model.dart';

class HomeScreenVersion1Widget extends StatefulWidget {
  const HomeScreenVersion1Widget({Key? key}) : super(key: key);

  @override
  _HomeScreenVersion1WidgetState createState() =>
      _HomeScreenVersion1WidgetState();
}

class _HomeScreenVersion1WidgetState extends State<HomeScreenVersion1Widget> {
  late HomeScreenVersion1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenVersion1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ipAddress = await IpifyCall.call();
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController1?.text = FFLocalizations.of(context).getText(
            '7l37sekx' /* 0 */,
          );
          _model.textController2?.text = FFLocalizations.of(context).getText(
            '4kjdjttk' /* 0 */,
          );
          _model.textController3?.text = FFLocalizations.of(context).getText(
            '5x34ca9g' /* school */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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

    return FutureBuilder<ApiCallResponse>(
      future: LinkBageLoginCall.call(
        username: 'username',
        os: isAndroid.toString(),
        device: 'mobile',
        browser: 'Dowell Browser',
        location: currentUserLocationValue?.toString(),
        time: valueOrDefault<String>(
          dateTimeFormat(
            'Hm',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ),
          '00:00',
        ),
        connection: 'wifi',
        ip: '192.168.00.1',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        final homeScreenVersion1LinkBageLoginResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      decoration: BoxDecoration(
                        color: Color(0xFF015534),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'o0fh54ty' /* DoWell Maps */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).white,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowLanguageSelector(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  borderColor:
                                      FlutterFlowTheme.of(context).white,
                                  dropdownColor: Color(0x00000000),
                                  dropdownIconColor: Color(0xFF14181B),
                                  borderRadius: 8.0,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.0,
                                  ),
                                  hideFlags: false,
                                  flagSize: 24.0,
                                  flagTextGap: 8.0,
                                  currentLanguage:
                                      FFLocalizations.of(context).languageCode,
                                  languages: FFLocalizations.languages(),
                                  onChanged: (lang) =>
                                      setAppLanguage(context, lang),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onDoubleTap: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Add Place',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).white,
                                action: SnackBarAction(
                                  label: 'Add',
                                  onPressed: () async {
                                    context.pushNamed(
                                      'placedetailsCopy',
                                      queryParameters: {
                                        'ipAddress': serializeParam(
                                          getJsonField(
                                            (_model.ipAddress?.jsonBody ?? ''),
                                            r'''$.ip''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'sessionID': serializeParam(
                                          LinkBageLoginCall.sessionID(
                                            homeScreenVersion1LinkBageLoginResponse
                                                .jsonBody,
                                          ),
                                          ParamType.String,
                                        ),
                                        'currentCord': serializeParam(
                                          valueOrDefault<String>(
                                            functions.latlngToString(
                                                currentUserLocationValue!),
                                            '78.32,76.83',
                                          ),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.MyMapWidget(
                              width: double.infinity,
                              height: double.infinity,
                              radius1: valueOrDefault<double>(
                                double.tryParse(_model.textController1.text),
                                0.0,
                              ),
                              radius2: valueOrDefault<double>(
                                double.tryParse(_model.textController2.text),
                                2000.0,
                              ),
                              query: _model.textController3.text,
                              iOSGoogleMapsApiKey:
                                  'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk',
                              androidGoogleMapsApiKey:
                                  'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4',
                              webGoogleMapsApiKey:
                                  'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                              origin: FFAppState().currentLocation ==
                                      'Current Location'
                                  ? currentUserLocationValue
                                  : _model.placePickerValue.latLng,
                              result: _model.result,
                              address: _model.addr,
                              clearmap: FFAppState().clearmap,
                              dbResult: _model.result,
                              dbAddress: _model.addr,
                              navigateTo: () async {},
                              deleteAction: () async {},
                              updateAction: () async {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 16.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.15, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (FFAppState().currentLocation ==
                                              'Select  Location')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.05, -1.0),
                                              child: FlutterFlowPlacePicker(
                                                iOSGoogleMapsApiKey:
                                                    'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk',
                                                androidGoogleMapsApiKey:
                                                    'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4',
                                                webGoogleMapsApiKey:
                                                    'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                                onSelect: (place) async {
                                                  setState(() =>
                                                      _model.placePickerValue =
                                                          place);
                                                },
                                                defaultText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '53diz7lu' /* Select Location */,
                                                ),
                                                icon: Icon(
                                                  Icons.place,
                                                  color: Colors.white,
                                                  size: 16.0,
                                                ),
                                                buttonOptions: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 56.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        letterSpacing: 2.0,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                              ),
                                            ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 8.0, 10.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    FlutterFlowRadioButton(
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pal0e3p8' /* Current  Location */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'xqute3hf' /* Select  Location */,
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
                                                              String>(null),
                                                      optionHeight: 24.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      textPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      buttonPosition:
                                                          RadioButtonPosition
                                                              .left,
                                                      direction:
                                                          Axis.horizontal,
                                                      radioButtonColor:
                                                          Color(0xFF015534),
                                                      inactiveRadioButtonColor:
                                                          Color(0x8A000000),
                                                      toggleable: false,
                                                      horizontalAlignment:
                                                          WrapAlignment.start,
                                                      verticalAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'k9zleaja' /* Distance Between(m) */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController1,
                                                            focusNode: _model
                                                                .textFieldFocusNode1,
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '7b5qp2fr' /* From Distance */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF015534),
                                                                  width: 1.0,
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
                                                                      .background,
                                                                  width: 1.0,
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
                                                                      .customColor3,
                                                                  width: 1.0,
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
                                                                      .customColor3,
                                                                  width: 1.0,
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .textController1Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController2,
                                                            focusNode: _model
                                                                .textFieldFocusNode2,
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '1s42a42a' /* To Distance */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF015534),
                                                                  width: 1.0,
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
                                                                      .background,
                                                                  width: 1.0,
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
                                                                      .customColor3,
                                                                  width: 1.0,
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
                                                                      .customColor3,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .textController2Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 12.0, 10.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 5.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.refresh,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        size: 15.0,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () async {
                                                        setState(() {
                                                          FFAppState()
                                                              .clearmap = true;
                                                        });
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController3,
                                                            focusNode: _model
                                                                .textFieldFocusNode3,
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'vpp9tzbc' /* Search  eg School, Park */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF015534),
                                                                  width: 1.0,
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
                                                                      .background,
                                                                  width: 1.0,
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
                                                                      .customColor3,
                                                                  width: 1.0,
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
                                                                      .customColor3,
                                                                  width: 1.0,
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                            validator: _model
                                                                .textController3Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 5.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.search_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        size: 15.0,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () async {
                                                        currentUserLocationValue =
                                                            await getCurrentUserLocation(
                                                                defaultLocation:
                                                                    LatLng(0.0,
                                                                        0.0));
                                                        var _shouldSetState =
                                                            false;
                                                        FFAppState().clearmap =
                                                            false;
                                                        _model.nearbyPlaceResponse =
                                                            await NearbyPlaceCall
                                                                .call(
                                                          query: _model
                                                              .textController3
                                                              .text,
                                                          location: functions.latlngToString(FFAppState()
                                                                      .currentLocation ==
                                                                  'Current Location'
                                                              ? currentUserLocationValue!
                                                              : _model
                                                                  .placePickerValue
                                                                  .latLng),
                                                          radius: int.tryParse(
                                                              _model
                                                                  .textController2
                                                                  .text),
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .nearbyPlaceResponse
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.result =
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
                                                            double.parse(_model
                                                                .textController1
                                                                .text),
                                                            double.parse(_model
                                                                .textController2
                                                                .text),
                                                            FFAppState().currentLocation ==
                                                                    'Current Location'
                                                                ? currentUserLocationValue!
                                                                : _model
                                                                    .placePickerValue
                                                                    .latLng,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (_model.result
                                                                  ?.length ==
                                                              0) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Search not found',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0x00000000),
                                                              ),
                                                            );
                                                          }
                                                          _model.addr =
                                                              await actions
                                                                  .getGooglePlaceName(
                                                            getJsonField(
                                                              (_model.nearbyPlaceResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.results[:].name''',
                                                              true,
                                                            ),
                                                            double.parse(_model
                                                                .textController1
                                                                .text),
                                                            FFAppState().currentLocation ==
                                                                    'Current Location'
                                                                ? currentUserLocationValue!
                                                                : _model
                                                                    .placePickerValue
                                                                    .latLng,
                                                            double.parse(_model
                                                                .textController2
                                                                .text),
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
                                                          _shouldSetState =
                                                              true;
                                                          _model.evenntID =
                                                              await CreateEventCall
                                                                  .call(
                                                            ipAddress:
                                                                getJsonField(
                                                              (_model.ipAddress
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.ip''',
                                                            ).toString(),
                                                            loginId:
                                                                LinkBageLoginCall
                                                                    .sessionID(
                                                              homeScreenVersion1LinkBageLoginResponse
                                                                  .jsonBody,
                                                            ),
                                                            sessionId:
                                                                LinkBageLoginCall
                                                                    .sessionID(
                                                              homeScreenVersion1LinkBageLoginResponse
                                                                  .jsonBody,
                                                            ),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(_model.evenntID
                                                                  ?.succeeded ??
                                                              true)) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'An eerror has occured',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0x00000000),
                                                              ),
                                                            );
                                                          }
                                                          _model.doWellMap =
                                                              await NearbyPlacesDataCall
                                                                  .call(
                                                            startLocation: FFAppState()
                                                                        .currentLocation ==
                                                                    'Current Location'
                                                                ? currentUserLocationValue
                                                                    ?.toString()
                                                                : functions
                                                                    .latlngToString(_model
                                                                        .placePickerValue
                                                                        .latLng),
                                                            queryText: _model
                                                                .textController3
                                                                .text,
                                                            radiusDistanceFrom:
                                                                _model
                                                                    .textController1
                                                                    .text,
                                                            radiusDistanceTo: _model
                                                                .textController2
                                                                .text,
                                                            startAddress: _model
                                                                .placePickerValue
                                                                .address,
                                                            eventId:
                                                                CreateEventCall
                                                                    .eventID(
                                                              (_model.evenntID
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            isError: false,
                                                            error: 'None',
                                                            dateTimeDone:
                                                                dateTimeFormat(
                                                              'yMMMd',
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            responseJson:
                                                                functions.jsondata(
                                                                    _model.addr
                                                                        ?.toList(),
                                                                    _model
                                                                        .result
                                                                        ?.toList()),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(_model.doWellMap
                                                                  ?.succeeded ??
                                                              true)) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'An Error occured',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0x00000000),
                                                              ),
                                                            );
                                                          }
                                                          _model.logResponse =
                                                              await SendLogDataCall
                                                                  .call(
                                                            mongoID:
                                                                NearbyPlacesDataCall
                                                                    .insertID(
                                                              (_model.doWellMap
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            reqID:
                                                                NearbyPlacesDataCall
                                                                    .insertID(
                                                              (_model.doWellMap
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            reqType:
                                                                'nearbyplaces',
                                                            eventId:
                                                                CreateEventCall
                                                                    .eventID(
                                                              (_model.evenntID
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            dataTimeDone:
                                                                dateTimeFormat(
                                                              'yMMMd',
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            userName:
                                                                random_data
                                                                    .randomName(
                                                                        true,
                                                                        false),
                                                            sessionId:
                                                                LinkBageLoginCall
                                                                    .sessionID(
                                                              homeScreenVersion1LinkBageLoginResponse
                                                                  .jsonBody,
                                                            ),
                                                            locationDone: functions
                                                                .latlngToString(
                                                                    _model
                                                                        .placePickerValue
                                                                        .latLng),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Nearby place search failed!',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
