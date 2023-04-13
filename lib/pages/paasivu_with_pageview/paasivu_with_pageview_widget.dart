import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/components/workout_duration_text/workout_duration_text_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/sivu_rutiinit_komponentti/sivu_rutiinit_komponentti_widget.dart';
import '/pages/sivu_treenaa_komponentti/sivu_treenaa_komponentti_widget.dart';
import '/pages/sivu_treeni_historia_komponentti/sivu_treeni_historia_komponentti_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'paasivu_with_pageview_model.dart';
export 'paasivu_with_pageview_model.dart';

class PaasivuWithPageviewWidget extends StatefulWidget {
  const PaasivuWithPageviewWidget({Key? key}) : super(key: key);

  @override
  _PaasivuWithPageviewWidgetState createState() =>
      _PaasivuWithPageviewWidgetState();
}

class _PaasivuWithPageviewWidgetState extends State<PaasivuWithPageviewWidget>
    with TickerProviderStateMixin {
  late PaasivuWithPageviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 0.5,
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.97,
          end: 1.01,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.6,
          end: 1.0,
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 2000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 500.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaasivuWithPageviewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'paasivuWithPageview'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PAASIVU_WITH_PAGEVIEW_paasivuWithPagevie');
      logFirebaseEvent('paasivuWithPageview_set_dark_mode_settin');
      setDarkModeSetting(context, ThemeMode.light);
      logFirebaseEvent('paasivuWithPageview_update_app_state');
      FFAppState().sessioChunkListLastItemDateTime = [];
      logFirebaseEvent('paasivuWithPageview_update_app_state');
      FFAppState().addToSessioChunkListLastItemDateTime(getCurrentTimestamp);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textFieldSeachBarController ??=
        TextEditingController(text: FFAppState().searchbarText);
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AppConfigRecord>>(
      stream: queryAppConfigRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<AppConfigRecord> paasivuWithPageviewAppConfigRecordList =
            snapshot.data!;
        final paasivuWithPageviewAppConfigRecord =
            paasivuWithPageviewAppConfigRecordList.isNotEmpty
                ? paasivuWithPageviewAppConfigRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: false,
              child: FloatingActionButton.extended(
                onPressed: () {
                  print('FloatingActionButton pressed ...');
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.add,
                ),
                elevation: 8.0,
                label: Text(
                  FFLocalizations.of(context).getText(
                    '858ldjbd' /* Luo treenirutiini */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                ),
              ),
            ),
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.sivupalkkiModel,
                updateCallback: () => setState(() {}),
                child: SivupalkkiWidget(),
              ),
            ),
            body: SafeArea(
              child: StreamBuilder<List<TreeniSessiotRecord>>(
                stream: queryTreeniSessiotRecord(
                  queryBuilder: (treeniSessiotRecord) => treeniSessiotRecord
                      .where('userRef', isEqualTo: currentUserReference)
                      .where('loppu', isEqualTo: null)
                      .orderBy('docCreatedTime', descending: true),
                  limit: 5,
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
                  List<TreeniSessiotRecord>
                      containerQueryLatestSessioTreeniSessiotRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 1),
                              onPageChanged: (_) async {
                                logFirebaseEvent(
                                    'PAASIVU_WITH_PAGEVIEW_PageView_upzoex91_');
                                logFirebaseEvent('PageView_update_app_state');
                                setState(() {
                                  FFAppState().navBarIndex =
                                      pageViewCurrentIndex;
                                });
                              },
                              scrollDirection: Axis.horizontal,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.sivuRutiinitKomponenttiModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: SivuRutiinitKomponenttiWidget(
                                      latestSessio:
                                          containerQueryLatestSessioTreeniSessiotRecordList
                                                      .length >
                                                  0
                                              ? containerQueryLatestSessioTreeniSessiotRecordList
                                                  .first
                                              : null,
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.sivuTreenaaOmponenttiModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: SivuTreenaaKomponenttiWidget(
                                    sessioDoc:
                                        containerQueryLatestSessioTreeniSessiotRecordList
                                                    .length >
                                                0
                                            ? containerQueryLatestSessioTreeniSessiotRecordList
                                                .first
                                            : null,
                                  ),
                                ),
                                wrapWithModel(
                                  model:
                                      _model.sivuTreeniHistoriaKomponenttiModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: SivuTreeniHistoriaKomponenttiWidget(
                                    latestSessioStreamDoc:
                                        containerQueryLatestSessioTreeniSessiotRecordList
                                                    .length >
                                                0
                                            ? containerQueryLatestSessioTreeniSessiotRecordList
                                                .first
                                            : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                child: Container(
                                  width: double.infinity,
                                  height: 54.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PAASIVU_WITH_PAGEVIEW_Icon_drawer_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_drawer_drawer');
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                                logFirebaseEvent(
                                                    'Icon_drawer_widget_animation');
                                                if (animationsMap[
                                                        'iconOnActionTriggerAnimation'] !=
                                                    null) {
                                                  animationsMap[
                                                          'iconOnActionTriggerAnimation']!
                                                      .controller
                                                      .forward(from: 0.0)
                                                      .whenComplete(animationsMap[
                                                              'iconOnActionTriggerAnimation']!
                                                          .controller
                                                          .reverse);
                                                }
                                              },
                                              child: Icon(
                                                Icons.menu_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 28.0,
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'iconOnActionTriggerAnimation']!,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (FFAppState().navBarIndex == 1)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (containerQueryLatestSessioTreeniSessiotRecordList
                                                                .length >
                                                            0
                                                        ? ((containerQueryLatestSessioTreeniSessiotRecordList
                                                                    .first
                                                                    .alku !=
                                                                null) &&
                                                            (containerQueryLatestSessioTreeniSessiotRecordList
                                                                    .first
                                                                    .loppu ==
                                                                null))
                                                        : false)
                                                      wrapWithModel(
                                                        model: _model
                                                            .workoutDurationTextModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            WorkoutDurationTextWidget(
                                                          sessioDoc: containerQueryLatestSessioTreeniSessiotRecordList
                                                                      .length >
                                                                  0
                                                              ? containerQueryLatestSessioTreeniSessiotRecordList
                                                                  .first
                                                              : null,
                                                        ),
                                                      ),
                                                    if (containerQueryLatestSessioTreeniSessiotRecordList
                                                                .length >
                                                            0
                                                        ? (containerQueryLatestSessioTreeniSessiotRecordList
                                                                .first.alku ==
                                                            null)
                                                        : false)
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PAASIVU_WITH_PAGEVIEW_Row_aloitaAjanOtto');
                                                          logFirebaseEvent(
                                                              'Row_aloitaAjanOtto_backend_call');

                                                          final treeniSessiotUpdateData =
                                                              {
                                                            'alku': FieldValue
                                                                .serverTimestamp(),
                                                          };
                                                          await containerQueryLatestSessioTreeniSessiotRecordList
                                                              .first.reference
                                                              .update(
                                                                  treeniSessiotUpdateData);
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .not_started_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8iscfiix' /* Aloita treeni */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'rowOnPageLoadAnimation1']!),
                                                  ],
                                                ),
                                              if (FFAppState().navBarIndex != 1)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Autocomplete<String>(
                                                      initialValue:
                                                          TextEditingValue(
                                                              text: FFAppState()
                                                                  .searchbarText),
                                                      optionsBuilder:
                                                          (textEditingValue) {
                                                        if (textEditingValue
                                                                .text ==
                                                            '') {
                                                          return const Iterable<
                                                              String>.empty();
                                                        }
                                                        return functions
                                                            .mapRutiiniNimet(
                                                                (currentUserDocument
                                                                            ?.treeniRutiinit
                                                                            ?.toList() ??
                                                                        [])
                                                                    .toList())
                                                            .toList()
                                                            .where((option) {
                                                          final lowercaseOption =
                                                              option
                                                                  .toLowerCase();
                                                          return lowercaseOption
                                                              .contains(
                                                                  textEditingValue
                                                                      .text
                                                                      .toLowerCase());
                                                        });
                                                      },
                                                      optionsViewBuilder:
                                                          (context, onSelected,
                                                              options) {
                                                        return AutocompleteOptionsList(
                                                          textFieldKey: _model
                                                              .textFieldSeachBarKey,
                                                          textController: _model
                                                              .textFieldSeachBarController!,
                                                          options:
                                                              options.toList(),
                                                          onSelected:
                                                              onSelected,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          textHighlightStyle:
                                                              TextStyle(),
                                                          elevation: 4.0,
                                                          optionBackgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          optionHighlightColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          maxHeight: 300.0,
                                                        );
                                                      },
                                                      onSelected:
                                                          (String selection) {
                                                        setState(() => _model
                                                                .textFieldSeachBarSelectedOption =
                                                            selection);
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                      },
                                                      fieldViewBuilder: (
                                                        context,
                                                        textEditingController,
                                                        focusNode,
                                                        onEditingComplete,
                                                      ) {
                                                        _model.textFieldSeachBarController =
                                                            textEditingController;
                                                        return TextFormField(
                                                          key: _model
                                                              .textFieldSeachBarKey,
                                                          controller:
                                                              textEditingController,
                                                          focusNode: focusNode,
                                                          onEditingComplete:
                                                              onEditingComplete,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textFieldSeachBarController',
                                                            Duration(
                                                                milliseconds:
                                                                    1000),
                                                            () async {
                                                              logFirebaseEvent(
                                                                  'PAASIVU_WITH_PAGEVIEW_TextField_seachBar');
                                                              logFirebaseEvent(
                                                                  'TextField_seachBar_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .searchbarText =
                                                                    _model
                                                                        .textFieldSeachBarController
                                                                        .text;
                                                              });
                                                            },
                                                          ),
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            hintText: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              fiText: () {
                                                                if (FFAppState()
                                                                        .navBarIndex ==
                                                                    0) {
                                                                  return 'Hae treenipohja nimellä';
                                                                } else if (FFAppState()
                                                                        .navBarIndex ==
                                                                    2) {
                                                                  return 'Hae treenihistoria nimellä';
                                                                } else {
                                                                  return 'Haku';
                                                                }
                                                              }(),
                                                              enText: () {
                                                                if (FFAppState()
                                                                        .navBarIndex ==
                                                                    0) {
                                                                  return 'Hae treenipohja nimellä';
                                                                } else if (FFAppState()
                                                                        .navBarIndex ==
                                                                    2) {
                                                                  return 'Hae treenihistoria nimellä';
                                                                } else {
                                                                  return 'Haku';
                                                                }
                                                              }(),
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Color(
                                                                          0x81FFFFFF),
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        13.0,
                                                                        13.0,
                                                                        13.0,
                                                                        13.0),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .search_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 24.0,
                                                            ),
                                                            suffixIcon: _model
                                                                    .textFieldSeachBarController!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model
                                                                          .textFieldSeachBarController
                                                                          ?.clear();
                                                                      logFirebaseEvent(
                                                                          'PAASIVU_WITH_PAGEVIEW_TextField_seachBar');
                                                                      logFirebaseEvent(
                                                                          'TextField_seachBar_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().searchbarText = _model
                                                                            .textFieldSeachBarController
                                                                            .text;
                                                                      });
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: FFAppState().searchbarText != null &&
                                                                              FFAppState().searchbarText !=
                                                                                  ''
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondary
                                                                          : Colors
                                                                              .transparent,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  )
                                                                : null,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                          validator: _model
                                                              .textFieldSeachBarControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        );
                                                      },
                                                    ).animateOnPageLoad(
                                                            animationsMap[
                                                                'textFieldOnPageLoadAnimation']!),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (FFAppState().navBarIndex == 1)
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                      containerQueryLatestSessioTreeniSessiotRecordList
                                                              .length >
                                                          0,
                                                      false,
                                                    ) &&
                                                    valueOrDefault<bool>(
                                                      containerQueryLatestSessioTreeniSessiotRecordList
                                                              .first.alku ==
                                                          null,
                                                      false,
                                                    ) &&
                                                    valueOrDefault<bool>(
                                                      containerQueryLatestSessioTreeniSessiotRecordList
                                                              .first.loppu ==
                                                          null,
                                                      false,
                                                    ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  22.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PAASIVU_WITH_PAGEVIEW_Icon_tkgtcu65_ON_T');
                                                          logFirebaseEvent(
                                                              'Icon_backend_call');
                                                          await containerQueryLatestSessioTreeniSessiotRecordList
                                                              .first.reference
                                                              .delete();
                                                        },
                                                        child: Icon(
                                                          Icons.delete_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .deleteRed,
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (containerQueryLatestSessioTreeniSessiotRecordList
                                                            .length >
                                                        0
                                                    ? valueOrDefault<bool>(
                                                        valueOrDefault<bool>(
                                                              containerQueryLatestSessioTreeniSessiotRecordList
                                                                      .first
                                                                      .alku !=
                                                                  null,
                                                              false,
                                                            ) &&
                                                            valueOrDefault<
                                                                bool>(
                                                              containerQueryLatestSessioTreeniSessiotRecordList
                                                                      .first
                                                                      .loppu ==
                                                                  null,
                                                              true,
                                                            ),
                                                        false,
                                                      )
                                                    : false)
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'PAASIVU_WITH_PAGEVIEW_Row_lopetaTreeni_O');
                                                      logFirebaseEvent(
                                                          'Row_lopetaTreeni_backend_call');

                                                      final treeniSessiotUpdateData =
                                                          {
                                                        'loppu': FieldValue
                                                            .serverTimestamp(),
                                                      };
                                                      await containerQueryLatestSessioTreeniSessiotRecordList
                                                          .first.reference
                                                          .update(
                                                              treeniSessiotUpdateData);
                                                      logFirebaseEvent(
                                                          'Row_lopetaTreeni_backend_call');

                                                      final usersUpdateData = {
                                                        'treeniKestoYhteensaSekunteina':
                                                            FieldValue
                                                                .increment(1.0),
                                                        'treeniaYhteensa':
                                                            FieldValue
                                                                .increment(1),
                                                      };
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData);
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .stop_circle_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .deleteRed,
                                                                size: 30.0,
                                                              ),
                                                              if (false)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ngkj2h22' /* Lopeta */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'rowOnPageLoadAnimation2']!),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation']!),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (revenue_cat.activeEntitlementIds.length == 0
                                  ? () {
                                      if (isAndroid) {
                                        return getRemoteConfigBool(
                                            'showAdBanner_android');
                                      } else if (isiOS) {
                                        return getRemoteConfigBool(
                                            'showAdBanner_ios');
                                      } else if (isWeb) {
                                        return getRemoteConfigBool(
                                            'showAdBanner_web');
                                      } else {
                                        return false;
                                      }
                                    }()
                                  : false)
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 600.0,
                                    maxHeight: 60.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: FlutterFlowAdBanner(
                                    showsTestAd: true,
                                    iOSAdUnitID:
                                        'ca-app-pub-6667798289242281/3798313004',
                                    androidAdUnitID:
                                        'ca-app-pub-6667798289242281/8613432088',
                                  ),
                                ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (!(isWeb
                                    ? MediaQuery.of(context).viewInsets.bottom >
                                        0
                                    : _isKeyboardVisible))
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 76.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 600.0,
                                        maxHeight: 200.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 5.0),
                                            spreadRadius: 2.0,
                                          )
                                        ],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PAASIVU_WITH_PAGEVIEW_Container_5u6of3wp');
                                                logFirebaseEvent(
                                                    'Container_widget_animation');
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation1'] !=
                                                    null) {
                                                  animationsMap[
                                                          'containerOnActionTriggerAnimation1']!
                                                      .controller
                                                      .forward(from: 0.0)
                                                      .whenComplete(animationsMap[
                                                              'containerOnActionTriggerAnimation1']!
                                                          .controller
                                                          .reverse);
                                                }
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().navBarIndex = 0;
                                                logFirebaseEvent(
                                                    'Container_page_view');
                                                await _model.pageViewController
                                                    ?.animateToPage(
                                                  0,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FFAppState()
                                                              .navBarIndex ==
                                                          0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : Color(0x00000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .featured_play_list_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 36.0,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              fiText:
                                                                  'Treenipohjat',
                                                              enText:
                                                                  'Routines',
                                                            ),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation1']!,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PAASIVU_WITH_PAGEVIEW_Container_6ui38rel');
                                                logFirebaseEvent(
                                                    'Container_widget_animation');
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation2'] !=
                                                    null) {
                                                  animationsMap[
                                                          'containerOnActionTriggerAnimation2']!
                                                      .controller
                                                      .forward(from: 0.0)
                                                      .whenComplete(animationsMap[
                                                              'containerOnActionTriggerAnimation2']!
                                                          .controller
                                                          .reverse);
                                                }
                                                if (FFAppState().navBarIndex !=
                                                    1) {
                                                  if (FFAppState()
                                                          .navBarIndex ==
                                                      0) {
                                                    logFirebaseEvent(
                                                        'Container_page_view');
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Container_page_view');
                                                    await _model
                                                        .pageViewController
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  }
                                                }
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().navBarIndex = 1;
                                              },
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FFAppState()
                                                              .navBarIndex ==
                                                          1
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : Color(0x00000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Lottie.network(
                                                      'https://assets8.lottiefiles.com/packages/lf20_ixy19tfg.json',
                                                      width: 60.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                      frameRate:
                                                          FrameRate(60.0),
                                                      animate: FFAppState()
                                                          .isLatestUnfinnishedWorkout,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              fiText: 'Treenaa',
                                                              enText: 'Workout',
                                                            ),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation2']!,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PAASIVU_WITH_PAGEVIEW_Container_8xnhzvl5');
                                                logFirebaseEvent(
                                                    'Container_widget_animation');
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation3'] !=
                                                    null) {
                                                  animationsMap[
                                                          'containerOnActionTriggerAnimation3']!
                                                      .controller
                                                      .forward(from: 0.0)
                                                      .whenComplete(animationsMap[
                                                              'containerOnActionTriggerAnimation3']!
                                                          .controller
                                                          .reverse);
                                                }
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().navBarIndex = 2;
                                                logFirebaseEvent(
                                                    'Container_page_view');
                                                await _model.pageViewController
                                                    ?.animateToPage(
                                                  2,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FFAppState()
                                                              .navBarIndex ==
                                                          2
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : Color(0x00000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .history_toggle_off_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 36.0,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              fiText: 'Treenit',
                                                              enText:
                                                                  'Workouts',
                                                            ),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation3']!,
                                            ),
                                            if (false)
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PAASIVU_WITH_PAGEVIEW_Container_h3ck4imk');
                                                  logFirebaseEvent(
                                                      'Container_widget_animation');
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation4'] !=
                                                      null) {
                                                    animationsMap[
                                                            'containerOnActionTriggerAnimation4']!
                                                        .controller
                                                        .forward(from: 0.0)
                                                        .whenComplete(animationsMap[
                                                                'containerOnActionTriggerAnimation4']!
                                                            .controller
                                                            .reverse);
                                                  }
                                                  logFirebaseEvent(
                                                      'Container_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState().navBarIndex =
                                                        3;
                                                  });
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FFAppState()
                                                                .navBarIndex ==
                                                            3
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary
                                                        : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.bar_chart_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 40.0,
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getVariableText(
                                                                fiText:
                                                                    'Tilastot',
                                                                enText:
                                                                    'Statistics',
                                                              ),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'containerOnActionTriggerAnimation4']!,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}