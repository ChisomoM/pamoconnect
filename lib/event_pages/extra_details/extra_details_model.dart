import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'extra_details_widget.dart' show ExtraDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ExtraDetailsModel extends FlutterFlowModel<ExtraDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ageLimit widget.
  final ageLimitKey = GlobalKey();
  FocusNode? ageLimitFocusNode;
  TextEditingController? ageLimitController;
  String? ageLimitSelectedOption;
  String? Function(BuildContext, String?)? ageLimitControllerValidator;
  // State field(s) for dressCode widget.
  final dressCodeKey = GlobalKey();
  FocusNode? dressCodeFocusNode;
  TextEditingController? dressCodeController;
  String? dressCodeSelectedOption;
  String? Function(BuildContext, String?)? dressCodeControllerValidator;
  // State field(s) for refundPolicy widget.
  FocusNode? refundPolicyFocusNode;
  TextEditingController? refundPolicyController;
  String? Function(BuildContext, String?)? refundPolicyControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    ageLimitFocusNode?.dispose();

    dressCodeFocusNode?.dispose();

    refundPolicyFocusNode?.dispose();
    refundPolicyController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
