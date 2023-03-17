import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation_bar/navigation_bar_widget.dart';
import '/components/sivu_rutiinit_komponentti/sivu_rutiinit_komponentti_widget.dart';
import '/components/sivu_treenaa_komponentti/sivu_treenaa_komponentti_widget.dart';
import '/components/sivu_treeni_historia_komponentti/sivu_treeni_historia_komponentti_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/components/workout_duration_text/workout_duration_text_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
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
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
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
          begin: 0.0,
          end: 0.5,
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
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
    'columnOnPageLoadAnimation1': AnimationInfo(
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
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1280.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1280.ms,
          duration: 800.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1280.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaasivuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'paasivu'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PAASIVU_PAGE_paasivu_ON_PAGE_LOAD');
      logFirebaseEvent('paasivu_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.light);
      logFirebaseEvent('paasivu_update_app_state');
      FFAppState().sessioChunkListLastItemDateTime = [];
      logFirebaseEvent('paasivu_update_app_state');
      FFAppState().addToSessioChunkListLastItemDateTime(getCurrentTimestamp);
    });

    _model.textFieldSeachBarController ??=
        TextEditingController(text: FFAppState().searchbarText);
    _model.textController2 ??=
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
              width: 40.0,
              height: 40.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
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
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              icon: Icon(
                Icons.add,
              ),
              elevation: 8.0,
              label: Text(
                FFLocalizations.of(context).getText(
                  't1qezc6y' /* Luo treenirutiini */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryColor,
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
          appBar: false
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  automaticallyImplyLeading: true,
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().navBarIndex == 0)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                      if (FFAppState().navBarIndex == 1)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'd9b3r5r8' /* Aikaa kulunut: */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowTimer(
                                    initialTime: _model.timerMilliseconds,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(value,
                                            milliSecond: false),
                                    timer: _model.timerController,
                                    updateStateInterval:
                                        Duration(milliseconds: 1000),
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timerMilliseconds = value;
                                      _model.timerValue = displayTime;
                                      if (shouldUpdate) setState(() {});
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'PAASIVU_PAGE_Row_aloitaAjanOtto_ON_TAP');
                                logFirebaseEvent('Row_aloitaAjanOtto_timer');
                                _model.timerController.onExecute
                                    .add(StopWatchExecute.start);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.not_started_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    size: 30.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'hwbly3hr' /* Aloita ajanotto */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (FFAppState().navBarIndex != 1)
                        TextFormField(
                          controller: _model.textController2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController2',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText:
                                FFLocalizations.of(context).getVariableText(
                              fiText: () {
                                if (FFAppState().navBarIndex == 0) {
                                  return 'Hae treenipohja nimellä';
                                } else if (FFAppState().navBarIndex == 2) {
                                  return 'Hae treenihistoria nimellä';
                                } else {
                                  return 'Haku';
                                }
                              }(),
                              enText: () {
                                if (FFAppState().navBarIndex == 0) {
                                  return 'Hae treenipohja nimellä';
                                } else if (FFAppState().navBarIndex == 2) {
                                  return 'Hae treenihistoria nimellä';
                                } else {
                                  return 'Haku';
                                }
                              }(),
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0x81FFFFFF),
                                      fontSize: 16.0,
                                    ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 13.0, 13.0),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 24.0,
                            ),
                            suffixIcon: _model.textController2!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController2?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FFAppState().searchbarText !=
                                                  null &&
                                              FFAppState().searchbarText != ''
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : Colors.transparent,
                                      size: 24.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontWeight: FontWeight.normal,
                              ),
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ).animateOnPageLoad(
                            animationsMap['textFieldOnPageLoadAnimation2']!),
                    ],
                  ),
                  actions: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (FFAppState().navBarIndex != 1)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Icon(
                                  Icons.help_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              ),
                          ],
                        ),
                        if ((FFAppState().navBarIndex == 1) && true)
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'PAASIVU_PAGE_Row_lopetaTreeni_ON_TAP');
                              logFirebaseEvent('Row_lopetaTreeni_timer');
                              _model.timerController.onExecute
                                  .add(StopWatchExecute.stop);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.stop_circle_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  size: 30.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'wbg0l8iz' /* Lopeta treeni */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                fontSize: 12.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation2']!),
                  ],
                  centerTitle: true,
                  elevation: 4.0,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: StreamBuilder<List<TreeniSessiotRecord>>(
                stream: queryTreeniSessiotRecord(
                  queryBuilder: (treeniSessiotRecord) => treeniSessiotRecord
                      .where('userRef', isEqualTo: currentUserReference)
                      .orderBy('docCreatedTime', descending: true),
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
                  List<TreeniSessiotRecord>
                      containerQueryLatestSessioTreeniSessiotRecordList =
                      snapshot.data!;
                  final containerQueryLatestSessioTreeniSessiotRecord =
                      containerQueryLatestSessioTreeniSessiotRecordList
                              .isNotEmpty
                          ? containerQueryLatestSessioTreeniSessiotRecordList
                              .first
                          : null;
                  return Container(
                    decoration: BoxDecoration(),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 60.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  if (FFAppState().navBarIndex == 0)
                                    wrapWithModel(
                                      model:
                                          _model.sivuRutiinitKomponenttiModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: SivuRutiinitKomponenttiWidget(
                                        latestSessio:
                                            containerQueryLatestSessioTreeniSessiotRecord,
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
                                            containerQueryLatestSessioTreeniSessiotRecord,
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
                                            containerQueryLatestSessioTreeniSessiotRecord,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 14.0, 16.0, 14.0),
                              child: wrapWithModel(
                                model: _model.navigationBarModel,
                                updateCallback: () => setState(() {}),
                                child: NavigationBarWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'navigationBarOnPageLoadAnimation']!),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
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
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (FFAppState().navBarIndex == 0)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [],
                                          ),
                                        if (FFAppState().navBarIndex == 1)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (containerQueryLatestSessioTreeniSessiotRecord!
                                                      .alku !=
                                                  null)
                                                wrapWithModel(
                                                  model: _model
                                                      .workoutDurationTextModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      WorkoutDurationTextWidget(
                                                    sessioDoc:
                                                        containerQueryLatestSessioTreeniSessiotRecord,
                                                  ),
                                                ),
                                              if ((containerQueryLatestSessioTreeniSessiotRecord!
                                                          .reference !=
                                                      null) &&
                                                  (containerQueryLatestSessioTreeniSessiotRecord!
                                                          .alku ==
                                                      null))
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
                                                    await containerQueryLatestSessioTreeniSessiotRecord!
                                                        .reference
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'uw6dunth' /* Aloita ajanotto */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
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
                                                ),
                                            ],
                                          ),
                                        if (FFAppState().navBarIndex != 1)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Autocomplete<
                                                  String>(
                                                initialValue: TextEditingValue(
                                                    text: FFAppState()
                                                        .searchbarText),
                                                optionsBuilder:
                                                    (textEditingValue) {
                                                  if (textEditingValue.text ==
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
                                                        option.toLowerCase();
                                                    return lowercaseOption
                                                        .contains(
                                                            textEditingValue
                                                                .text
                                                                .toLowerCase());
                                                  });
                                                },
                                                optionsViewBuilder: (context,
                                                    onSelected, options) {
                                                  return AutocompleteOptionsList(
                                                    textFieldKey: _model
                                                        .textFieldSeachBarKey,
                                                    textController: _model
                                                        .textFieldSeachBarController!,
                                                    options: options.toList(),
                                                    onSelected: onSelected,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    textHighlightStyle:
                                                        TextStyle(),
                                                    elevation: 4.0,
                                                    optionBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    optionHighlightColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    maxHeight: 300.0,
                                                  );
                                                },
                                                onSelected: (String selection) {
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
                                                        EasyDebounce.debounce(
                                                      '_model.textFieldSeachBarController',
                                                      Duration(
                                                          milliseconds: 500),
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
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
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
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0x81FFFFFF),
                                                                fontSize: 16.0,
                                                              ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  13.0,
                                                                  13.0,
                                                                  13.0),
                                                      prefixIcon: Icon(
                                                        Icons.search_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        size: 24.0,
                                                      ),
                                                      suffixIcon: _model
                                                              .textFieldSeachBarController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .textFieldSeachBarController
                                                                    ?.clear();
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
                                                                setState(() {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FFAppState().searchbarText !=
                                                                            null &&
                                                                        FFAppState().searchbarText !=
                                                                            ''
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor
                                                                    : Colors
                                                                        .transparent,
                                                                size: 24.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: _model
                                                        .textFieldSeachBarControllerValidator
                                                        .asValidator(context),
                                                  );
                                                },
                                              ).animateOnPageLoad(animationsMap[
                                                  'textFieldOnPageLoadAnimation1']!),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (FFAppState().navBarIndex != 1)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Icon(
                                              Icons.help_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 28.0,
                                            ),
                                          ),
                                        ),
                                      if ((FFAppState().navBarIndex == 1) &&
                                          (containerQueryLatestSessioTreeniSessiotRecord!
                                                  .loppu ==
                                              null) &&
                                          (containerQueryLatestSessioTreeniSessiotRecord!
                                                  .alku !=
                                              null))
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PAASIVU_PAGE_Row_lopetaTreeni_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_lopetaTreeni_backend_call');

                                            final treeniSessiotUpdateData = {
                                              'loppu':
                                                  FieldValue.serverTimestamp(),
                                            };
                                            await containerQueryLatestSessioTreeniSessiotRecord!
                                                .reference
                                                .update(
                                                    treeniSessiotUpdateData);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.stop_circle_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                size: 30.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ouj3p8pa' /* Lopeta treeni */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
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
                                        ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation1']!),
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
