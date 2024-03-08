import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'specifiedlocation_model.dart';
export 'specifiedlocation_model.dart';

class SpecifiedlocationWidget extends StatefulWidget {
  const SpecifiedlocationWidget({super.key});

  @override
  State<SpecifiedlocationWidget> createState() =>
      _SpecifiedlocationWidgetState();
}

class _SpecifiedlocationWidgetState extends State<SpecifiedlocationWidget> {
  late SpecifiedlocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecifiedlocationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowPlacePicker(
              iOSGoogleMapsApiKey: 'AIzaSyAD6nxAHweq0zMBZkI5bcUWJI0k3fLLhVk',
              androidGoogleMapsApiKey:
                  'AIzaSyA_i4bbFV0iKxU_nUI7L3p0--r6UR89du4',
              webGoogleMapsApiKey: 'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
              onSelect: (place) async {
                setState(() => _model.placePickerValue = place);
              },
              defaultText: FFLocalizations.of(context).getText(
                'bwki9q32' /* Select Location */,
              ),
              icon: Icon(
                Icons.place,
                color: Colors.white,
                size: 16.0,
              ),
              buttonOptions: FFButtonOptions(
                width: 200.0,
                height: 40.0,
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
