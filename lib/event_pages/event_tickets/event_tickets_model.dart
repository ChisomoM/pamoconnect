import '/backend/backend.dart';
import '/event_pages/generate_ticket/generate_ticket_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tickets/add_ticket/add_ticket_widget.dart';
import '/tickets/edit_ticket/edit_ticket_widget.dart';
import '/tickets/no_tickets/no_tickets_widget.dart';
import 'event_tickets_widget.dart' show EventTicketsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EventTicketsModel extends FlutterFlowModel<EventTicketsWidget> {
  ///  Local state fields for this page.

  String eventName = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
