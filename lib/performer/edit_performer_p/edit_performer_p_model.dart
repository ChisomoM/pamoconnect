import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_performer_p_widget.dart' show EditPerformerPWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPerformerPModel extends FlutterFlowModel<EditPerformerPWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for bio widget.
  FocusNode? bioFocusNode;
  TextEditingController? bioController;
  String? Function(BuildContext, String?)? bioControllerValidator;
  // State field(s) for linkTree widget.
  FocusNode? linkTreeFocusNode;
  TextEditingController? linkTreeController;
  String? Function(BuildContext, String?)? linkTreeControllerValidator;
  // State field(s) for yt widget.
  FocusNode? ytFocusNode;
  TextEditingController? ytController;
  String? Function(BuildContext, String?)? ytControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    bioFocusNode?.dispose();
    bioController?.dispose();

    linkTreeFocusNode?.dispose();
    linkTreeController?.dispose();

    ytFocusNode?.dispose();
    ytController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
