import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'search_bottom_sheet_model.dart';
export 'search_bottom_sheet_model.dart';

class SearchBottomSheetWidget extends StatefulWidget {
  const SearchBottomSheetWidget({super.key});

  @override
  State<SearchBottomSheetWidget> createState() =>
      _SearchBottomSheetWidgetState();
}

class _SearchBottomSheetWidgetState extends State<SearchBottomSheetWidget> {
  late SearchBottomSheetModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBottomSheetModel());

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
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
        child: Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: 50.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault<bool>(
                        FFAppState().currentLocation == 'Select Location',
                        false,
                      ))
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.05, -1.0),
                            child: FlutterFlowPlacePicker(
                              iOSGoogleMapsApiKey:
                                  'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk',
                              androidGoogleMapsApiKey:
                                  'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4',
                              webGoogleMapsApiKey:
                                  'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                              onSelect: (place) async {
                                setState(() => _model.placePickerValue = place);
                              },
                              defaultText: FFLocalizations.of(context).getText(
                                'afj62t78' /* Search Location */,
                              ),
                              icon: const Icon(
                                Icons.place,
                                color: Colors.white,
                                size: 16.0,
                              ),
                              buttonOptions: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      letterSpacing: 2.0,
                                    ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowRadioButton(
                      options: [
                        FFLocalizations.of(context).getText(
                          'gm817yco' /* Current  Location */,
                        ),
                        FFLocalizations.of(context).getText(
                          '828ysqx0' /* Select  Location */,
                        )
                      ].toList(),
                      onChanged: (val) async {
                        setState(() {});
                        FFAppState().update(() {
                          FFAppState().currentLocation =
                              _model.radioButtonValue!;
                        });
                      },
                      controller: _model.radioButtonValueController ??=
                          FormFieldController<String>(null),
                      optionHeight: 24.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                      textPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.horizontal,
                      radioButtonColor: const Color(0xFF015534),
                      inactiveRadioButtonColor: const Color(0x8A000000),
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 16.0, 25.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'bqyscjaa' /* Distance
Between */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 4.0, 0.0),
                            child: SizedBox(
                              width: 88.0,
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'cx71j7bs' /* 0 */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                      ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x4C005734),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 10.0,
                          height: 2.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 8.0, 0.0),
                            child: SizedBox(
                              width: 88.0,
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'tj4rgf9x' /* 2000 */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                      ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x4C005734),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'n3tveenp' /* M */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        fillColor: FlutterFlowTheme.of(context).secondary,
                        icon: FaIcon(
                          FontAwesomeIcons.redo,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () {
                          print('resetButton pressed ...');
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              14.0, 0.0, 14.0, 0.0),
                          child: SizedBox(
                            width: 88.0,
                            child: TextFormField(
                              controller: _model.searchController,
                              focusNode: _model.searchFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.searchController',
                                const Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'dfefdlvf' /* Search here */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x4C005734),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                suffixIcon:
                                    _model.searchController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.searchController?.clear();
                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.clear,
                                              size: 20.0,
                                            ),
                                          )
                                        : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.searchControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).white,
                          size: 20.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          currentUserLocationValue =
                              await getCurrentUserLocation(
                                  defaultLocation: const LatLng(0.0, 0.0));
                          setState(() {
                            FFAppState().clearmap = true;
                          });
                          await actions.hideSoftKeyboard();
                          _model.nearbyPlaceResponse =
                              await NearbyPlaceCall.call(
                            query: _model.searchController.text,
                            location: functions.latlngToString(
                                FFAppState().currentLocation ==
                                        'Current Location'
                                    ? currentUserLocationValue!
                                    : _model.placePickerValue.latLng),
                            radius: int.tryParse(_model.textController2.text),
                            key: () {
                              if (isAndroid) {
                                return FFAppState().androidGoogleMapKey;
                              } else if (isiOS) {
                                return FFAppState().iosGoogleMapKey;
                              } else {
                                return FFAppState().webGoogleApiKey;
                              }
                            }(),
                          );
                          if ((_model.nearbyPlaceResponse?.succeeded ?? true)) {
                            if (functions
                                    .groupLocsConverter(NearbyPlaceCall.data(
                                      (_model.nearbyPlaceResponse?.jsonBody ??
                                          ''),
                                    )?.toList()).isNotEmpty) {
                              _model.googleResult =
                                  await actions.refineGoogleResult(
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].geometry.location.lat''',
                                  true,
                                )!,
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].geometry.location.lng''',
                                  true,
                                )!,
                                double.parse(_model.textController1.text),
                                double.parse(_model.textController2.text),
                                FFAppState().currentLocation ==
                                        'Current Location'
                                    ? currentUserLocationValue!
                                    : _model.placePickerValue.latLng,
                              );
                              _model.placeIDs = await actions.refineplaceid(
                                double.parse(_model.textController1.text),
                                double.parse(_model.textController2.text),
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].geometry.location.lat''',
                                  true,
                                )!,
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].geometry.location.lng''',
                                  true,
                                )!,
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].place_id''',
                                  true,
                                )!,
                                FFAppState().currentLocation ==
                                        'Current Location'
                                    ? currentUserLocationValue!
                                    : _model.placePickerValue.latLng,
                              );
                              _model.googlePlaceName =
                                  await actions.getGooglePlaceName(
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].name''',
                                  true,
                                ),
                                double.parse(_model.textController1.text),
                                FFAppState().currentLocation ==
                                        'Current Location'
                                    ? currentUserLocationValue!
                                    : _model.placePickerValue.latLng,
                                double.parse(_model.textController2.text),
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].geometry.location.lat''',
                                  true,
                                )!,
                                getJsonField(
                                  (_model.nearbyPlaceResponse?.jsonBody ?? ''),
                                  r'''$.results[:].geometry.location.lng''',
                                  true,
                                )!,
                              );
                              _model.evenntID = await CreateEventCall.call(
                                ipAddress: FFAppState().myIpAddress,
                                loginId: FFAppState().sessionId,
                                sessionId: FFAppState().sessionId,
                              );
                              if ((_model.evenntID?.succeeded ?? true)) {
                                _model.currentAddress =
                                    await actions.getAddressFromLatLng(
                                  FFAppState().currentLocation ==
                                          'Current Location'
                                      ? currentUserLocationValue!
                                      : _model.placePickerValue.latLng,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Search event failed!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
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
                                    'No nearby place found',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Search failed!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                          }

                          _model.mymapBackendRefinedResult =
                              await GetMymapCall.call(
                            radius1:
                                double.tryParse(_model.textController1.text),
                            radius2:
                                double.tryParse(_model.textController2.text),
                            query: _model.searchController.text,
                            centerLat: functions.getlan(
                                FFAppState().currentLocation ==
                                        'Current Location'
                                    ? currentUserLocationValue!
                                    : _model.placePickerValue.latLng),
                            centerLon: functions.getlon(
                                FFAppState().currentLocation ==
                                        'Current Location'
                                    ? currentUserLocationValue!
                                    : _model.placePickerValue.latLng),
                            dataType: 'registered',
                            apiKey: FFAppState().dowellKey,
                          );
                          if ((_model.mymapBackendRefinedResult?.succeeded ??
                              true)) {
                            if (functions
                                    .groupLocsConverter(
                                        GetMymapCall.refinedData(
                                      (_model.mymapBackendRefinedResult
                                              ?.jsonBody ??
                                          ''),
                                    )?.toList()).isNotEmpty) {
                              _model.dblocationCord =
                                  await actions.getLocatCordFromString(
                                (getJsonField(
                                  (_model.mymapBackendRefinedResult?.jsonBody ??
                                      ''),
                                  r'''$.data[:].location_coord''',
                                  true,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList(),
                              );
                              _model.dbPlacename = await actions.getDbPlaceName(
                                getJsonField(
                                  (_model.mymapBackendRefinedResult?.jsonBody ??
                                      ''),
                                  r'''$.data[:].place_name''',
                                  true,
                                ),
                              );
                            }
                          }

                          setState(() {});
                        },
                      ),
                    ],
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
