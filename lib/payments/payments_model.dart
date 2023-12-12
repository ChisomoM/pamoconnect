import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'payments_widget.dart' show PaymentsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentsModel extends FlutterFlowModel<PaymentsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // State field(s) for nameOnAcc widget.
  FocusNode? nameOnAccFocusNode;
  TextEditingController? nameOnAccController;
  String? Function(BuildContext, String?)? nameOnAccControllerValidator;
  String? _nameOnAccControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for bankAcc widget.
  FocusNode? bankAccFocusNode;
  TextEditingController? bankAccController;
  String? Function(BuildContext, String?)? bankAccControllerValidator;
  // State field(s) for accNum widget.
  FocusNode? accNumFocusNode;
  TextEditingController? accNumController;
  String? Function(BuildContext, String?)? accNumControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameOnAccControllerValidator = _nameOnAccControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    expandableController.dispose();
    nameOnAccFocusNode?.dispose();
    nameOnAccController?.dispose();

    bankAccFocusNode?.dispose();
    bankAccController?.dispose();

    accNumFocusNode?.dispose();
    accNumController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
