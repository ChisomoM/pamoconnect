import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_event_model.dart';
export 'create_event_model.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({
    Key? key,
    bool? isCreate,
  })  : this.isCreate = isCreate ?? true,
        super(key: key);

  final bool isCreate;

  @override
  _CreateEventWidgetState createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  late CreateEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEventModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreateEvent'});
    _model.eventNameController ??= TextEditingController();
    _model.eventNameFocusNode ??= FocusNode();

    _model.eventDescriptionController ??= TextEditingController();
    _model.eventDescriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CREATE_EVENT_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Text(
            'Create Event',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREATE_EVENT_PAGE_userImage_ON_TAP');
                                  logFirebaseEvent(
                                      'userImage_request_permissions');
                                  await requestPermission(
                                      photoLibraryPermission);
                                  logFirebaseEvent(
                                      'userImage_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                    pickerFontFamily: 'Montserrat',
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload data');
                                      return;
                                    }
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        valueOrDefault<String>(
                                          _model.uploadedFileUrl,
                                          'https://i.ibb.co/9hc9NjR/20230528-115241-0000.png',
                                        ),
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 8.0),
                              child: TextFormField(
                                controller: _model.eventNameController,
                                focusNode: _model.eventNameFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Event name',
                                  hintText: 'Enter event name...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.eventNameControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _model.eventDescriptionController,
                                      focusNode:
                                          _model.eventDescriptionFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Event description',
                                        hintText:
                                            'Enter event description here...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 32.0, 20.0, 12.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      textAlign: TextAlign.start,
                                      maxLines: 4,
                                      validator: _model
                                          .eventDescriptionControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: FlutterFlowPlacePicker(
                                iOSGoogleMapsApiKey:
                                    'AIzaSyDtJikhB9EPRE-CATSeyBdzWiNoPwJoc4w',
                                androidGoogleMapsApiKey:
                                    'AIzaSyA-4v7AraidTJe6mmHzSuateo7nU8AaARU',
                                webGoogleMapsApiKey:
                                    'AIzaSyD0Yc_u_VqFa2B3W1qc7UfPSV9-65pVPq4',
                                onSelect: (place) async {
                                  setState(
                                      () => _model.placePickerValue = place);
                                },
                                defaultText: 'Select Location',
                                icon: Icon(
                                  Icons.place,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 16.0,
                                ),
                                buttonOptions: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 14.0,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'NOTE: You will still have to select a venue in the connect center. This is a fallback location.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Select Event Category',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 4.0, 2.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .categoryDropdownValueController ??=
                                        FormFieldController<String>(null),
                                    options: [
                                      'Concert',
                                      'Party',
                                      'Sports',
                                      'Show',
                                      'Business',
                                      'Other'
                                    ],
                                    onChanged: (val) => setState(() =>
                                        _model.categoryDropdownValue = val),
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        ),
                                    hintText: 'Please select...',
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 15.0,
                                    ),
                                    fillColor: Colors.white,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Select Event Type',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 4.0, 2.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.typeDropdownValueController ??=
                                        FormFieldController<String>(null),
                                options: () {
                                  if (_model.categoryDropdownValue ==
                                      'Sports') {
                                    return FFAppState().sports;
                                  } else if (_model.categoryDropdownValue ==
                                      'Concert') {
                                    return FFAppState().concerts;
                                  } else if (_model.categoryDropdownValue ==
                                      'Business') {
                                    return FFAppState().business;
                                  } else if (_model.categoryDropdownValue ==
                                      'Show') {
                                    return FFAppState().shows;
                                  } else if (_model.categoryDropdownValue ==
                                      'Party') {
                                    return FFAppState().party;
                                  } else {
                                    return FFAppState().other;
                                  }
                                }(),
                                onChanged: (val) => setState(
                                    () => _model.typeDropdownValue = val),
                                width: double.infinity,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                    ),
                                hintText: 'Please select...',
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                                fillColor: Colors.white,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).grayIcon,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Select start date/time',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CREATE_EVENT_PAGE_StartDate_ON_TAP');
                                      logFirebaseEvent(
                                          'StartDate_date_time_picker');
                                      final _datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      TimeOfDay? _datePicked1Time;
                                      if (_datePicked1Date != null) {
                                        _datePicked1Time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                      }

                                      if (_datePicked1Date != null &&
                                          _datePicked1Time != null) {
                                        safeSetState(() {
                                          _model.datePicked1 = DateTime(
                                            _datePicked1Date.year,
                                            _datePicked1Date.month,
                                            _datePicked1Date.day,
                                            _datePicked1Time!.hour,
                                            _datePicked1Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 2.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  dateTimeFormat('yMMMd',
                                                      _model.datePicked1),
                                                  'Select date',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 13.0,
                                                        ),
                                              ),
                                            ),
                                            if (_model.datePicked1 != null)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 2.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat('Hm',
                                                        _model.datePicked1),
                                                    'Select date',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 13.0,
                                                      ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.calendar_today,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 22.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Select end date/time',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CREATE_EVENT_PAGE_endDate_ON_TAP');
                                      logFirebaseEvent(
                                          'endDate_date_time_picker');
                                      final _datePicked2Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: (_model.datePicked1 ??
                                            DateTime(1900)),
                                        lastDate: DateTime(2050),
                                      );

                                      TimeOfDay? _datePicked2Time;
                                      if (_datePicked2Date != null) {
                                        _datePicked2Time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                      }

                                      if (_datePicked2Date != null &&
                                          _datePicked2Time != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = DateTime(
                                            _datePicked2Date.year,
                                            _datePicked2Date.month,
                                            _datePicked2Date.day,
                                            _datePicked2Time!.hour,
                                            _datePicked2Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 2.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  dateTimeFormat('yMMMd',
                                                      _model.datePicked2),
                                                  'Select date',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 13.0,
                                                        ),
                                              ),
                                            ),
                                            if (dateTimeFormat('jm',
                                                        _model.datePicked1) !=
                                                    null &&
                                                dateTimeFormat('jm',
                                                        _model.datePicked1) !=
                                                    '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 2.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat('Hm',
                                                        _model.datePicked2),
                                                    'Select time',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 13.0,
                                                      ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.calendar_today,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 22.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (widget.isCreate == true)
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CREATE_EVENT_CREATE_EVENT_BTN_ON_TAP');
                        logFirebaseEvent('Button_validate_form');
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if (_model.uploadedFileUrl == null ||
                            _model.uploadedFileUrl.isEmpty) {
                          return;
                        }
                        if (_model.placePickerValue == FFPlace()) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Select Fallback location'),
                                content: Text(
                                    'Select for the fallback location incase you do not find the venue you are looking for'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          return;
                        }
                        if (_model.categoryDropdownValue == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Choose a category'),
                                content: Text(
                                    'Please choose a category to continue. This improves your event\'s discoverability.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          return;
                        }
                        if (_model.typeDropdownValue == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Choose an event type'),
                                content: Text(
                                    'Please choose a category to continue. This improves your event\'s discoverability.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          return;
                        }
                        if (_model.datePicked1 == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Select event start date'),
                                content: Text(
                                    'Please select an event start date. This information is needed. If you haven\'t decided on a date yet, Select any date, you can change this later.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          return;
                        }
                        if (_model.datePicked2 == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Select event end date.'),
                                content: Text(
                                    'Please select an event start date. This information is needed. If you haven\'t decided on a date yet, Select any date, you can change this later.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          return;
                        }
                        logFirebaseEvent('Button_custom_action');
                        _model.eventID = await actions.generateEventID(
                          4,
                          false,
                          false,
                          '1',
                          _model.eventNameController.text,
                          currentUserDisplayName,
                        );
                        logFirebaseEvent('Button_backend_call');

                        var eventsRecordReference =
                            EventsRecord.collection.doc();
                        await eventsRecordReference.set(createEventsRecordData(
                          eventOrg: currentUserReference,
                          eventName: _model.eventNameController.text,
                          eventStart: _model.datePicked1,
                          eventEnd: _model.datePicked2,
                          eventPoster: _model.uploadedFileUrl,
                          eventDescription:
                              _model.eventDescriptionController.text,
                          category: _model.categoryDropdownValue,
                          isDraft: true,
                          verifiedVenue: false,
                          eventID: _model.eventID,
                          createdDate: getCurrentTimestamp,
                          isPrivate: false,
                        ));
                        _model.eventRef = EventsRecord.getDocumentFromData(
                            createEventsRecordData(
                              eventOrg: currentUserReference,
                              eventName: _model.eventNameController.text,
                              eventStart: _model.datePicked1,
                              eventEnd: _model.datePicked2,
                              eventPoster: _model.uploadedFileUrl,
                              eventDescription:
                                  _model.eventDescriptionController.text,
                              category: _model.categoryDropdownValue,
                              isDraft: true,
                              verifiedVenue: false,
                              eventID: _model.eventID,
                              createdDate: getCurrentTimestamp,
                              isPrivate: false,
                            ),
                            eventsRecordReference);
                        logFirebaseEvent('Button_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Draft saved',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                        );
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'extraDetails',
                          queryParameters: {
                            'eventRef': serializeParam(
                              _model.eventRef?.reference,
                              ParamType.DocumentReference,
                            ),
                            'isEdit': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      text: 'Create Event',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
