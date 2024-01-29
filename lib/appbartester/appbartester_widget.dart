import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbartester_model.dart';
export 'appbartester_model.dart';

class AppbartesterWidget extends StatefulWidget {
  const AppbartesterWidget({super.key});

  @override
  State<AppbartesterWidget> createState() => _AppbartesterWidgetState();
}

class _AppbartesterWidgetState extends State<AppbartesterWidget> {
  late AppbartesterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbartesterModel());

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                child: custom_widgets.AppBarComponent(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  profileImg: getJsonField(
                    FFAppState().response,
                    r'''$.userinfo.profile_img''',
                  ).toString(),
                  orgImg: getJsonField(
                    FFAppState().response,
                    r'''$.userinfo.org_img''',
                  ).toString(),
                  onHome: () async {
                    context.pushNamed('HomeScreenVersion2');
                  },
                  onExit: () async {},
                  onPrivacy: () async {},
                  onSettings: () async {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
