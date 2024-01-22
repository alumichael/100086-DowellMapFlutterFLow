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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'livinglabs_map_component_model.dart';
export 'livinglabs_map_component_model.dart';

class LivinglabsMapComponentWidget extends StatefulWidget {
  const LivinglabsMapComponentWidget({Key? key}) : super(key: key);

  @override
  _LivinglabsMapComponentWidgetState createState() =>
      _LivinglabsMapComponentWidgetState();
}

class _LivinglabsMapComponentWidgetState
    extends State<LivinglabsMapComponentWidget> {
  late LivinglabsMapComponentModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LivinglabsMapComponentModel());

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
            '2hg7pv7u' /* 0 */,
          );
          _model.textController2?.text = FFLocalizations.of(context).getText(
            'fu7m9ho4' /* 2000 */,
          );
          _model.textController3?.text = FFLocalizations.of(context).getText(
            'p855uqzc' /* school */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

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

    return Column(
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qatezv9r' /* DoWell Maps */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).white,
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowLanguageSelector(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        borderColor: FlutterFlowTheme.of(context).white,
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
                        onChanged: (lang) => setAppLanguage(context, lang),
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
              Container(
                width: double.infinity,
                height: double.infinity,
                child: custom_widgets.MyMapWidget(
                  width: double.infinity,
                  height: double.infinity,
                  radius1: double.tryParse(_model.textController1.text),
                  radius2: double.parse(_model.textController2.text),
                  query: _model.textController3.text,
                  iOSGoogleMapsApiKey: FFAppState().iosAPIKey,
                  androidGoogleMapsApiKey: FFAppState().androidKey,
                  webGoogleMapsApiKey: FFAppState().webMapApiKey,
                  origin: _model.radioButtonValue == 'Current Location'
                      ? currentUserLocationValue
                      : _model.placePickerValue.latLng,
                  result: _model.googleResult,
                  address: _model.googlePlaceName,
                  clearmap: FFAppState().clearmap,
                  dbResult: _model.dblocationCord,
                  dbAddress: _model.dbPlacename,
                  PlaceIds: _model.placeIDs,
                  navigateTo: () async {
                    context.pushNamed(
                      'placedetails',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                        ),
                      },
                    );
                  },
                  deleteAction: () async {},
                  updateAction: () async {},
                ),
              ),
              if (FFAppState().isAuthUser == false)
                Align(
                  alignment: AlignmentDirectional(1.03, -0.97),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'LoginComponent',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '4oyml2yr' /* Log in */,
                    ),
                    options: FFButtonOptions(
                      height: 49.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xB8005734),
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
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(0.0),
                      ),
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
                            alignment: AlignmentDirectional(-0.15, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (FFAppState().currentLocation ==
                                    'Select Location')
                                  Align(
                                    alignment: AlignmentDirectional(0.05, -1.0),
                                    child: FlutterFlowPlacePicker(
                                      iOSGoogleMapsApiKey:
                                          'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk',
                                      androidGoogleMapsApiKey:
                                          'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4',
                                      webGoogleMapsApiKey:
                                          'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                      onSelect: (place) async {
                                        setState(() =>
                                            _model.placePickerValue = place);
                                      },
                                      defaultText:
                                          FFLocalizations.of(context).getText(
                                        'gssaq0cs' /* Search Location */,
                                      ),
                                      icon: Icon(
                                        Icons.place,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                      buttonOptions: FFButtonOptions(
                                        width: double.infinity,
                                        height: 56.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                            BorderRadius.circular(0.0),
                                      ),
                                    ),
                                  ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 8.0, 10.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FlutterFlowRadioButton(
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2dnncjyy' /* Current Location */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n9jvf286' /* Select Location */,
                                              )
                                            ].toList(),
                                            onChanged: (val) async {
                                              setState(() {});
                                              setState(() {
                                                FFAppState().currentLocation =
                                                    _model.radioButtonValue!;
                                              });
                                            },
                                            controller: _model
                                                    .radioButtonValueController ??=
                                                FormFieldController<String>(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                              'b3jxxgia' /* Current Location */,
                                            )),
                                            optionHeight: 24.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            textPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.horizontal,
                                            radioButtonColor: Color(0xFF015534),
                                            inactiveRadioButtonColor:
                                                Color(0x8A000000),
                                            toggleable: false,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'vbqp4sqr' /* Distance Between */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController1,
                                                  focusNode: _model
                                                      .textFieldFocusNode1,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '9huplfsf' /* From Distance */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF015534),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .background,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .textController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController2,
                                                  focusNode: _model
                                                      .textFieldFocusNode2,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '5f3f33gi' /* To Distance */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF015534),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .background,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .textController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 12.0, 10.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 5.0,
                                              borderWidth: 1.0,
                                              buttonSize: 43.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              icon: Icon(
                                                Icons.refresh,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().clearmap = true;
                                                });
                                                if (FFAppState().clearmap ==
                                                    true) {
                                                  setState(() {
                                                    _model.textController1
                                                            ?.text =
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '2hg7pv7u' /* 0 */,
                                                    );
                                                    _model.textController2
                                                            ?.text =
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'fu7m9ho4' /* 2000 */,
                                                    );
                                                    _model.textController3
                                                            ?.text =
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'p855uqzc' /* school */,
                                                    );
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController3,
                                                  focusNode: _model
                                                      .textFieldFocusNode3,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController3',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '4knzax39' /* Search  e.g School, Park */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF015534),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .background,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    suffixIcon: _model
                                                            .textController3!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .textController3
                                                                  ?.clear();
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF757575),
                                                              size: 22.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  validator: _model
                                                      .textController3Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              borderRadius: 5.0,
                                              borderWidth: 1.0,
                                              buttonSize: 46.0,
                                              fillColor: Color(0xFF015534),
                                              icon: Icon(
                                                Icons.search_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                size: 20.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed: () async {
                                                currentUserLocationValue =
                                                    await getCurrentUserLocation(
                                                        defaultLocation:
                                                            LatLng(0.0, 0.0));
                                                setState(() {
                                                  FFAppState().clearmap = false;
                                                });
                                                await actions
                                                    .hideSoftKeyboard();
                                                _model.nearbyPlaceResponse =
                                                    await NearbyPlaceCall.call(
                                                  query: _model
                                                      .textController3.text,
                                                  location: functions
                                                      .latlngToString(FFAppState()
                                                                  .currentLocation ==
                                                              'Current Location'
                                                          ? currentUserLocationValue!
                                                          : _model
                                                              .placePickerValue
                                                              .latLng),
                                                  radius: int.tryParse(_model
                                                      .textController2.text),
                                                  key: () {
                                                    if (isAndroid) {
                                                      return FFAppState()
                                                          .androidKey;
                                                    } else if (isiOS) {
                                                      return FFAppState()
                                                          .iosAPIKey;
                                                    } else {
                                                      return FFAppState()
                                                          .webMapApiKey;
                                                    }
                                                  }(),
                                                );
                                                if ((_model.nearbyPlaceResponse
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (functions
                                                          .groupLocsConverter(
                                                              NearbyPlaceCall
                                                                  .data(
                                                            (_model.nearbyPlaceResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          ?.length !=
                                                      0) {
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
                                                    _model.placeIDs =
                                                        await actions
                                                            .refineplaceid(
                                                      double.parse(_model
                                                          .textController1
                                                          .text),
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
                                                    _model.evenntID =
                                                        await CreateEventCall
                                                            .call(
                                                      ipAddress: FFAppState()
                                                          .myIpAddress,
                                                      loginId: FFAppState()
                                                          .sessionId,
                                                      sessionId: FFAppState()
                                                          .sessionId,
                                                    );
                                                    if ((_model.evenntID
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
                                                      _model.logResponse =
                                                          await SendLogDataCall
                                                              .call(
                                                        mongoID: random_data
                                                            .randomString(
                                                          1,
                                                          10,
                                                          true,
                                                          false,
                                                          false,
                                                        ),
                                                        reqID: random_data
                                                            .randomString(
                                                          1,
                                                          10,
                                                          true,
                                                          false,
                                                          false,
                                                        ),
                                                        reqType: 'nearby_place',
                                                        eventId: CreateEventCall
                                                            .eventID(
                                                          (_model.evenntID
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        dataTimeDone:
                                                            dateTimeFormat(
                                                          'yMMMd',
                                                          getCurrentTimestamp,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        userName: random_data
                                                            .randomName(
                                                                true, false),
                                                        sessionId: FFAppState()
                                                            .sessionId,
                                                        locationDone: functions
                                                            .latlngToString(_model
                                                                .placePickerValue
                                                                .latLng),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Search event failed!',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Something went wrong',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please wait...',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  );
                                                }

                                                _model.mymapBackendRefinedResult =
                                                    await GetMymapCall.call(
                                                  radius1: double.tryParse(
                                                      _model.textController1
                                                          .text),
                                                  radius2: double.tryParse(
                                                      _model.textController2
                                                          .text),
                                                  query: _model
                                                      .textController3.text,
                                                  centerLat: functions.getlan(
                                                      FFAppState().currentLocation ==
                                                              'Current Location'
                                                          ? currentUserLocationValue!
                                                          : _model
                                                              .placePickerValue
                                                              .latLng),
                                                  centerLon: functions.getlon(
                                                      FFAppState().currentLocation ==
                                                              'Current Location'
                                                          ? currentUserLocationValue!
                                                          : _model
                                                              .placePickerValue
                                                              .latLng),
                                                  dataType: 'registered',
                                                  apiKey: 'hdhdhdh',
                                                );
                                                if ((_model
                                                        .mymapBackendRefinedResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (functions
                                                          .groupLocsConverter(
                                                              GetMymapCall
                                                                  .refinedData(
                                                            (_model.mymapBackendRefinedResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          ?.length !=
                                                      0) {
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
                                                        content: Text(
                                                          'Local data returned empty',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Search failed , please try again.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  );
                                                }

                                                FFAppState().update(() {});

                                                setState(() {});
                                              },
                                            ),
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
    );
  }
}
