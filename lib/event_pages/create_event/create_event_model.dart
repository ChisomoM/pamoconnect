import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'create_event_widget.dart' show CreateEventWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateEventModel extends FlutterFlowModel<CreateEventWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for eventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameController;
  String? Function(BuildContext, String?)? eventNameControllerValidator;
  String? _eventNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter an Event Name ';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for eventDescription widget.
  FocusNode? eventDescriptionFocusNode;
  TextEditingController? eventDescriptionController;
  String? Function(BuildContext, String?)? eventDescriptionControllerValidator;
  String? _eventDescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter an event description';
    }

    return null;
  }

  // State field(s) for CategoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // State field(s) for typeDropdown widget.
  String? typeDropdownValue;
  FormFieldController<String>? typeDropdownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Custom Action - generateEventID] action in Button widget.
  String? eventID;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventsRecord? eventRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    eventNameControllerValidator = _eventNameControllerValidator;
    eventDescriptionControllerValidator = _eventDescriptionControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    eventNameFocusNode?.dispose();
    eventNameController?.dispose();

    eventDescriptionFocusNode?.dispose();
    eventDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
