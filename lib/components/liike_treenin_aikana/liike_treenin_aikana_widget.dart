import '/auth/auth_util.dart';
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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'liike_treenin_aikana_model.dart';
export 'liike_treenin_aikana_model.dart';

class LiikeTreeninAikanaWidget extends StatefulWidget {
  const LiikeTreeninAikanaWidget({
    Key? key,
    this.liike,
    this.treeniSessio,
    this.liikeIndexInList,
  }) : super(key: key);

  final LiikeStruct? liike;
  final TreeniSessiotRecord? treeniSessio;
  final int? liikeIndexInList;

  @override
  _LiikeTreeninAikanaWidgetState createState() =>
      _LiikeTreeninAikanaWidgetState();
}

class _LiikeTreeninAikanaWidgetState extends State<LiikeTreeninAikanaWidget>
    with TickerProviderStateMixin {
  late LiikeTreeninAikanaModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    _model = createModel(context, () => LiikeTreeninAikanaModel());

    _model.textController1 ??= TextEditingController(text: widget.liike?.nimi);
    _model.textController2 ??=
        TextEditingController(text: widget.liike?.kommentti);

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

    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 600.0,
        ),
        decoration: BoxDecoration(
          color:
              functions.isAllSarjaDone(widget.liike?.sarjat?.toList()?.toList())
                  ? FlutterFlowTheme.of(context).inactiveWidgetBackground
                  : FlutterFlowTheme.of(context).activeWidgetBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Color(0xFF797979),
            width: 1.0,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController1,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController1',
                            Duration(milliseconds: 1000),
                            () async {
                              logFirebaseEvent(
                                  'LIIKE_TREENIN_AIKANA_TextField_fgw8ho34_');
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedLiike =
                                  await actions.myUpdateLiikeStruct(
                                widget.liike,
                                null,
                                _model.textController1.text,
                                _model.textController2.text,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                false,
                                null,
                                null,
                                null,
                              );
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedRutiini =
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
                                _model.updatedLiike,
                                null,
                                FFAppState().kopioidutLiikkeet.toList(),
                                false,
                                false,
                              );
                              logFirebaseEvent('TextField_backend_call');

                              final treeniSessiotUpdateData =
                                  createTreeniSessiotRecordData(
                                treeniRutiiniData: updateTreeniRutiiniStruct(
                                  _model.updatedRutiini,
                                  clearUnsetFields: false,
                                ),
                              );
                              await widget.treeniSessio!.reference
                                  .update(treeniSessiotUpdateData);

                              setState(() {});
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: FFLocalizations.of(context).getText(
                              '29oo50bm' /* Liikkeen nimi */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 18.0,
                                      lineHeight: 1.0,
                                    ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Outfit',
                                    lineHeight: 1.0,
                                  ),
                          textAlign: TextAlign.start,
                          maxLines: 5,
                          minLines: 1,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                      if (!widget.liike!.tehty! ||
                          (widget.liike?.kommentti != null &&
                              widget.liike?.kommentti != '') ||
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: TextFormField(
                            controller: _model.textController2,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController2',
                              Duration(milliseconds: 500),
                              () async {
                                logFirebaseEvent(
                                    'LIIKE_TREENIN_AIKANA_TextField_rwco0ti2_');
                                logFirebaseEvent('TextField_custom_action');
                                _model.updatedLiikeCopy =
                                    await actions.myUpdateLiikeStruct(
                                  widget.liike,
                                  null,
                                  _model.textController1.text,
                                  _model.textController2.text,
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
                                );
                                logFirebaseEvent('TextField_custom_action');
                                _model.updatedRutiiniCopy =
                                    await actions.myUpdateTreeniRutiiniStruct(
                                  widget.treeniSessio!.treeniRutiiniData,
                                  null,
                                  null,
                                  widget
                                      .treeniSessio!.treeniRutiiniData.liikkeet
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
                                  _model.updatedLiike,
                                  null,
                                  FFAppState().kopioidutLiikkeet.toList(),
                                  null,
                                  null,
                                );
                                logFirebaseEvent('TextField_backend_call');

                                final treeniSessiotUpdateData =
                                    createTreeniSessiotRecordData(
                                  treeniRutiiniData: updateTreeniRutiiniStruct(
                                    _model.updatedRutiini,
                                    clearUnsetFields: false,
                                  ),
                                );
                                await widget.treeniSessio!.reference
                                    .update(treeniSessiotUpdateData);

                                setState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: FFLocalizations.of(context).getText(
                                'l7w663ju' /* Kommentti (vapaaehtoinen) */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                    lineHeight: 1.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 2.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.0,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 20,
                            minLines: 1,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'LIIKE_TREENIN_AIKANA_Icon_more_ON_TAP');
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
            Divider(
              height: 1.0,
              thickness: 1.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final sarjat =
                          widget.liike?.sarjat?.toList()?.toList() ?? [];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
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
                                                      'Key5x4_${sarjatItem.createdTime!.toString()}',
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
                                                            'u1j0c71n' /* Toistot */,
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
                                                                'Keyfrz_${sarjatIndex}_of_${sarjat.length}'),
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
                                                            '1zpp3lp9' /* Paino (kg) */,
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
                                                                'Key3ik_${sarjatIndex}_of_${sarjat.length}'),
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
                                                                    'hcx7u96d' /* .
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
                                                                      'LIIKE_TREENIN_AIKANA_Icon_1ir2k78h_ON_TA');
                                                                  logFirebaseEvent(
                                                                      'Icon_custom_action');
                                                                  _model.updatedLiikeCopy2 =
                                                                      await actions
                                                                          .myUpdateLiikeStruct(
                                                                    widget
                                                                        .liike,
                                                                    null,
                                                                    _model
                                                                        .textController1
                                                                        .text,
                                                                    _model
                                                                        .textController2
                                                                        .text,
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
                                                          'LIIKE_TREENIN_AIKANA_Row_h2aw77f4_ON_TAP');
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
                                                                '8zdi9oyj' /* Tehty */,
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
                                    'containerOnPageLoadAnimation2']!),
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
                              'LIIKE_TREENIN_AIKANA_Row_5f3q34g1_ON_TAP');
                          logFirebaseEvent('Row_custom_action');
                          _model.updatedLiikeFromAddSarjaButton =
                              await actions.myUpdateLiikeStruct(
                            widget.liike,
                            null,
                            _model.textController1.text,
                            _model.textController2.text,
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
                                'dxvry4te' /* Lisää sarja */,
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
                                'LIIKE_TREENIN_AIKANA_Row_55r3gb8v_ON_TAP');
                            logFirebaseEvent('Row_custom_action');
                            _model.updatedLiikeFromTehtyCheckBox =
                                await actions.myUpdateLiikeStruct(
                              widget.liike,
                              null,
                              _model.textController1.text,
                              _model.textController2.text,
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
                                  'rrk6y01u' /* Tehty */,
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
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
  }
}
