import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'create_promo_component_model.dart';
export 'create_promo_component_model.dart';

class CreatePromoComponentWidget extends StatefulWidget {
  const CreatePromoComponentWidget({
    Key? key,
    required this.eventRef,
  }) : super(key: key);

  final DocumentReference? eventRef;

  @override
  _CreatePromoComponentWidgetState createState() =>
      _CreatePromoComponentWidgetState();
}

class _CreatePromoComponentWidgetState
    extends State<CreatePromoComponentWidget> {
  late CreatePromoComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePromoComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.promoCodeLimitController ??= TextEditingController();
    _model.promoCodeLimitFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 32.0, 0.0),
                  child: Text(
                    'Create Promo Code',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('CREATE_PROMO_COMPONENT_close_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
            child: TextFormField(
              controller: _model.textController1,
              focusNode: _model.textFieldFocusNode1,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Promo Code',
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintText: 'Enter a the name of the promo code',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLength: 12,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.textController1Validator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: TextFormField(
              controller: _model.textController2,
              focusNode: _model.textFieldFocusNode2,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Discount Percentage',
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintText: 'Enter the discount percentage',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLength: 5,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.textController2Validator.asValidator(context),
              inputFormatters: [_model.textFieldMask2],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: TextFormField(
              controller: _model.promoCodeLimitController,
              focusNode: _model.promoCodeLimitFocusNode,
              textCapitalization: TextCapitalization.none,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Promo code Limit',
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintText: 'The total amount of times this code can be used',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLength: 4,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator:
                  _model.promoCodeLimitControllerValidator.asValidator(context),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('CREATE_PROMO_COMPONENT_CREATE_BTN_ON_TAP');
                logFirebaseEvent('Button_backend_call');

                await PromoCodesRecord.createDoc(widget.eventRef!)
                    .set(createPromoCodesRecordData(
                  eventRef: widget.eventRef,
                  promoCode: 'qwerty12',
                  discountAmount: 50.0,
                  createdTime: getCurrentTimestamp,
                  isActive: true,
                  usageLimit: valueOrDefault<int>(
                    int.tryParse(_model.promoCodeLimitController.text),
                    999999,
                  ),
                ));
              },
              text: 'Create',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                elevation: 2.0,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
