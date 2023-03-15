import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_luo_rutiini_model.dart';
export 'button_luo_rutiini_model.dart';

class ButtonLuoRutiiniWidget extends StatefulWidget {
  const ButtonLuoRutiiniWidget({Key? key}) : super(key: key);

  @override
  _ButtonLuoRutiiniWidgetState createState() => _ButtonLuoRutiiniWidgetState();
}

class _ButtonLuoRutiiniWidgetState extends State<ButtonLuoRutiiniWidget>
    with TickerProviderStateMixin {
  late ButtonLuoRutiiniModel _model;

  final animationsMap = {
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 800.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonLuoRutiiniModel());

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

    return
        // Tämä nappi lisää uuden tyhjän treeniRutiinin käyttäjän treenirutiinit listaan. Jos lista ei ole olemassa, luo se automaattisesti listan.
        FFButtonWidget(
      onPressed: () async {
        logFirebaseEvent('BUTTON_LUO_RUTIINI_LISÄÄ_TREENIPOHJA_BTN');
        if (true) {
          logFirebaseEvent('Button_custom_action');
          _model.createdRutiini = await actions.myCreateTreeniRutiiniStruct();
          logFirebaseEvent('Button_backend_call');

          final usersUpdateData = {
            'treeniRutiinit': FieldValue.arrayUnion([
              getTreeniRutiiniFirestoreData(
                updateTreeniRutiiniStruct(
                  _model.createdRutiini,
                  clearUnsetFields: false,
                ),
                true,
              )
            ]),
          };
          await currentUserReference!.update(usersUpdateData);
        } else {
          logFirebaseEvent('Button_update_app_state');
          FFAppState().update(() {
            FFAppState().navBarIndex = 0;
            FFAppState().showTreenaaTaiLuoRutiiniSivu = true;
            FFAppState().isCreatingRutiini = true;
          });
        }

        setState(() {});
      },
      text: FFLocalizations.of(context).getText(
        '3myg55ek' /* Lisää treenipohja */,
      ),
      options: FFButtonOptions(
        width: 240.0,
        height: 70.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle1.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).secondaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 1.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
    ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!);
  }
}
