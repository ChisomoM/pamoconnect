import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/support_ticket/user_list_small/user_list_small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_list_model.dart';
export 'user_list_model.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late UserListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 64.0, 16.0, 16.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 500.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 4.0),
                    child: Text(
                      'Assign User',
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Select a user from the list below to continue.',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Expanded(
                    child: FutureBuilder<List<UsersRecord>>(
                      future: queryUsersRecordOnce(
                        queryBuilder: (usersRecord) => usersRecord
                            .orderBy('created_time', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: SpinKitFadingFour(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 30.0,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewUsersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewUsersRecord =
                                listViewUsersRecordList[listViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'USER_LIST_COMP_Container_oln3uuuw_ON_TAP');
                                logFirebaseEvent('user_ListSmall_bottom_sheet');
                                Navigator.pop(context, listViewUsersRecord);
                              },
                              child: wrapWithModel(
                                model: _model.userListSmallModels.getModel(
                                  listViewUsersRecord.reference.id,
                                  listViewIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: UserListSmallWidget(
                                  key: Key(
                                    'Keyoln_${listViewUsersRecord.reference.id}',
                                  ),
                                  userRef: listViewUsersRecord,
                                  action: () async {},
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'USER_LIST_COMP_convertComponent_ON_TAP');
                        logFirebaseEvent('convertComponent_bottom_sheet');
                        Navigator.pop(context);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 150),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _model.mouseRegionHovered!
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 16.0, 12.0, 16.0),
                                  child: Text(
                                    'Close',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionHovered = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionHovered = false);
                    }),
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
