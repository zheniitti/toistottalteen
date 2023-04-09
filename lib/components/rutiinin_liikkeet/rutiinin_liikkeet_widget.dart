import '/backend/backend.dart';
import '/components/rutiinin_liike_kommentti_textfield/rutiinin_liike_kommentti_textfield_widget.dart';
import '/components/rutiinin_liike_nimi_textfield/rutiinin_liike_nimi_textfield_widget.dart';
import '/components/rutiinin_sarjat_toistot_kesto_matka/rutiinin_sarjat_toistot_kesto_matka_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiinin_liikkeet_model.dart';
export 'rutiinin_liikkeet_model.dart';

class RutiininLiikkeetWidget extends StatefulWidget {
  const RutiininLiikkeetWidget({
    Key? key,
    this.rutiini,
    this.sessioDoc,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;
  final TreeniSessiotRecord? sessioDoc;

  @override
  _RutiininLiikkeetWidgetState createState() => _RutiininLiikkeetWidgetState();
}

class _RutiininLiikkeetWidgetState extends State<RutiininLiikkeetWidget>
    with TickerProviderStateMixin {
  late RutiininLiikkeetModel _model;

  final animationsMap = {
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
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
    _model = createModel(context, () => RutiininLiikkeetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RUTIININ_LIIKKEET_rutiininLiikkeet_ON_IN');
      logFirebaseEvent('rutiininLiikkeet_update_widget_state');
      _model.isSessio = valueOrDefault<bool>(
        widget.sessioDoc != null,
        false,
      );
    });

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final liikkeet = widget.rutiini?.liikkeet?.toList()?.toList() ?? [];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(liikkeet.length, (liikkeetIndex) {
            final liikkeetItem = liikkeet[liikkeetIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      if (!widget.rutiini!.finishedEditing!)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 8.0, 4.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'RUTIININ_LIIKKEET_Icon_deleteLiike_ON_TA');
                              logFirebaseEvent(
                                  'Icon_deleteLiike_custom_action');
                              await actions.updateUserDocTreenirutiini(
                                widget.rutiini,
                                null,
                                null,
                                false,
                                true,
                                liikkeetIndex,
                                null,
                                null,
                                widget.rutiini?.liikkeet?.toList()?.toList(),
                                null,
                                null,
                                null,
                                null,
                                true,
                                false,
                                false,
                              );
                            },
                            child: Icon(
                              Icons.remove_circle_rounded,
                              color: FlutterFlowTheme.of(context).deleteRed,
                              size: 24.0,
                            ),
                          )
                              .animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation1']!)
                              .animateOnActionTrigger(
                                animationsMap['iconOnActionTriggerAnimation1']!,
                              ),
                        ),
                      if (widget.rutiini?.finishedEditing ?? true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 8.0, 4.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'RUTIININ_LIIKKEET_Icon_copyLiike_ON_TAP');
                              logFirebaseEvent(
                                  'Icon_copyLiike_update_app_state');
                              FFAppState().kopioidutLiikkeet = functions
                                  .liikeToLiikeJsonList(liikkeetItem,
                                      functions.nullLiikeList()?.toList())!
                                  .toList();
                              logFirebaseEvent('Icon_copyLiike_show_snack_bar');
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      fiText: 'Liike kopioitu',
                                      enText: 'Excersice copied',
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 3000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            },
                            child: Icon(
                              Icons.content_copy_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          )
                              .animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation2']!)
                              .animateOnActionTrigger(
                                animationsMap['iconOnActionTriggerAnimation2']!,
                              ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      RutiininLiikeNimiTextfieldWidget(
                                        key: Key(
                                            'Key8jh_${liikkeetIndex}_of_${liikkeet.length}'),
                                        liikeIndex: liikkeetIndex,
                                        rutiini: widget.rutiini,
                                        liike: liikkeetItem,
                                      ),
                                      Visibility(
                                        visible: valueOrDefault<bool>(
                                          _model.isSessio,
                                          false,
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'RUTIININ_LIIKKEET_Column_sarjatToistotMu');
                                            logFirebaseEvent(
                                                'Column_sarjatToistotMuut_custom_action');
                                            _model.jsonRutiiniCopy =
                                                await actions
                                                    .rutiiniToJsonFirestoreData(
                                              widget.rutiini,
                                            );
                                            if (false) {
                                              logFirebaseEvent(
                                                  'Column_sarjatToistotMuut_update_app_stat');
                                              FFAppState().update(() {
                                                FFAppState()
                                                        .valittuMuokattavaLiikeIndex =
                                                    liikkeetIndex;
                                                FFAppState()
                                                        .valittuMuokattavaRutiini =
                                                    _model.jsonRutiiniCopy!;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'Column_sarjatToistotMuut_bottom_sheet');
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (bottomSheetContext) {
                                                  return Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          RutiininSarjatToistotKestoMatkaWidget(
                                                        rutiini: widget.rutiini,
                                                        liikeIndex:
                                                            liikkeetIndex,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (widget
                                                      .rutiini!.finishedEditing!
                                                  ? (valueOrDefault<bool>(
                                                        liikkeetItem
                                                                .sarjaMaara! >
                                                            0,
                                                        false,
                                                      ) &&
                                                      (liikkeetItem
                                                              .toistoMaara! >
                                                          0) &&
                                                      !liikkeetItem
                                                          .isOtherExerciseType!)
                                                  : !liikkeetItem
                                                      .isOtherExerciseType!)
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: liikkeetItem
                                                            .sarjaMaara!
                                                            .toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'sqgnk84v' /*  sarjaa */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: ' x ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14.0,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: liikkeetItem
                                                            .toistoMaara!
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '5aat8tgq' /*  toistoa   */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: liikkeetItem
                                                            .aloitusPainoKg!
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: ' kg',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              if (liikkeetItem
                                                      .isOtherExerciseType ??
                                                  true)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 0.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Visibility(
                                                          visible: widget
                                                                  .rutiini!
                                                                  .finishedEditing!
                                                              ? (valueOrDefault<
                                                                      bool>(
                                                                    liikkeetItem
                                                                            .kestoSekunteina !=
                                                                        null,
                                                                    false,
                                                                  ) &&
                                                                  (functions
                                                                          .remainingHours(
                                                                              liikkeetItem.kestoSekunteina)
                                                                          .toString() !=
                                                                      '0'))
                                                              : true,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: functions
                                                                        .remainingHours(
                                                                            liikkeetItem.kestoSekunteina)
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kyunprgy' /*  tuntia  */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: widget
                                                                  .rutiini!
                                                                  .finishedEditing!
                                                              ? (valueOrDefault<
                                                                      bool>(
                                                                    liikkeetItem
                                                                            .kestoSekunteina !=
                                                                        null,
                                                                    false,
                                                                  ) &&
                                                                  (functions
                                                                          .remainingMinutes(
                                                                              liikkeetItem.kestoSekunteina)
                                                                          .toString() !=
                                                                      '0'))
                                                              : true,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: functions
                                                                        .remainingMinutes(
                                                                            liikkeetItem.kestoSekunteina)
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pa1hiz52' /*  minuuttia */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: widget
                                                                  .rutiini!
                                                                  .finishedEditing!
                                                              ? ((liikkeetItem
                                                                          .kestoSekunteina !=
                                                                      null) &&
                                                                  (functions
                                                                          .remainingSeconds(
                                                                              liikkeetItem.kestoSekunteina)
                                                                          .toString() !=
                                                                      '0.0'))
                                                              : true,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: functions
                                                                        .remainingSeconds(
                                                                            liikkeetItem.kestoSekunteina)
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '8r7ks2w3' /*  sekuntia */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: widget
                                                                  .rutiini!
                                                                  .finishedEditing!
                                                              ? (valueOrDefault<
                                                                      bool>(
                                                                    liikkeetItem
                                                                            .matkaMetri !=
                                                                        null,
                                                                    false,
                                                                  ) &&
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    liikkeetItem
                                                                            .matkaMetri! >
                                                                        0.0,
                                                                    false,
                                                                  ))
                                                              : true,
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      formatNumber(
                                                                    liikkeetItem
                                                                        .matkaMetri!,
                                                                    formatType:
                                                                        FormatType
                                                                            .compact,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ud5vyksn' /* m */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (valueOrDefault<bool>(
                                    widget.rutiini!.finishedEditing!
                                        ? (liikkeetItem.kommentti != null &&
                                            liikkeetItem.kommentti != '')
                                        : (liikkeetItem.nimi != null &&
                                            liikkeetItem.nimi != ''),
                                    false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.0, 0.0, 0.0, 0.0),
                                      child:
                                          RutiininLiikeKommenttiTextfieldWidget(
                                        key: Key(
                                            'Keyst7_${liikkeetIndex}_of_${liikkeet.length}'),
                                        liikeIndex: liikkeetIndex,
                                        rutiini: widget.rutiini,
                                        liike: liikkeetItem,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
