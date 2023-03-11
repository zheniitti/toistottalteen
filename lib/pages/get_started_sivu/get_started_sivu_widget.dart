import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/toistot_talteen_text/toistot_talteen_text_widget.dart';
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
import 'get_started_sivu_model.dart';
export 'get_started_sivu_model.dart';

class GetStartedSivuWidget extends StatefulWidget {
  const GetStartedSivuWidget({Key? key}) : super(key: key);

  @override
  _GetStartedSivuWidgetState createState() => _GetStartedSivuWidgetState();
}

class _GetStartedSivuWidgetState extends State<GetStartedSivuWidget>
    with TickerProviderStateMixin {
  late GetStartedSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetStartedSivuModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'getStarted_sivu'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GET_STARTED_SIVU_getStarted_sivu_ON_LOAD');
      logFirebaseEvent('getStarted_sivu_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.light);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Image.asset(
                  'assets/images/woman_gym_black_and_white_.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FutureBuilder<List<EsimerkkiDataRecord>>(
                  future: queryEsimerkkiDataRecordOnce(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<EsimerkkiDataRecord> columnEsimerkkiDataRecordList =
                        snapshot.data!;
                    final columnEsimerkkiDataRecord =
                        columnEsimerkkiDataRecordList.isNotEmpty
                            ? columnEsimerkkiDataRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.toistotTalteenTextModel,
                            updateCallback: () => setState(() {}),
                            child: ToistotTalteenTextWidget(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 70.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 21.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'aizxhddb' /* Tallenna treenisuoritukset */,
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      color: Color(0xFFDADADA),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25.0,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      47.0, 0.0, 47.0, 37.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'lpepy92t' /* Kirjaa muistiin treeniharjoitt... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      color: Color(0xFF797979),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17.0,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'GET_STARTED_SIVU_PAGE_Button_uusi_ON_TAP');
                                  logFirebaseEvent('Button_uusi_auth');
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await signInAnonymously(context);
                                  if (user == null) {
                                    return;
                                  }
                                  // getPlatform
                                  logFirebaseEvent('Button_uusi_getPlatform');
                                  _model.platformString =
                                      await actions.getPlatformAsString();
                                  // updateUsersRecord
                                  logFirebaseEvent(
                                      'Button_uusi_updateUsersRecord');

                                  final usersUpdateData = {
                                    ...createUsersRecordData(
                                      appLangCode: FFLocalizations.of(context)
                                          .languageCode,
                                      uid: currentUserUid,
                                    ),
                                    'created_time':
                                        FieldValue.serverTimestamp(),
                                    'treeniRutiinit':
                                        getTreeniRutiiniListFirestoreData(
                                      columnEsimerkkiDataRecord!
                                          .esimerkkiRutiinit!
                                          .toList(),
                                    ),
                                  };
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  logFirebaseEvent('Button_uusi_navigate_to');

                                  context.goNamedAuth('paasivu', mounted);

                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'epmt554y' /* Aloita */,
                                ),
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 80.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF6F6F6),
                                  textStyle:
                                      FlutterFlowTheme.of(context).title2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['buttonOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
