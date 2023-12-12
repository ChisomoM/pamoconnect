import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_chats_model.dart';
export 'no_chats_model.dart';

class NoChatsWidget extends StatefulWidget {
  const NoChatsWidget({Key? key}) : super(key: key);

  @override
  _NoChatsWidgetState createState() => _NoChatsWidgetState();
}

class _NoChatsWidgetState extends State<NoChatsWidget> {
  late NoChatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoChatsModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('NO_CHATS_COMP_Column_gqxnv0ss_ON_TAP');
            logFirebaseEvent('Column_launch_u_r_l');
            await launchURL('https://platform.openai.com');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.forum_outlined,
                color: FlutterFlowTheme.of(context).primary,
                size: 90.0,
              ),
              SelectionArea(
                  child: AutoSizeText(
                'No Messages Here',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      lineHeight: 1.5,
                    ),
              )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 0.0),
                child: SelectionArea(
                    child: AutoSizeText(
                  'Looks like you don\'t have any messages here. Chats that your start with someone will appear here',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelLarge,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
