import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'stats_widget.dart' show StatsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatsModel extends FlutterFlowModel<StatsWidget> {
  ///  Local state fields for this page.

  List<int> aLessthan20 = [];
  void addToALessthan20(int item) => aLessthan20.add(item);
  void removeFromALessthan20(int item) => aLessthan20.remove(item);
  void removeAtIndexFromALessthan20(int index) => aLessthan20.removeAt(index);
  void insertAtIndexInALessthan20(int index, int item) =>
      aLessthan20.insert(index, item);
  void updateALessthan20AtIndex(int index, Function(int) updateFn) =>
      aLessthan20[index] = updateFn(aLessthan20[index]);

  int? lessThan20;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in stats widget.
  EventsRecord? eventR;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
