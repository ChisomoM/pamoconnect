import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'account_settings_model.dart';
export 'account_settings_model.dart';

class AccountSettingsWidget extends StatefulWidget {
  const AccountSettingsWidget({Key? key}) : super(key: key);

  @override
  _AccountSettingsWidgetState createState() => _AccountSettingsWidgetState();
}

class _AccountSettingsWidgetState extends State<AccountSettingsWidget> {
  late AccountSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'accountSettings'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ACCOUNT_SETTINGS_arrow_back_rounded_ICN_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('ACCOUNT_SETTINGS_Text_jxr5mxax_ON_TAP');
              logFirebaseEvent('Text_auth');
              await authManager.deleteUser(context);

              context.goNamedAuth('homePage', context.mounted);
            },
            child: Text(
              'Account Setting',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 980.0,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ACCOUNT_SETTINGS_navToAccountDets_ON_TAP');
                        logFirebaseEvent('navToAccountDets_navigate_to');

                        context.pushNamed('AccountDetails');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 0.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Account Details',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                  Text(
                                    'Review or change your account detaills',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ACCOUNT_SETTINGS_deleteAccount_ON_TAP');
                        logFirebaseEvent('deleteAccount_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                    child: AlertDialog(
                                  title: Text('Delete Account?'),
                                  content: Text(
                                      'Are you sure you want to delete your account and everything associated with it? ? This action cannot be reversed'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                ));
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('deleteAccount_firestore_query');
                          _model.myEvents = await queryEventsRecordOnce(
                            queryBuilder: (eventsRecord) => eventsRecord.where(
                              'event_Org',
                              isEqualTo: currentUserReference,
                            ),
                          );
                          while (_model.myEvents!.length > 0) {
                            logFirebaseEvent('deleteAccount_backend_call');
                            unawaited(
                              () async {
                                await _model.myEvents!.first.reference.delete();
                              }(),
                            );
                          }
                          logFirebaseEvent('deleteAccount_firestore_query');
                          _model.myVenues = await queryVenuesRecordOnce(
                            queryBuilder: (venuesRecord) => venuesRecord.where(
                              'venue_owner',
                              isEqualTo: currentUserReference,
                            ),
                          );
                          while (_model.myVenues!.length > 0) {
                            logFirebaseEvent('deleteAccount_backend_call');
                            await _model.myVenues!.first.reference.delete();
                          }
                          logFirebaseEvent('deleteAccount_firestore_query');
                          _model.myMoments = await queryMomentsRecordOnce(
                            queryBuilder: (momentsRecord) =>
                                momentsRecord.where(
                              'user_posting',
                              isEqualTo: currentUserReference,
                            ),
                          );
                          while (_model.myMoments!.length > 0) {
                            logFirebaseEvent('deleteAccount_backend_call');
                            unawaited(
                              () async {
                                await _model.myMoments!.first.reference
                                    .delete();
                              }(),
                            );
                          }
                          logFirebaseEvent('deleteAccount_auth');
                          await authManager.deleteUser(context);
                          logFirebaseEvent('deleteAccount_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();
                        } else {
                          logFirebaseEvent(
                              'deleteAccount_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 0.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Detele Account',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'Delete your account',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('ACCOUNT_SETTINGS_PAGE_logOut_ON_TAP');
                        logFirebaseEvent('logOut_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                    child: AlertDialog(
                                  title: Text('Log Out?'),
                                  content: Text(
                                      'Are you sure you want to log out of your account?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Yes, log out.'),
                                    ),
                                  ],
                                ));
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('logOut_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          logFirebaseEvent('logOut_navigate_to');

                          context.goNamedAuth('loginPage', context.mounted);
                        } else {
                          logFirebaseEvent('logOut_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 0.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Log Out',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'Log out of your account',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24.0,
                              ),
                            ],
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
      ),
    );
  }
}
