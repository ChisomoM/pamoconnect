import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tickets/verify_ticket/verify_ticket_widget.dart';
import '/flutter_flow/permissions_util.dart';
import 'addmission_widget.dart' show AddmissionWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddmissionModel extends FlutterFlowModel<AddmissionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ticketIDField widget.
  FocusNode? ticketIDFieldFocusNode;
  TextEditingController? ticketIDFieldController;
  String? Function(BuildContext, String?)? ticketIDFieldControllerValidator;
  var code = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OrdersRecord? orderScan;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OrdersRecord? order;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    ticketIDFieldFocusNode?.dispose();
    ticketIDFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
