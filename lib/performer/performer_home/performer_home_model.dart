import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/request_manager.dart';

import 'performer_home_widget.dart' show PerformerHomeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerformerHomeModel extends FlutterFlowModel<PerformerHomeWidget> {
  ///  Local state fields for this page.

  String linkTree = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Query cache managers for this widget.

  final _performerBookingsManager =
      StreamRequestManager<List<BookingRequestsRecord>>();
  Stream<List<BookingRequestsRecord>> performerBookings({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BookingRequestsRecord>> Function() requestFn,
  }) =>
      _performerBookingsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPerformerBookingsCache() => _performerBookingsManager.clear();
  void clearPerformerBookingsCacheKey(String? uniqueKey) =>
      _performerBookingsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearPerformerBookingsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
