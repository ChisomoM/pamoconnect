import '/backend/backend.dart';
import '/components/search_for/search_for_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/booking_pages/add_venue_request/add_venue_request_widget.dart';
import '/venue_pages/venue_list/venue_list_widget.dart';
import 'add_venue_widget.dart' show AddVenueWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddVenueModel extends FlutterFlowModel<AddVenueWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on IconButton
  List<VenuesRecord>? algoliaSearchResults = [];
  // Model for venueList component.
  late VenueListModel venueListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    venueListModel = createModel(context, () => VenueListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    venueListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
