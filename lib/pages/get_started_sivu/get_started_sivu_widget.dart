import '/auth/firebase_auth/auth_util.dart';
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
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
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
      logFirebaseEvent('GET_STARTED_SIVU_getStarted_sivu_ON_INIT');
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
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
                  FutureBuilder<List<EsimerkkiDataRecord>>(
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
                              color: FlutterFlowTheme.of(context).primary,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 21.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'aizxhddb' /* Tallenna treenisuoritukset */,
                                            ),
                                            style: TextStyle(
                                              fontFamily: 'Satoshi',
                                              color: Color(0xE7FFFFFF),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 25.0,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation1']!),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  47.0, 0.0, 47.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'lpepy92t' /* Kirjaa muistiin treeniharjoitt... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Satoshi',
                                              color: Color(0xDFFFFFFF),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17.0,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation2']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'GET_STARTED_SIVU_PAGE_Button_uusi_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_uusi_navigate_to');

                                        context.pushNamed(
                                          'kirjaudu_sivu',
                                          queryParams: {
                                            'initialIndex': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                            ),
                                          },
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'epmt554y' /* Kirjaudu tai luo tili */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 80.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation']!),
                                    if (getRemoteConfigBool(
                                        'isEnabled_anonymousLogin'))
                                      Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 18.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'GET_STARTED_SIVU_Text_lpngc9ib_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_auth');
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    final user =
                                                        await authManager
                                                            .signInAnonymously(
                                                                context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    // getPlatform
                                                    logFirebaseEvent(
                                                        'Text_getPlatform');
                                                    _model.platformStringCopy =
                                                        await actions
                                                            .platformString();
                                                    // updateUsersRecord
                                                    logFirebaseEvent(
                                                        'Text_updateUsersRecord');

                                                    final usersUpdateData = {
                                                      ...createUsersRecordData(
                                                        appLangCode:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                        uid: currentUserUid,
                                                      ),
                                                      'created_time': FieldValue
                                                          .serverTimestamp(),
                                                      'treeniRutiinit':
                                                          getTreeniRutiiniListFirestoreData(
                                                        columnEsimerkkiDataRecord!
                                                            .esimerkkiRutiinit!
                                                            .toList(),
                                                      ),
                                                    };
                                                    await currentUserReference!
                                                        .update(
                                                            usersUpdateData);
                                                    logFirebaseEvent(
                                                        'Text_navigate_to');

                                                    context.goNamedAuth(
                                                        'paasivu', mounted);

                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'rwzc4awh' /* tai */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation3']!),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onLongPress: () async {
                                                  logFirebaseEvent(
                                                      'GET_STARTED_SIVU_JATKA_ILMAN_KIRJAUTUMIS');
                                                  if (!_model
                                                      .pressedAnonymousLogin) {
                                                    logFirebaseEvent(
                                                        'Button_update_widget_state');
                                                    _model.pressedAnonymousLogin =
                                                        false;
                                                    logFirebaseEvent(
                                                        'Button_auth');
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    final user =
                                                        await authManager
                                                            .signInAnonymously(
                                                                context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    // getPlatform
                                                    logFirebaseEvent(
                                                        'Button_getPlatform');
                                                    _model.platformStringCopy2 =
                                                        await actions
                                                            .platformString();
                                                    if (columnEsimerkkiDataRecord !=
                                                        null) {
                                                      // updateUsersRecord
                                                      logFirebaseEvent(
                                                          'Button_updateUsersRecord');

                                                      final usersUpdateData1 = {
                                                        ...createUsersRecordData(
                                                          appLangCode:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                          uid: currentUserUid,
                                                          isAnonymous: true,
                                                          isDebugUser: true,
                                                        ),
                                                        'created_time': FieldValue
                                                            .serverTimestamp(),
                                                        'treeniRutiinit':
                                                            getTreeniRutiiniListFirestoreData(
                                                          columnEsimerkkiDataRecord!
                                                              .esimerkkiRutiinit!
                                                              .toList(),
                                                        ),
                                                      };
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData1);
                                                    } else {
                                                      // updateUsersRecord
                                                      logFirebaseEvent(
                                                          'Button_updateUsersRecord');

                                                      final usersUpdateData2 = {
                                                        ...createUsersRecordData(
                                                          appLangCode:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                          uid: currentUserUid,
                                                          isAnonymous: true,
                                                          isDebugUser: true,
                                                        ),
                                                        'created_time': FieldValue
                                                            .serverTimestamp(),
                                                      };
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData2);
                                                    }

                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.goNamedAuth(
                                                        'paasivu', mounted);
                                                  }

                                                  setState(() {});
                                                },
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'GET_STARTED_SIVU_JATKA_ILMAN_KIRJAUTUMIS');
                                                    if (!_model
                                                        .pressedAnonymousLogin) {
                                                      logFirebaseEvent(
                                                          'Button_update_widget_state');
                                                      _model.pressedAnonymousLogin =
                                                          false;
                                                      logFirebaseEvent(
                                                          'Button_auth');
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      final user =
                                                          await authManager
                                                              .signInAnonymously(
                                                                  context);
                                                      if (user == null) {
                                                        return;
                                                      }
                                                      // getPlatform
                                                      logFirebaseEvent(
                                                          'Button_getPlatform');
                                                      _model.platformString =
                                                          await actions
                                                              .platformString();
                                                      if (columnEsimerkkiDataRecord !=
                                                          null) {
                                                        // updateUsersRecord
                                                        logFirebaseEvent(
                                                            'Button_updateUsersRecord');

                                                        final usersUpdateData1 =
                                                            {
                                                          ...createUsersRecordData(
                                                            appLangCode:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                            uid: currentUserUid,
                                                            isAnonymous: true,
                                                          ),
                                                          'created_time': FieldValue
                                                              .serverTimestamp(),
                                                          'treeniRutiinit':
                                                              getTreeniRutiiniListFirestoreData(
                                                            columnEsimerkkiDataRecord!
                                                                .esimerkkiRutiinit!
                                                                .toList(),
                                                          ),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData1);
                                                      } else {
                                                        // updateUsersRecord
                                                        logFirebaseEvent(
                                                            'Button_updateUsersRecord');

                                                        final usersUpdateData2 =
                                                            {
                                                          ...createUsersRecordData(
                                                            appLangCode:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                            uid: currentUserUid,
                                                            isAnonymous: true,
                                                          ),
                                                          'created_time': FieldValue
                                                              .serverTimestamp(),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData2);
                                                      }

                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.goNamedAuth(
                                                          'paasivu', mounted);
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'm7gpe2ik' /* Jatka ilman kirjautumista */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0x0014181B),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 22.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'GET_STARTED_SIVU_Text_1qlf7apm_ON_TAP');
                                          logFirebaseEvent('Text_navigate_to');

                                          context.pushNamed(
                                            'Webview1',
                                            queryParams: {
                                              'url': serializeParam(
                                                getRemoteConfigString(
                                                    'privacyPolicyUrl'),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'hqdjtyfp' /* Tietosuoja ja käyttöehdot */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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
