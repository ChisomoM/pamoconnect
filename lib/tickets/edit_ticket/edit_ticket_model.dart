import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_ticket_widget.dart' show EditTicketWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTicketModel extends FlutterFlowModel<EditTicketWidget> {
  ///  Local state fields for this component.

  bool isPaid = false;

  bool hasLimit = false;

  bool hasPurchaseDeadline = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ticketName widget.
  FocusNode? ticketNameFocusNode;
  TextEditingController? ticketNameController;
  String? Function(BuildContext, String?)? ticketNameControllerValidator;
  // State field(s) for ticketDescription widget.
  FocusNode? ticketDescriptionFocusNode;
  TextEditingController? ticketDescriptionController;
  String? Function(BuildContext, String?)? ticketDescriptionControllerValidator;
  // State field(s) for ticketPrice widget.
  FocusNode? ticketPriceFocusNode;
  TextEditingController? ticketPriceController;
  String? Function(BuildContext, String?)? ticketPriceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    ticketNameFocusNode?.dispose();
    ticketNameController?.dispose();

    ticketDescriptionFocusNode?.dispose();
    ticketDescriptionController?.dispose();

    ticketPriceFocusNode?.dispose();
    ticketPriceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
