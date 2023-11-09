import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'events_widget.dart' show EventsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Query cache managers for this widget.

  final _myEventsManager = StreamRequestManager<List<EventsRecord>>();
  Stream<List<EventsRecord>> myEvents({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventsRecord>> Function() requestFn,
  }) =>
      _myEventsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyEventsCache() => _myEventsManager.clear();
  void clearMyEventsCacheKey(String? uniqueKey) =>
      _myEventsManager.clearRequest(uniqueKey);

  final _draftsManager = StreamRequestManager<List<EventsRecord>>();
  Stream<List<EventsRecord>> drafts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventsRecord>> Function() requestFn,
  }) =>
      _draftsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDraftsCache() => _draftsManager.clear();
  void clearDraftsCacheKey(String? uniqueKey) =>
      _draftsManager.clearRequest(uniqueKey);

  final _pastEventsManager = StreamRequestManager<List<EventsRecord>>();
  Stream<List<EventsRecord>> pastEvents({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventsRecord>> Function() requestFn,
  }) =>
      _pastEventsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPastEventsCache() => _pastEventsManager.clear();
  void clearPastEventsCacheKey(String? uniqueKey) =>
      _pastEventsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearMyEventsCache();

    clearDraftsCache();

    clearPastEventsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
