import '/backend/api_requests/api_calls.dart';
import '/components/member_selection_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'members_selection_screen_model.dart';
export 'members_selection_screen_model.dart';

class MembersSelectionScreenWidget extends StatefulWidget {
  const MembersSelectionScreenWidget({
    super.key,
    required this.teamName,
    required this.members,
  });

  final String? teamName;
  final List<dynamic>? members;

  @override
  State<MembersSelectionScreenWidget> createState() =>
      _MembersSelectionScreenWidgetState();
}

class _MembersSelectionScreenWidgetState
    extends State<MembersSelectionScreenWidget> {
  late MembersSelectionScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembersSelectionScreenModel());

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
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.teamName,
                  'Team',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final memberSelectionBuilder =
                                widget.members!.toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(memberSelectionBuilder.length,
                                      (memberSelectionBuilderIndex) {
                                final memberSelectionBuilderItem =
                                    memberSelectionBuilder[
                                        memberSelectionBuilderIndex];
                                return MemberSelectionBoxWidget(
                                  key: Key(
                                      'Keye6q_${memberSelectionBuilderIndex}_of_${memberSelectionBuilder.length}'),
                                  itemInfo: memberSelectionBuilderItem,
                                );
                              }).addToStart(const SizedBox(height: 24.0)),
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.checkboxValue = newValue!);
                                    if (newValue!) {
                                      await actions.handleSelection(
                                        true,
                                        widget.members!.toList(),
                                      );
                                      setState(() {});
                                    } else {
                                      await actions.handleSelection(
                                        false,
                                        widget.members!.toList(),
                                      );
                                      setState(() {});
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'p596s6yi' /* Select all */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.combineSelectedResponse =
                              await actions.combineSelectedMembers(
                            widget.teamName == 'Team Members',
                          );
                          _model.addingMembers = await AddMemberToTeamCall.call(
                            username: FFAppState().username,
                            teamName: FFAppState().activeTeam.teamName,
                            membersJson: _model.combineSelectedResponse,
                            type: 'team_members',
                          );
                          if ((_model.addingMembers?.succeeded ?? true)) {
                            _model.selectedListEmailResponse =
                                await actions.getSelectedEmail(
                              _model.combineSelectedResponse!.toList(),
                            );
                            _model.bulkMailresponse =
                                await SendBulkEmailCall.call(
                              toEmailListJson: _model.selectedListEmailResponse,
                              subject: 'Welcome to the Team!',
                              fromname: '${getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.first_name''',
                              ).toString()}  ${getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.last_name''',
                              ).toString()}',
                              fromemail: getJsonField(
                                FFAppState().response,
                                r'''$.userinfo.email''',
                              ).toString(),
                              emailContent: functions.formatTeamInviteMailBody(
                                  'Team', widget.teamName),
                            );
                            if ((_model.bulkMailresponse?.succeeded ?? true)) {
                              context.pushNamed('Teams');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Unable to  send mail to team members',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );

                              context.pushNamed('Teams');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  getJsonField(
                                    (_model.addingMembers?.jsonBody ?? ''),
                                    r'''$.error''',
                                  ).toString(),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '3x6z5njd' /* Add Selected */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 56.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
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
