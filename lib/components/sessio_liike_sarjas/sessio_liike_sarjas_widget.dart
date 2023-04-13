import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_liike/bottom_sheet_liike_widget.dart';
import '/components/other_type_liike_fields/other_type_liike_fields_widget.dart';
import '/components/sarja_paino_textfield/sarja_paino_textfield_widget.dart';
import '/components/sarja_toistot_textfield/sarja_toistot_textfield_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sessio_liike_sarjas_model.dart';
export 'sessio_liike_sarjas_model.dart';

class SessioLiikeSarjasWidget extends StatefulWidget {
  const SessioLiikeSarjasWidget({
    Key? key,
    this.liike,
    this.treeniSessio,
    this.liikeIndexInList,
  }) : super(key: key);

  final LiikeStruct? liike;
  final TreeniSessiotRecord? treeniSessio;
  final int? liikeIndexInList;

  @override
  _SessioLiikeSarjasWidgetState createState() =>
      _SessioLiikeSarjasWidgetState();
}

class _SessioLiikeSarjasWidgetState extends State<SessioLiikeSarjasWidget>
    with TickerProviderStateMixin {
  late SessioLiikeSarjasModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
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
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
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
    _model = createModel(context, () => SessioLiikeSarjasModel());

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

    return Container(
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        color: Color(0x00000000),
        child: ExpandableNotifier(
          initialExpanded: false,
          child: ExpandablePanel(
            header: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.liike!.nimi!,
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.liike?.sarjat
                                  ?.toList()
                                  ?.length
                                  ?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'gl0py1hq' /* sarjaa */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.liike!.kommentti!,
                      maxLines: 5,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'SESSIO_LIIKE_SARJAS_Icon_more_ON_TAP');
                              logFirebaseEvent('Icon_more_bottom_sheet');
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Color(0x00FFFFFF),
                                context: context,
                                builder: (bottomSheetContext) {
                                  return Padding(
                                    padding: MediaQuery.of(bottomSheetContext)
                                        .viewInsets,
                                    child: BottomSheetLiikeWidget(
                                      sessioDoc: widget.treeniSessio,
                                      liikeIndex: valueOrDefault<int>(
                                        widget.liikeIndexInList,
                                        99999999999,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Icon(
                              Icons.more_vert_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            collapsed: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: 0.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            expanded: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final sarjat =
                          widget.liike?.sarjat?.toList()?.toList() ?? [];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(sarjat.length, (sarjatIndex) {
                          final sarjatItem = sarjat[sarjatIndex];
                          return Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 2.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: sarjatItem.doneDatetime != null
                                              ? FlutterFlowTheme.of(context)
                                                  .inactiveWidgetBackground
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 3.0),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            children: [
                                              if (valueOrDefault<bool>(
                                                widget
                                                    .liike?.isOtherExerciseType,
                                                false,
                                              ))
                                                wrapWithModel(
                                                  model: _model
                                                      .otherTypeLiikeFieldsModels
                                                      .getModel(
                                                    sarjatItem.createdTime!
                                                        .toString(),
                                                    sarjatIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      OtherTypeLiikeFieldsWidget(
                                                    key: Key(
                                                      'Keyp9n_${sarjatItem.createdTime!.toString()}',
                                                    ),
                                                    liike: widget.liike,
                                                    sarja: sarjatItem,
                                                    liikeIndex:
                                                        widget.liikeIndexInList,
                                                    sarjaIndex: sarjatIndex,
                                                    sessioDoc:
                                                        widget.treeniSessio,
                                                  ),
                                                ),
                                              if (!valueOrDefault<bool>(
                                                widget
                                                    .liike?.isOtherExerciseType,
                                                true,
                                              ))
                                                Wrap(
                                                  spacing: 8.0,
                                                  runSpacing: 4.0,
                                                  alignment: WrapAlignment.end,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.center,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'paq49ccg' /* Toistot */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              SarjaToistotTextfieldWidget(
                                                            key: Key(
                                                                'Keyrhm_${sarjatIndex}_of_${sarjat.length}'),
                                                            sarjaIndex:
                                                                sarjatIndex,
                                                            liikeIndex: widget
                                                                .liikeIndexInList,
                                                            sarja: sarjatItem,
                                                            sessioDoc: widget
                                                                .treeniSessio,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0aim9tx5' /* Paino (kg) */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              SarjaPainoTextfieldWidget(
                                                            key: Key(
                                                                'Key1t9_${sarjatIndex}_of_${sarjat.length}'),
                                                            sarjaIndex:
                                                                sarjatIndex,
                                                            liikeIndex: widget
                                                                .liikeIndexInList,
                                                            sarja: sarjatItem,
                                                            sessioDoc: widget
                                                                .treeniSessio,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: (sarjatIndex +
                                                                          1)
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0fuvage0' /* .
sarja */
                                                                    ,
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
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 2,
                                                          ),
                                                        ),
                                                        if (!widget
                                                            .liike!.tehty!)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          4.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SESSIO_LIIKE_SARJAS_Icon_ue93p3f9_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_custom_action');
                                                                  _model.updatedLiikeCopy2 =
                                                                      await actions
                                                                          .myUpdateLiikeStruct(
                                                                    widget
                                                                        .liike,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    sarjatIndex,
                                                                    null,
                                                                    null,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Icon_custom_action');
                                                                  _model.updatedRutiiniCopy2 =
                                                                      await actions
                                                                          .myUpdateTreeniRutiiniStruct(
                                                                    widget
                                                                        .treeniSessio!
                                                                        .treeniRutiiniData,
                                                                    null,
                                                                    null,
                                                                    widget
                                                                        .treeniSessio!
                                                                        .treeniRutiiniData
                                                                        .liikkeet
                                                                        ?.toList()
                                                                        ?.toList(),
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    false,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    null,
                                                                    widget
                                                                        .liikeIndexInList,
                                                                    _model
                                                                        .updatedLiikeCopy2,
                                                                    null,
                                                                    functions
                                                                        .emptyJsonList()
                                                                        ?.toList(),
                                                                    false,
                                                                    false,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Icon_backend_call');

                                                                  final treeniSessiotUpdateData =
                                                                      createTreeniSessiotRecordData(
                                                                    treeniRutiiniData:
                                                                        updateTreeniRutiiniStruct(
                                                                      _model
                                                                          .updatedRutiiniCopy2,
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  );
                                                                  await widget
                                                                      .treeniSessio!
                                                                      .reference
                                                                      .update(
                                                                          treeniSessiotUpdateData);

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .remove_circle_rounded,
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  size: 24.0,
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'iconOnPageLoadAnimation1']!),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 12.0, 0.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SESSIO_LIIKE_SARJAS_Row_tkwxd0wu_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_custom_action');
                                                      _model.updatedSarja =
                                                          await actions
                                                              .myUpdateSarja(
                                                        sarjatItem,
                                                        true,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        sarjatItem.doneDatetime !=
                                                                null
                                                            ? null
                                                            : getCurrentTimestamp,
                                                        sarjatItem.doneDatetime !=
                                                                null
                                                            ? true
                                                            : false,
                                                      );
                                                      logFirebaseEvent(
                                                          'Row_custom_action');
                                                      _model.updatedLiikeCopy3 =
                                                          await actions
                                                              .myUpdateLiikeStruct(
                                                        widget.liike,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        false,
                                                        null,
                                                        sarjatIndex,
                                                        _model.updatedSarja,
                                                      );
                                                      logFirebaseEvent(
                                                          'Row_custom_action');
                                                      _model.updatedRutiiniCopy3 =
                                                          await actions
                                                              .myUpdateTreeniRutiiniStruct(
                                                        widget.treeniSessio!
                                                            .treeniRutiiniData,
                                                        null,
                                                        null,
                                                        widget
                                                            .treeniSessio!
                                                            .treeniRutiiniData
                                                            .liikkeet
                                                            ?.toList()
                                                            ?.toList(),
                                                        null,
                                                        null,
                                                        null,
                                                        false,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        null,
                                                        widget.liikeIndexInList,
                                                        _model
                                                            .updatedLiikeCopy3,
                                                        null,
                                                        functions
                                                            .emptyJsonList()
                                                            ?.toList(),
                                                        false,
                                                        false,
                                                      );
                                                      logFirebaseEvent(
                                                          'Row_backend_call');

                                                      final treeniSessiotUpdateData =
                                                          createTreeniSessiotRecordData(
                                                        treeniRutiiniData:
                                                            updateTreeniRutiiniStruct(
                                                          _model
                                                              .updatedRutiiniCopy3,
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      );
                                                      await widget.treeniSessio!
                                                          .reference
                                                          .update(
                                                              treeniSessiotUpdateData);

                                                      setState(() {});
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: 30.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    sarjatItem
                                                                            .doneDatetime !=
                                                                        null,
                                                                    false,
                                                                  ))
                                                                    Icon(
                                                                      Icons
                                                                          .done_rounded,
                                                                      color: Colors
                                                                          .black,
                                                                      size:
                                                                          20.0,
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'iconOnPageLoadAnimation2']!),
                                                                  Icon(
                                                                    Icons
                                                                        .check_box_outline_blank_rounded,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 24.0,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '0mhrww78' /* Tehty */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1.0,
                                        thickness: 1.0,
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!),
                              ),
                            ],
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'SESSIO_LIIKE_SARJAS_Row_g8xw87r2_ON_TAP');
                          logFirebaseEvent('Row_custom_action');
                          _model.updatedLiikeFromAddSarjaButton =
                              await actions.myUpdateLiikeStruct(
                            widget.liike,
                            null,
                            null,
                            null,
                            null,
                            false,
                            null,
                            null,
                            null,
                            null,
                            null,
                            true,
                            null,
                            null,
                            null,
                          );
                          logFirebaseEvent('Row_custom_action');
                          _model.updatedRutiiniAddSarjaButton =
                              await actions.myUpdateTreeniRutiiniStruct(
                            widget.treeniSessio!.treeniRutiiniData,
                            null,
                            null,
                            widget.treeniSessio!.treeniRutiiniData.liikkeet
                                ?.toList()
                                ?.toList(),
                            null,
                            null,
                            null,
                            false,
                            null,
                            null,
                            null,
                            null,
                            null,
                            widget.liikeIndexInList,
                            _model.updatedLiikeFromAddSarjaButton,
                            null,
                            functions.emptyJsonList()?.toList(),
                            false,
                            false,
                          );
                          logFirebaseEvent('Row_backend_call');

                          final treeniSessiotUpdateData =
                              createTreeniSessiotRecordData(
                            treeniRutiiniData: updateTreeniRutiiniStruct(
                              _model.updatedRutiiniAddSarjaButton,
                              clearUnsetFields: false,
                            ),
                          );
                          await widget.treeniSessio!.reference
                              .update(treeniSessiotUpdateData);

                          setState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 4.0, 0.0),
                              child: Icon(
                                Icons.add_circle_outline_rounded,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'ipp6f4rc' /* Lisää sarja */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      if (false)
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SESSIO_LIIKE_SARJAS_Row_skrd5wxm_ON_TAP');
                            logFirebaseEvent('Row_custom_action');
                            _model.updatedLiikeFromTehtyCheckBox =
                                await actions.myUpdateLiikeStruct(
                              widget.liike,
                              null,
                              null,
                              null,
                              null,
                              !widget.liike!.tehty!,
                              null,
                              null,
                              null,
                              null,
                              null,
                              null,
                              null,
                              null,
                              null,
                            );
                            logFirebaseEvent('Row_custom_action');
                            _model.updatedRutiiniTehtyCheckBox =
                                await actions.myUpdateTreeniRutiiniStruct(
                              widget.treeniSessio!.treeniRutiiniData,
                              null,
                              null,
                              widget.treeniSessio!.treeniRutiiniData.liikkeet
                                  ?.toList()
                                  ?.toList(),
                              null,
                              null,
                              null,
                              false,
                              null,
                              null,
                              null,
                              null,
                              null,
                              widget.liikeIndexInList,
                              _model.updatedLiikeFromTehtyCheckBox,
                              null,
                              functions.emptyJsonList()?.toList(),
                              false,
                              false,
                            );
                            logFirebaseEvent('Row_backend_call');

                            final treeniSessiotUpdateData =
                                createTreeniSessiotRecordData(
                              treeniRutiiniData: updateTreeniRutiiniStruct(
                                _model.updatedRutiiniTehtyCheckBox,
                                clearUnsetFields: false,
                              ),
                            );
                            await widget.treeniSessio!.reference
                                .update(treeniSessiotUpdateData);

                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'uwy0fdd7' /* Tehty */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Container(
                                width: 30.0,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    if (widget.liike?.tehty ?? true)
                                      Icon(
                                        Icons.done_rounded,
                                        color: Colors.black,
                                        size: 20.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'iconOnPageLoadAnimation3']!),
                                    Icon(
                                      Icons.check_box_outline_blank_rounded,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                  ],
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
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: true,
              tapBodyToCollapse: true,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: true,
            ),
          ),
        ),
      ),
    );
  }
}
