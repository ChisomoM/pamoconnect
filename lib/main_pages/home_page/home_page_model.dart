import '/auth/firebase_auth/auth_util.dart';
import '/components/welcome_name/welcome_name_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? isMine = 'True';

  DateTime? startDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for WelcomeName component.
  late WelcomeNameModel welcomeNameModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    welcomeNameModel = createModel(context, () => WelcomeNameModel());
  }

  void dispose() {
    unfocusNode.dispose();
    welcomeNameModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
