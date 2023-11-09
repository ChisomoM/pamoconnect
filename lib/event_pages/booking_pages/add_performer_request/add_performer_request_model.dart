import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/welcome_name/welcome_name_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_performer_request_widget.dart' show AddPerformerRequestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddPerformerRequestModel
    extends FlutterFlowModel<AddPerformerRequestWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for WelcomeName component.
  late WelcomeNameModel welcomeNameModel;
  // State field(s) for ticketPrice widget.
  FocusNode? ticketPriceFocusNode;
  TextEditingController? ticketPriceController;
  String? Function(BuildContext, String?)? ticketPriceControllerValidator;
  // State field(s) for offerDetails widget.
  FocusNode? offerDetailsFocusNode;
  TextEditingController? offerDetailsController;
  String? Function(BuildContext, String?)? offerDetailsControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    welcomeNameModel = createModel(context, () => WelcomeNameModel());
  }

  void dispose() {
    welcomeNameModel.dispose();
    ticketPriceFocusNode?.dispose();
    ticketPriceController?.dispose();

    offerDetailsFocusNode?.dispose();
    offerDetailsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
