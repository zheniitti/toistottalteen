import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
  }) : super(key: key);

  final LiikeStruct? liike;
  final SarjaStruct? sarja;

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

    _model.textController1 ??= TextEditingController(
        text:
            functions.remainingHours(widget.sarja?.kestoSekunteina).toString());
    _model.textController2 ??= TextEditingController(
        text: functions
            .remainingMinutes(widget.sarja?.kestoSekunteina)
            .toString());
    _model.textController3 ??= TextEditingController(
        text: functions
            .remainingSeconds(widget.sarja?.kestoSekunteina)
            .toString());
    _model.textController4 ??=
        TextEditingController(text: widget.sarja?.matkaMetreina?.toString());
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

    return Visibility(
      visible: valueOrDefault<bool>(
        widget.liike?.isOtherExerciseType,
        false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
        child: Container(
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
                      Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextFormField(
                          controller: _model.textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: FFLocalizations.of(context).getText(
                              'qzi0xoig' /* Tunnit */,
                            ),
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                    ),
                            hintText: FFLocalizations.of(context).getText(
                              '0ry7n4gd' /* 0 */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                    ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                          ),
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                              ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextFormField(
                          controller: _model.textController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: FFLocalizations.of(context).getText(
                              'qc0cirns' /* Minuutit */,
                            ),
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                    ),
                            hintText: FFLocalizations.of(context).getText(
                              'olh9qolp' /* 0 */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                    ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                          ),
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                              ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: _model.textController2Validator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[1-5][0-9]'))
                          ],
                        ),
                      ),
                      Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextFormField(
                          controller: _model.textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: FFLocalizations.of(context).getText(
                              'zcwbr62z' /* Sekunnit */,
                            ),
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                    ),
                            hintText: FFLocalizations.of(context).getText(
                              'm6zgwhps' /* 0 */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                    ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                          ),
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
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
                  Container(
                    width: 334.0,
                    constraints: BoxConstraints(
                      maxWidth: 330.0,
                    ),
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _model.textController4,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: FFLocalizations.of(context).getText(
                          'emfp4ohz' /* matka (metreinä) */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                            ),
                        hintText: FFLocalizations.of(context).getText(
                          'tnb4m9hm' /* 0.0 */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 20.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                      ),
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Outfit',
                            fontSize: 20.0,
                          ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      validator:
                          _model.textController4Validator.asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('(-?)(0|([1-9][0-9]*))(\\\\.[0-9]+)?\$'))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
              .animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!)
              .animateOnActionTrigger(
                animationsMap['columnOnActionTriggerAnimation']!,
              ),
        ),
      ),
    );
  }
}
