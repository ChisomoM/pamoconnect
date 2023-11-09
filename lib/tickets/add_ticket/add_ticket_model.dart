import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'add_ticket_widget.dart' show AddTicketWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTicketModel extends FlutterFlowModel<AddTicketWidget> {
  ///  Local state fields for this component.

  bool isPaid = true;

  bool hasLimit = false;

  bool hasPurchaseDeadline = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ticketName widget.
  FocusNode? ticketNameFocusNode;
  TextEditingController? ticketNameController;
  String? Function(BuildContext, String?)? ticketNameControllerValidator;
  String? _ticketNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter a Ticket name with atleast 3 characters';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ticketDescription widget.
  FocusNode? ticketDescriptionFocusNode;
  TextEditingController? ticketDescriptionController;
  String? Function(BuildContext, String?)? ticketDescriptionControllerValidator;
  String? _ticketDescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter a ticket discription with atleast 8 characters';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ticketPrice widget.
  FocusNode? ticketPriceFocusNode;
  TextEditingController? ticketPriceController;
  String? Function(BuildContext, String?)? ticketPriceControllerValidator;
  String? _ticketPriceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for ticketLimit widget.
  FocusNode? ticketLimitFocusNode;
  TextEditingController? ticketLimitController;
  String? Function(BuildContext, String?)? ticketLimitControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    ticketNameControllerValidator = _ticketNameControllerValidator;
    ticketDescriptionControllerValidator =
        _ticketDescriptionControllerValidator;
    ticketPriceControllerValidator = _ticketPriceControllerValidator;
  }

  void dispose() {
    ticketNameFocusNode?.dispose();
    ticketNameController?.dispose();

    ticketDescriptionFocusNode?.dispose();
    ticketDescriptionController?.dispose();

    ticketPriceFocusNode?.dispose();
    ticketPriceController?.dispose();

    ticketLimitFocusNode?.dispose();
    ticketLimitController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
