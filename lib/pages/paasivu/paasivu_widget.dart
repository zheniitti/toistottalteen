import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation_bar/navigation_bar_widget.dart';
import '/components/sivu_rutiinit_komponentti/sivu_rutiinit_komponentti_widget.dart';
import '/components/sivu_treenaa_komponentti/sivu_treenaa_komponentti_widget.dart';
import '/components/sivu_treeni_historia_komponentti/sivu_treeni_historia_komponentti_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/components/workout_duration_text/workout_duration_text_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'paasivu_model.dart';
export 'paasivu_model.dart';

class PaasivuWidget extends StatefulWidget {
  const PaasivuWidget({Key? key}) : super(key: key);

  @override
  _PaasivuWidgetState createState() => _PaasivuWidgetState();
}

class _PaasivuWidgetState extends State<PaasivuWidget>
    with TickerProviderStateMixin {
  late PaasivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'navigationBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
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
          end: 1,
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
          begin: Offset(0, -100),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaasivuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'paasivu'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PAASIVU_PAGE_paasivu_ON_INIT_STATE');
      logFirebaseEvent('paasivu_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.light);
      logFirebaseEvent('paasivu_update_app_state');
      FFAppState().sessioChunkListLastItemDateTime = [];
      logFirebaseEvent('paasivu_update_app_state');
      FFAppState().addToSessioChunkListLastItemDateTime(getCurrentTimestamp);
    });

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
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<AppConfigRecord> paasivuAppConfigRecordList = snapshot.data!;
        final paasivuAppConfigRecord = paasivuAppConfigRecordList.isNotEmpty
            ? paasivuAppConfigRecordList.first
            : null;
        return Scaffold(
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
              elevation: 8,
              label: Text(
                FFLocalizations.of(context).getText(
                  't1qezc6y' /* Luo treenirutiini */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondary,
                    ),
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 16,
            child: wrapWithModel(
              model: _model.sivupalkkiModel,
              updateCallback: () => setState(() {}),
              child: SivupalkkiWidget(),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                        width: 50,
                        height: 50,
                        child: SpinKitCircle(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50,
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  if (FFAppState().navBarIndex == 0)
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: wrapWithModel(
                                        model:
                                            _model.sivuRutiinitKomponenttiModel,
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
                                  if (FFAppState().navBarIndex == 2)
                                    wrapWithModel(
                                      model: _model
                                          .sivuTreeniHistoriaKomponenttiModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child:
                                          SivuTreeniHistoriaKomponenttiWidget(
                                        latestSessioStreamDoc:
                                            containerQueryLatestSessioTreeniSessiotRecordList
                                                        .length >
                                                    0
                                                ? containerQueryLatestSessioTreeniSessiotRecordList
                                                    .first
                                                : null,
                                      ),
                                    ),
                                  if ((FFAppState().navBarIndex == 1) ||
                                      FFAppState().showTreenaaTaiLuoRutiiniSivu)
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
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 14, 16, 14),
                              child: wrapWithModel(
                                model: _model.navigationBarModel,
                                updateCallback: () => setState(() {}),
                                child: NavigationBarWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'navigationBarOnPageLoadAnimation']!),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 1,
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
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
                                              AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PAASIVU_PAGE_Icon_drawer_ON_TAP');
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
                                                size: 28,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (FFAppState().navBarIndex == 0)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [],
                                                ),
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
                                                              'PAASIVU_PAGE_Row_aloitaAjanOtto_ON_TAP');
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
                                                              size: 30,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
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
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'uw6dunth' /* Aloita treeni */,
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
                                                                                14,
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
                                                          0, 0),
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
                                                          elevation: 4,
                                                          optionBackgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          optionHighlightColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          maxHeight: 300,
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
                                                                  'PAASIVU_TextField_seachBar_ON_TEXTFIELD_');
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
                                                                          16,
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        13,
                                                                        13,
                                                                        13,
                                                                        13),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .search_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 24,
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
                                                                          'PAASIVU_TextField_seachBar_ON_TEXTFIELD_');
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
                                                                      size: 24,
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
                                                    0, 0, 4, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                      containerQueryLatestSessioTreeniSessiotRecordList
                                                              .first !=
                                                          null,
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
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 22, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PAASIVU_PAGE_Icon_ofdgz8ab_ON_TAP');
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
                                                          size: 28,
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
                                                          'PAASIVU_PAGE_Row_lopetaTreeni_ON_TAP');
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
                                                                size: 30,
                                                              ),
                                                              if (false)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ouj3p8pa' /* Lopeta */,
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
                                                                              12,
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
                              if (revenue_cat.activeEntitlementIds.length == 0)
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 600,
                                    maxHeight: 60,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
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
