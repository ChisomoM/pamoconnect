import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_inpur_field_model.dart';
export 'email_inpur_field_model.dart';

class EmailInpurFieldWidget extends StatefulWidget {
  const EmailInpurFieldWidget({Key? key}) : super(key: key);

  @override
  _EmailInpurFieldWidgetState createState() => _EmailInpurFieldWidgetState();
}

class _EmailInpurFieldWidgetState extends State<EmailInpurFieldWidget> {
  late EmailInpurFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailInpurFieldModel());

    _model.emailAddressController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

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

    return TextFormField(
      controller: _model.emailAddressController,
      focusNode: _model.emailAddressFocusNode,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.emailAddressController',
        Duration(milliseconds: 2000),
        () => setState(() {}),
      ),
      autofillHints: [AutofillHints.email],
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Your email address...',
        labelStyle: FlutterFlowTheme.of(context).bodySmall,
        hintText: 'Enter your email...',
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 0.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 0.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 0.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 0.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
        suffixIcon: _model.emailAddressController!.text.isNotEmpty
            ? InkWell(
                onTap: () async {
                  _model.emailAddressController?.clear();
                  setState(() {});
                },
                child: Icon(
                  Icons.clear,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
              )
            : null,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium,
      maxLines: null,
      keyboardType: TextInputType.emailAddress,
      validator: _model.emailAddressControllerValidator.asValidator(context),
    );
  }
}
