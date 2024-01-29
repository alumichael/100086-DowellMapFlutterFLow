import '/backend/api_requests/api_calls.dart';
import '/components/add_group_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'newplacedetails_model.dart';
export 'newplacedetails_model.dart';

class NewplacedetailsWidget extends StatefulWidget {
  const NewplacedetailsWidget({
    super.key,
    this.currentCord,
  });

  final String? currentCord;

  @override
  State<NewplacedetailsWidget> createState() => _NewplacedetailsWidgetState();
}

class _NewplacedetailsWidgetState extends State<NewplacedetailsWidget> {
  late NewplacedetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewplacedetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    _model.placeNameEdtController ??= TextEditingController(
        text: FFAppState().toEditJson != null
            ? getJsonField(
                FFAppState().toEditJson,
                r'''$.loc_details.place_name''',
              ).toString().toString()
            : null);
    _model.placeNameEdtFocusNode ??= FocusNode();

    _model.addressEdtController ??= TextEditingController(
        text: FFAppState().toEditJson != null
            ? getJsonField(
                FFAppState().toEditJson,
                r'''$.loc_details.address''',
              ).toString().toString()
            : null);
    _model.addressEdtFocusNode ??= FocusNode();

    _model.selectedLocationEdtController ??= TextEditingController(
        text: FFAppState().toEditJson != null
            ? getJsonField(
                FFAppState().toEditJson,
                r'''$.loc_details.location_coord''',
              ).toString().toString()
            : FFAppState().selectedLocation);
    _model.selectedLocationEdtFocusNode ??= FocusNode();

    _model.openHoursEdtController ??= TextEditingController(
        text: FFAppState().toEditJson != null
            ? getJsonField(
                FFAppState().toEditJson,
                r'''$.loc_details.day_hours''',
              ).toString().toString()
            : null);
    _model.openHoursEdtFocusNode ??= FocusNode();

    _model.phonrNumEdtController ??= TextEditingController(
        text: FFAppState().toEditJson != null
            ? getJsonField(
                FFAppState().toEditJson,
                r'''$.loc_details.phone''',
              ).toString().toString()
            : null);
    _model.phonrNumEdtFocusNode ??= FocusNode();

    _model.countryEdtController ??= TextEditingController(
        text: FFAppState().toEditJson != null
            ? getJsonField(
                FFAppState().toEditJson,
                r'''$.loc_details.country''',
              ).toString().toString()
            : null);
    _model.countryEdtFocusNode ??= FocusNode();

