import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_ticket2_model.dart';
export 'verify_ticket2_model.dart';

class VerifyTicket2Widget extends StatefulWidget {
  const VerifyTicket2Widget({
    Key? key,
    required this.verifiedTickets,
  }) : super(key: key);

  final DocumentReference? verifiedTickets;

  @override
  _VerifyTicket2WidgetState createState() => _VerifyTicket2WidgetState();
}

class _VerifyTicket2WidgetState extends State<VerifyTicket2Widget> {
  late VerifyTicket2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyTicket2Model());

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

    return StreamBuilder<VerifiedTicketsRecord>(
      stream: VerifiedTicketsRecord.getDocument(widget.verifiedTickets!),
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
        final containerVerifiedTicketsRecord = snapshot.data!;
        return Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: 385.0,
            height: 310.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Ticket ID: ${containerVerifiedTicketsRecord.ticket.ticketId}',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'This is an authentic ticket',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).success,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  if (containerVerifiedTicketsRecord.ticket.hasCheckedIn !=
                      true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Text(
                        'Do you want to verify this ticket and admit this person into your event?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  if (containerVerifiedTicketsRecord.ticket.hasCheckedIn ==
                      true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Text(
                                'This Ticket has already been used',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: containerVerifiedTicketsRecord
                                  .ticket.hasCheckedIn ==
                              true
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'VERIFY_TICKET2_VERIFY_&_CHECK_IN_BTN_ON_');
                              logFirebaseEvent('Button_backend_call');

                              await containerVerifiedTicketsRecord.reference
                                  .update(createVerifiedTicketsRecordData(
                                ticket: createCartItemTypeStruct(
                                  hasCheckedIn: true,
                                  dateCheckedIn: getCurrentTimestamp,
                                  clearUnsetFields: false,
                                ),
                              ));
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Check in Successful',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              );
                              logFirebaseEvent(
                                  'Button_close_dialog,_drawer,_etc');
                              Navigator.pop(context);
                            },
                      text: 'Verify & Check in',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        disabledColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        disabledTextColor: FlutterFlowTheme.of(context).accent3,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
                    child: Text(
                      'NOTE: Once verified and admitted this ticket can\'t be used again',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
