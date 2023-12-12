import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/request_manager.dart';

import 'package:map_launcher/map_launcher.dart' as $ml;
import 'venue_widget.dart' show VenueWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VenueModel extends FlutterFlowModel<VenueWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Query cache managers for this widget.

  final _venueBookingRequestsManager =
      StreamRequestManager<List<BookingRequestsRecord>>();
  Stream<List<BookingRequestsRecord>> venueBookingRequests({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BookingRequestsRecord>> Function() requestFn,
  }) =>
      _venueBookingRequestsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVenueBookingRequestsCache() => _venueBookingRequestsManager.clear();
  void clearVenueBookingRequestsCacheKey(String? uniqueKey) =>
      _venueBookingRequestsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearVenueBookingRequestsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