    _model.websiteEdtController ??= TextEditingController(
        text: FFAppState().toEditJson != null
            ? getJsonField(
                FFAppState().toEditJson,
                r'''$.loc_details.website''',
              ).toString().toString()
            : null);
    _model.websiteEdtFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '842romr0' /* Add a place */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowDropDown<String>(
                            controller: _model.selectgroupValueController ??=
                                FormFieldController<String>(
                              _model.selectgroupValue ??=
                                  FFAppState().toEditJson != null
                                      ? getJsonField(
                                          FFAppState().toEditJson,
                                          r'''$.group_name''',
                                        ).toString()
                                      : null,
                            ),
                            options: FFAppState().groupList,
                            onChanged: (val) =>
                                setState(() => _model.selectgroupValue = val),
                            width: MediaQuery.sizeOf(context).width * 0.72,
                            height: MediaQuery.sizeOf(context).height * 0.07,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'xd1c8bg1' /* Select Group */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderWidth: 1.0,
                            borderRadius: 10.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                          Container(
                            width: 54.0,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderColor: Color(0x00005734),
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Color(0x00616161),
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
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
                                            child: AddGroupDialogWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.56, -0.92),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.placeNameEdtController,
                            focusNode: _model.placeNameEdtFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'vvkq2g4j' /* Place Name (required) */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            validator: _model.placeNameEdtControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.14, -0.83),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: TextFormField(
                            controller: _model.addressEdtController,
                            focusNode: _model.addressEdtFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'qowwl918' /* Address (required) */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            validator: _model.addressEdtControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.17, -0.75),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.categoryDropdownValueController ??=
                              FormFieldController<String>(
                            _model.categoryDropdownValue ??=
                                FFAppState().toEditJson != null
                                    ? getJsonField(
                                        FFAppState().toEditJson,
                                        r'''$.loc_details.category''',
                                      ).toString()
                                    : null,
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              'jorgyc6f' /* Food & Drinks */,
                            ),
                            FFLocalizations.of(context).getText(
                              'u91n5u0d' /* Shopping */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ue4p956q' /* Services */,
                            ),
                            FFLocalizations.of(context).getText(
                              'nldipyq5' /* Hotels & Lodging */,
                            ),
                            FFLocalizations.of(context).getText(
                              'uf0lolgk' /* Outdoors & Recreation */,
                            ),
                            FFLocalizations.of(context).getText(
                              'hqenvl7o' /* Religion */,
                            ),
                            FFLocalizations.of(context).getText(
                              'b3vi54e7' /* Office  & Industrial */,
                            ),
                            FFLocalizations.of(context).getText(
                              'xslvxas0' /* Residental */,
                            ),
                            FFLocalizations.of(context).getText(
                              'epipcmki' /* Education */,
                            )
                          ],
                          onChanged: (val) => setState(
                              () => _model.categoryDropdownValue = val),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '1ol1cnqd' /* category (required) */,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 1.0,
                          borderRadius: 10.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.42, -0.66),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: TextFormField(
                            controller: _model.selectedLocationEdtController,
                            focusNode: _model.selectedLocationEdtFocusNode,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'f62j8lxl' /* Located within */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            validator: _model
                                .selectedLocationEdtControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.28, -0.58),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.openHoursEdtController,
                            focusNode: _model.openHoursEdtFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'u1z164x4' /* Hours e.g 10am - 5pm */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            validator: _model.openHoursEdtControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.56, -0.49),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.phonrNumEdtController,
                            focusNode: _model.phonrNumEdtFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'fpz54ec3' /* Phone Number */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            validator: _model.phonrNumEdtControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.42, -0.41),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.countryEdtController,
                            focusNode: _model.countryEdtFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'jcb1s3v9' /* Country */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            validator: _model.countryEdtControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.28, -0.33),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: _model.websiteEdtController,
                            focusNode: _model.websiteEdtFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '6dlk01wl' /* Website (Optional) */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            validator: _model.websiteEdtControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.89, -0.17),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().toEditJson == null) {
                              _model.addLocation =
                                  await CreateLocationCall.call(
                                groupName: _model.selectgroupValue,
                                placeCategory: _model.categoryDropdownValue,
                                placeAddress: _model.addressEdtController.text,
                                country: _model.countryEdtController.text,
                                locationCord:
                                    _model.selectedLocationEdtController.text,
                                dayHours: _model.openHoursEdtController.text,
                                phoneNumber: _model.phonrNumEdtController.text,
                                website: _model.websiteEdtController.text,
                                hours: _model.openHoursEdtController.text,
                                typeOfData: 'registered',
                                isTestData: false,
                                makePublic: true,
                                isDeleted: true,
                                apiKey: FFAppState().apiKey,
                                username: FFAppState().username,
                                placeName: _model.placeNameEdtController.text,
                              );
                              if ((_model.addLocation?.succeeded ?? true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Location added  successfully.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 6150),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).white,
                                  ),
                                );
                                setState(() {
                                  _model.placeNameEdtController?.clear();
                                  _model.addressEdtController?.clear();
                                  _model.selectedLocationEdtController?.clear();
                                  _model.openHoursEdtController?.clear();
                                  _model.phonrNumEdtController?.clear();
                                  _model.countryEdtController?.clear();
                                  _model.websiteEdtController?.clear();
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Unable to add location',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).white,
                                  ),
                                );
                              }
                            } else {
                              _model.apiResultms0 =
                                  await UpdateLocationCall.call(
                                locationId: getJsonField(
                                  FFAppState().toEditJson,
                                  r'''$._id''',
                                ).toString(),
                                placeName: _model.placeNameEdtController.text,
                                country: _model.countryEdtController.text,
                                locationCoordinate:
                                    _model.selectedLocationEdtController.text,
                                dayHours: _model.openHoursEdtController.text,
                                phoneNumber: _model.phonrNumEdtController.text,
                                website: _model.websiteEdtController.text,
                                hours: int.tryParse(
                                    _model.openHoursEdtController.text),
                                typeOfData: 'registered',
                                address: _model.addressEdtController.text,
                                category: _model.categoryDropdownValue,
                                makePublic: true,
                                isTestData: true,
                                apiKey: FFAppState().apiKey,
                              );
                              if ((_model.apiResultms0?.succeeded ?? true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Location Updated successfully',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 6150),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).white,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Unable to update location',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).white,
                                  ),
                                );
                              }
                            }

                            setState(() {
                              FFAppState().toEditJson = null;
                            });
                            context.safePop();

                            setState(() {});
                          },
                          text: FFAppState().toEditJson != null
                              ? 'Edit'
                              : 'Submit',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
