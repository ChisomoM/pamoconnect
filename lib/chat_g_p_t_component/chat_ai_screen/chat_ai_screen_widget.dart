import '/chat_g_p_t_component/ai_chat_component/ai_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_ai_screen_model.dart';
export 'chat_ai_screen_model.dart';

class ChatAiScreenWidget extends StatefulWidget {
  const ChatAiScreenWidget({Key? key}) : super(key: key);

  @override
  _ChatAiScreenWidgetState createState() => _ChatAiScreenWidgetState();
}

class _ChatAiScreenWidgetState extends State<ChatAiScreenWidget> {
  late ChatAiScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatAiScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'chat_ai_Screen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_AI_SCREEN_chat_ai_Screen_ON_INIT_ST');
      // showProgressDots
      logFirebaseEvent('chat_ai_Screen_showProgressDots');
      setState(() {
        _model.aiResponding = false;
      });
    });

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
          title: Text(
            'Ai Chat',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CHAT_AI_SCREEN_refresh_rounded_ICN_ON_TA');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    'chat_ai_Screen',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/blur_bg@1x.png',
                ).image,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: wrapWithModel(
                model: _model.aiChatComponentModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: AiChatComponentWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
