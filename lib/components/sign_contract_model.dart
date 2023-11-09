import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_contract_widget.dart' show SignContractWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class SignContractModel extends FlutterFlowModel<SignContractWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Signature widget.
  SignatureController? signatureController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    signatureController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
