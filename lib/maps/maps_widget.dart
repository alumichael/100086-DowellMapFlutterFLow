import '/backend/api_requests/api_calls.dart';
import '/components/searchbox_copy_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'maps_model.dart';
export 'maps_model.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late MapsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ip = await actions.getIpAddress();
    });

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

    return FutureBuilder<ApiCallResponse>(
      future: LinkBageLoginCall.call(
        username: 'username',
        device: 'mobile',
        os: 'android',
        browser: 'dowell map mobile',
        location: 'null',
        time: '08:21',
        connection: 'wifi',
        ip: '192.168.0.1',
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
        final mapsLinkBageLoginResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onDoubleTap: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Add Place',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                      action: SnackBarAction(
                        label: 'Add',
                        onPressed: () async {
                          context.pushNamed('placedetailsCopy');
                        },
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 10.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) =>
                                      _model.googleMapsCenter = latLng,
                                  initialLocation: _model.googleMapsCenter ??=
                                      LatLng(13.106061, -59.613158),
                                  markerColor: GoogleMarkerColor.violet,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 14.0,
                                  allowInteraction: true,
                                  allowZoom: true,
                                  showZoomControls: true,
                                  showLocation: true,
                                  showCompass: false,
                                  showMapToolbar: false,
                                  showTraffic: false,
                                  centerMapOnMarkerTap: true,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onDoubleTap: () async {
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
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        action: SnackBarAction(
                                          label: 'Add Place to map',
                                          onPressed: () async {
                                            context
                                                .pushNamed('placedetailsCopy');
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.07,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF015534),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ewi5pxl1' /* DoWell Maps */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    40.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowLanguageSelector(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              dropdownColor: Color(0x00000000),
                                              dropdownIconColor:
                                                  Color(0xFF14181B),
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
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                              languages:
                                                  FFLocalizations.languages(),
                                              onChanged: (lang) =>
                                                  setAppLanguage(context, lang),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (FFAppState().currentLocation ==
                                  'Specified Location')
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.41),
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
                                      'ktsb4915' /* Select Location */,
                                    ),
                                    icon: Icon(
                                      Icons.place,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                    buttonOptions: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.94),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.251,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model.searchboxCopyModel,
                                        updateCallback: () => setState(() {}),
                                        child: SearchboxCopyWidget(),
                                      ),
                                    ],
                                  ),
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
        );
      },
    );
  }
}
