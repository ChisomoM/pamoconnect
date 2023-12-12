import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'create_venue_widget.dart' show CreateVenueWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateVenueModel extends FlutterFlowModel<CreateVenueWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for VenueName widget.
  FocusNode? venueNameFocusNode;
  TextEditingController? venueNameController;
  String? Function(BuildContext, String?)? venueNameControllerValidator;
  String? _venueNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a venue name';
    }

    if (val.length < 3) {
      return '30';
    }

    return null;
  }

  // State field(s) for venueDescription widget.
  FocusNode? venueDescriptionFocusNode;
  TextEditingController? venueDescriptionController;
  String? Function(BuildContext, String?)? venueDescriptionControllerValidator;
  String? _venueDescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Give your venue a description';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for VenueType widget.
  String? venueTypeValue;
  FormFieldController<String>? venueTypeValueController;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VenuesRecord? venueRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    venueNameControllerValidator = _venueNameControllerValidator;
    venueDescriptionControllerValidator = _venueDescriptionControllerValidator;
  }

  void dispose() {
    venueNameFocusNode?.dispose();
    venueNameController?.dispose();

    venueDescriptionFocusNode?.dispose();
    venueDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
