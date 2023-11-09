import '/auth/firebase_auth/auth_util.dart';
import '/components/under_cons_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for underCons component.
  late UnderConsModel underConsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    underConsModel = createModel(context, () => UnderConsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    underConsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
