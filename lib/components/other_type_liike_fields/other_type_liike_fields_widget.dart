import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'other_type_liike_fields_model.dart';
export 'other_type_liike_fields_model.dart';

class OtherTypeLiikeFieldsWidget extends StatefulWidget {
  const OtherTypeLiikeFieldsWidget({
    Key? key,
    this.liike,
    this.sarja,
    this.liikeIndex,
    this.sarjaIndex,
    this.sessioDoc,
  }) : super(key: key);

  final LiikeStruct? liike;
  final SarjaStruct? sarja;
  final int? liikeIndex;
  final int? sarjaIndex;
  final TreeniSessiotRecord? sessioDoc;

  @override
  _OtherTypeLiikeFieldsWidgetState createState() =>
      _OtherTypeLiikeFieldsWidgetState();
}

class _OtherTypeLiikeFieldsWidgetState extends State<OtherTypeLiikeFieldsWidget>
    with TickerProviderStateMixin {
  late OtherTypeLiikeFieldsModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
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
    _model = createModel(context, () => OtherTypeLiikeFieldsModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
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

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12.0,
            runSpacing: 14.0,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              Wrap(
                spacing: 12.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '45p8jvgv' /* Tunnit */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 12.0,
                            ),
                      ),
                      Container(
                        width: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextFormField(
                          controller: _model.textController1,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController1',
                            Duration(milliseconds: 2000),
                            () async {
                              logFirebaseEvent(
                                  'OTHER_TYPE_LIIKE_FIELDS_TextField_rq7bvn');
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedSarja = await actions.myUpdateSarja(
                                widget.sarja!,
                                true,
                                null,
                                null,
                                null,
                                functions.toSeconds(
                                    int.tryParse(_model.textController1.text),
                                    int.tryParse(_model.textController2.text),
                                    double.tryParse(
                                        _model.textController3.text)),
                                double.tryParse(_model.textController4.text),
                                null,
                                false,
                              );
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedLiike =
                                  await actions.myUpdateLiikeStruct(
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
                                widget.sarjaIndex,
                                _model.updatedSarja,
                              );
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedRutiini =
                                  await actions.myUpdateTreeniRutiiniStruct(
                                widget.sessioDoc!.treeniRutiiniData,
                                null,
                                null,
                                widget.sessioDoc!.treeniRutiiniData.liikkeet
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
                                widget.liikeIndex,
                                _model.updatedLiike,
                                null,
                                functions.emptyJsonList()?.toList(),
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
                              await widget.sessioDoc!.reference
                                  .update(treeniSessiotUpdateData);

                              setState(() {});
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: null,
                            hintText: functions
                                .remainingHours(widget.sarja?.kestoSekunteina)
                                .toString(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).deleteRed,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).deleteRed,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .inactiveWidgetBackground,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'hul5vo4m' /* Minuutit */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 12.0,
                            ),
                      ),
                      Container(
                        width: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextFormField(
                          controller: _model.textController2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController2',
                            Duration(milliseconds: 2000),
                            () async {
                              logFirebaseEvent(
                                  'OTHER_TYPE_LIIKE_FIELDS_TextField_jqi8oa');
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedSarjaCopy =
                                  await actions.myUpdateSarja(
                                widget.sarja!,
                                true,
                                null,
                                null,
                                null,
                                functions.toSeconds(
                                    int.tryParse(_model.textController1.text),
                                    int.tryParse(_model.textController2.text),
                                    double.tryParse(
                                        _model.textController3.text)),
                                double.tryParse(_model.textController4.text),
                                null,
                                false,
                              );
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedLiikeCopy =
                                  await actions.myUpdateLiikeStruct(
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
                                widget.sarjaIndex,
                                _model.updatedSarja,
                              );
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedRutiiniCopy =
                                  await actions.myUpdateTreeniRutiiniStruct(
                                widget.sessioDoc!.treeniRutiiniData,
                                null,
                                null,
                                widget.sessioDoc!.treeniRutiiniData.liikkeet
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
                                widget.liikeIndex,
                                _model.updatedLiike,
                                null,
                                functions.emptyJsonList()?.toList(),
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
                              await widget.sessioDoc!.reference
                                  .update(treeniSessiotUpdateData);

                              setState(() {});
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: null,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                ),
                            hintText: functions
                                .remainingMinutes(widget.sarja?.kestoSekunteina)
                                .toString(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).deleteRed,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).deleteRed,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .inactiveWidgetBackground,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: _model.textController2Validator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('^([1-9]|[1-5][0-9])\$'))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'e4mivh1l' /* sekunnit */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 12.0,
                            ),
                      ),
                      Container(
                        width: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextFormField(
                          controller: _model.textController3,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController3',
                            Duration(milliseconds: 2000),
                            () async {
                              logFirebaseEvent(
                                  'OTHER_TYPE_LIIKE_FIELDS_TextField_yddv3z');
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedSarjaCopy2 =
                                  await actions.myUpdateSarja(
                                widget.sarja!,
                                true,
                                null,
                                null,
                                null,
                                functions.toSeconds(
                                    int.tryParse(_model.textController1.text),
                                    int.tryParse(_model.textController2.text),
                                    double.tryParse(
                                        _model.textController3.text)),
                                double.tryParse(_model.textController4.text),
                                null,
                                false,
                              );
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedLiikeCopy2 =
                                  await actions.myUpdateLiikeStruct(
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
                                widget.sarjaIndex,
                                _model.updatedSarja,
                              );
                              logFirebaseEvent('TextField_custom_action');
                              _model.updatedRutiiniCopy2 =
                                  await actions.myUpdateTreeniRutiiniStruct(
                                widget.sessioDoc!.treeniRutiiniData,
                                null,
                                null,
                                widget.sessioDoc!.treeniRutiiniData.liikkeet
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
                                widget.liikeIndex,
                                _model.updatedLiike,
                                null,
                                functions.emptyJsonList()?.toList(),
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
                              await widget.sessioDoc!.reference
                                  .update(treeniSessiotUpdateData);

                              setState(() {});
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: null,
                            hintText: functions
                                .remainingSeconds(widget.sarja?.kestoSekunteina)
                                .toString(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).deleteRed,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).deleteRed,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .inactiveWidgetBackground,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: _model.textController3Validator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                '^(?:[0-9]|[1-5][0-9])(?:\\.\\d{1,3})?\$'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'f6lmo02d' /* Matka (metreinä) */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Container(
                    width: 200.0,
                    constraints: BoxConstraints(
                      maxWidth: 330.0,
                    ),
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _model.textController4,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController4',
                        Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'OTHER_TYPE_LIIKE_FIELDS_TextField_kzqfzx');
                          logFirebaseEvent('TextField_custom_action');
                          _model.updatedSarjaCopy3 =
                              await actions.myUpdateSarja(
                            widget.sarja!,
                            true,
                            null,
                            null,
                            null,
                            functions.toSeconds(
                                int.tryParse(_model.textController1.text),
                                int.tryParse(_model.textController2.text),
                                double.tryParse(_model.textController3.text)),
                            double.tryParse(_model.textController4.text),
                            null,
                            false,
                          );
                          logFirebaseEvent('TextField_custom_action');
                          _model.updatedLiikeCopy3 =
                              await actions.myUpdateLiikeStruct(
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
                            widget.sarjaIndex,
                            _model.updatedSarja,
                          );
                          logFirebaseEvent('TextField_custom_action');
                          _model.updatedRutiiniCopy3 =
                              await actions.myUpdateTreeniRutiiniStruct(
                            widget.sessioDoc!.treeniRutiiniData,
                            null,
                            null,
                            widget.sessioDoc!.treeniRutiiniData.liikkeet
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
                            widget.liikeIndex,
                            _model.updatedLiike,
                            null,
                            functions.emptyJsonList()?.toList(),
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
                          await widget.sessioDoc!.reference
                              .update(treeniSessiotUpdateData);

                          setState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: null,
                        hintText: widget.sarja?.matkaMetreina?.toString(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).deleteRed,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).deleteRed,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context)
                            .inactiveWidgetBackground,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                              ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      validator:
                          _model.textController4Validator.asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
          .animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!)
          .animateOnActionTrigger(
            animationsMap['columnOnActionTriggerAnimation']!,
          ),
    );
  }
}
