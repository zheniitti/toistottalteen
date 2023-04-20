import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/other_type_liike_fields/other_type_liike_fields_widget.dart';
import '/components/sarja_paino_textfield/sarja_paino_textfield_widget.dart';
import '/components/sarja_toistot_textfield/sarja_toistot_textfield_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sarjat_treenin_aikana_model.dart';
export 'sarjat_treenin_aikana_model.dart';

class SarjatTreeninAikanaWidget extends StatefulWidget {
  const SarjatTreeninAikanaWidget({
    Key? key,
    this.liike,
    this.liikeIndexInList,
    this.treeniSessio,
  }) : super(key: key);

  final LiikeStruct? liike;
  final int? liikeIndexInList;
  final TreeniSessiotRecord? treeniSessio;

  @override
  _SarjatTreeninAikanaWidgetState createState() =>
      _SarjatTreeninAikanaWidgetState();
}

class _SarjatTreeninAikanaWidgetState extends State<SarjatTreeninAikanaWidget>
    with TickerProviderStateMixin {
  late SarjatTreeninAikanaModel _model;

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
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
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
    _model = createModel(context, () => SarjatTreeninAikanaModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Builder(
          builder: (context) {
            final sarjat = widget.liike?.sarjat?.toList()?.toList() ?? [];
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(sarjat.length, (sarjatIndex) {
                final sarjatItem = sarjat[sarjatIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 6.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: sarjatItem.doneDatetime != null
                                            ? FlutterFlowTheme.of(context)
                                                .inactiveWidgetBackground
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 3.0, 0.0, 3.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          children: [
                                            if (valueOrDefault<bool>(
                                              widget.liike?.isOtherExerciseType,
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
                                                    'Keymwc_${sarjatItem.createdTime!.toString()}',
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
                                              widget.liike?.isOtherExerciseType,
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
                                                          'pcie3aom' /* Paino (kg) */,
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
                                                              'Key9yx_${sarjatIndex}_of_${sarjat.length}'),
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
                                                          'i1hh5xau' /* Toistot */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                      ),
                                                      Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            SarjaToistotTextfieldWidget(
                                                          key: Key(
                                                              'Keyvir_${sarjatIndex}_of_${sarjat.length}'),
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
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
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
                                                                  '6wdceyvb' /* .
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
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                      if (!widget.liike!.tehty!)
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
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'SARJAT_TREENIN_AIKANA_Icon_41jsa7wi_ON_T');
                                                                logFirebaseEvent(
                                                                    'Icon_custom_action');
                                                                _model.updatedLiikeCopy2 =
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

                                                                setState(() {});
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
                                                        0.0, 12.0, 6.0, 0.0),
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
                                                        'SARJAT_TREENIN_AIKANA_Row_al58ucjz_ON_TA');
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
                                                      _model.updatedLiikeCopy3,
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
                                                        clearUnsetFields: false,
                                                      ),
                                                    );
                                                    await widget
                                                        .treeniSessio!.reference
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
                                                                      0.0, 0.0),
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
                                                                    size: 20.0,
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
                                                              'hx98f9iz' /* Tehty */,
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
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        indent: 12.0,
                        endIndent: 12.0,
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SARJAT_TREENIN_AIKANA_Row_doneif38_ON_TA');
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

                  final treeniSessiotUpdateData = createTreeniSessiotRecordData(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'wtzx9j32' /* Lisää sarja */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              if (false)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'SARJAT_TREENIN_AIKANA_Row_0bqlm5pv_ON_TA');
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
                          'zfrwzd38' /* Tehty */,
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
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation3']!),
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
    );
  }
}
