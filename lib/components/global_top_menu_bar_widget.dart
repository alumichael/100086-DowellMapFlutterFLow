import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'global_top_menu_bar_model.dart';
export 'global_top_menu_bar_model.dart';

class GlobalTopMenuBarWidget extends StatefulWidget {
  const GlobalTopMenuBarWidget({super.key});

  @override
  State<GlobalTopMenuBarWidget> createState() => _GlobalTopMenuBarWidgetState();
}

class _GlobalTopMenuBarWidgetState extends State<GlobalTopMenuBarWidget> {
  late GlobalTopMenuBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlobalTopMenuBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 50.0,
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.12,
                height: 50.0,
                decoration: BoxDecoration(),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.home_outlined,
                    color: Color(0xFF999898),
                    size: 27.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.12,
                height: 50.0,
                decoration: BoxDecoration(),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.login,
                    color: Color(0xFF999898),
                    size: 25.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Container(
                width: 10.0,
                height: 20.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFAEADAD),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'pop7fj2v' /* 6 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFAEADAD),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qa12q3rw' /* Learning Mode */,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 8.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.12,
                height: 50.0,
                decoration: BoxDecoration(),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.security,
                    color: Color(0xFF999898),
                    size: 22.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.12,
                height: 50.0,
                decoration: BoxDecoration(),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.settings,
                    color: Color(0xFF999898),
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Container(
                width: 40.0,
                height: 25.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Image.asset(
                  'assets/images/cxi3o_1.jpg',
                  width: 100.0,
                  height: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.01,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                width: 45.0,
                height: 25.0,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/Logo_high_quality_(1).png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
