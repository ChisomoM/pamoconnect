import '/components/under_cons_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'under_construction_widget.dart' show UnderConstructionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UnderConstructionModel extends FlutterFlowModel<UnderConstructionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for underCons component.
  late UnderConsModel underConsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    underConsModel = createModel(context, () => UnderConsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    underConsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
