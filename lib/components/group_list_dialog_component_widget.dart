import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'group_list_dialog_component_model.dart';
export 'group_list_dialog_component_model.dart';

class GroupListDialogComponentWidget extends StatefulWidget {
  const GroupListDialogComponentWidget({super.key});

  @override
  State<GroupListDialogComponentWidget> createState() =>
      _GroupListDialogComponentWidgetState();
}

class _GroupListDialogComponentWidgetState
    extends State<GroupListDialogComponentWidget> {
  late GroupListDialogComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupListDialogComponentModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      constraints: BoxConstraints(
        minHeight: 150.0,
        maxHeight: 200.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 8.0, 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'jnfk1ntq' /* Groups */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController ??=
                    FormFieldController<String>(null),
                options: FFAppState().groupList,
                onChanged: (val) async {
                  setState(() => _model.dropDownValue = val);
                  setState(() {
                    FFAppState().isGettingDroupLocations = true;
                    FFAppState().clearmap = true;
                  });
                  _model.getLocationbyGroupResponse =
                      await GetLocationByGroupNameCall.call(
                    apiKey: FFAppState().apiKey,
                    username: FFAppState().username,
                    groupName: _model.dropDownValue,
                  );
                  if ((_model.getLocationbyGroupResponse?.succeeded ?? true)) {
                    if (GetLocationByGroupNameCall.data(
                          (_model.getLocationbyGroupResponse?.jsonBody ?? ''),
                        )!
                            .length >
                        0) {
                      FFAppState().update(() {
                        FFAppState().groupAddress =
                            GetLocationByGroupNameCall.locationAddress(
                          (_model.getLocationbyGroupResponse?.jsonBody ?? ''),
                        )!
                                .toList()
                                .cast<String>();
                        FFAppState().groupIds =
                            GetLocationByGroupNameCall.locationId(
                          (_model.getLocationbyGroupResponse?.jsonBody ?? ''),
                        )!
                                .toList()
                                .cast<String>();
                        FFAppState().showMyLocs = true;
                        FFAppState().groupLocs =
                            GetLocationByGroupNameCall.data(
                          (_model.getLocationbyGroupResponse?.jsonBody ?? ''),
                        )!
                                .toList()
                                .cast<dynamic>();
                        FFAppState().groupCoordLocs = functions
                            .groupLocsConverter(GetLocationByGroupNameCall.data(
                              (_model.getLocationbyGroupResponse?.jsonBody ??
                                  ''),
                            )?.toList())!
                            .toList()
                            .cast<LatLng>();
                        FFAppState().clearmap = false;
                      });
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'you don\'t have any saved location on this group',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                          duration: Duration(milliseconds: 5000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Failed to fetch locations',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }

                  Navigator.pop(context);
                  setState(() {
                    FFAppState().isGettingDroupLocations = false;
                  });

                  setState(() {});
                },
                width: 300.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: FFLocalizations.of(context).getText(
                  '7wgxe1i5' /* select collection */,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).secondaryText,
                borderWidth: 1.5,
                borderRadius: 8.0,
                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
            if (FFAppState().isGettingDroupLocations)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 10.0),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  child: custom_widgets.LoadingIndicatorBuilder(
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
