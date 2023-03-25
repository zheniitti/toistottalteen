import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiinin_sarjat_toistot_kesto_matka_model.dart';
export 'rutiinin_sarjat_toistot_kesto_matka_model.dart';

class RutiininSarjatToistotKestoMatkaWidget extends StatefulWidget {
  const RutiininSarjatToistotKestoMatkaWidget({
    Key? key,
    this.rutiini,
    required this.liikeIndex,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;
  final int liikeIndex;

  @override
  _RutiininSarjatToistotKestoMatkaWidgetState createState() =>
      _RutiininSarjatToistotKestoMatkaWidgetState();
}

class _RutiininSarjatToistotKestoMatkaWidgetState
    extends State<RutiininSarjatToistotKestoMatkaWidget>
    with TickerProviderStateMixin {
  late RutiininSarjatToistotKestoMatkaModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 300.ms,
          begin: 1.0,
          end: 0.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'wrapOnPageLoadAnimation': AnimationInfo(
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
    'wrapOnActionTriggerAnimation': AnimationInfo(
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
    _model = createModel(context, () => RutiininSarjatToistotKestoMatkaModel());

    _model.textController1 ??= TextEditingController(
        text: widget.rutiini?.liikkeet
            ?.toList()?[widget.liikeIndex]
            ?.sarjaMaara
            ?.toString());
    _model.textController2 ??= TextEditingController(
        text: widget.rutiini?.liikkeet
            ?.toList()?[widget.liikeIndex]
            ?.toistoMaara
            ?.toString());
    _model.textController3 ??= TextEditingController(
        text: widget.rutiini?.liikkeet
            ?.toList()?[widget.liikeIndex]
            ?.aloitusPainoKg
            ?.toString());
    _model.textController4 ??= TextEditingController(
        text: functions
            .remainingHours(widget.rutiini?.liikkeet
                ?.toList()?[widget.liikeIndex]
                ?.kestoSekunteina)
            .toString());
    _model.textController5 ??= TextEditingController(
        text: functions
            .remainingMinutes(widget.rutiini?.liikkeet
                ?.toList()?[widget.liikeIndex]
                ?.kestoSekunteina)
            .toString());
    _model.textController6 ??= TextEditingController(
        text: functions
            .remainingSeconds(widget.rutiini?.liikkeet
                ?.toList()?[widget.liikeIndex]
                ?.kestoSekunteina)
            .toString());
    _model.textController7 ??= TextEditingController(
        text: widget.rutiini?.liikkeet
            ?.toList()?[widget.liikeIndex]
            ?.matkaMetri
            ?.toString());
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

    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.86,
        constraints: BoxConstraints(
          maxWidth: 840.0,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          gradient: LinearGradient(
            colors: [Color(0xFFACC2DF), Color(0xFFB1B1B1)],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Text(
                  widget.rutiini!.liikkeet!.toList()[widget.liikeIndex!].nimi!,
                  style: FlutterFlowTheme.of(context).subtitle2,
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Stack(
                alignment: AlignmentDirectional(1.0, 0.0),
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'bc5re53k' /* Saliliike */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                        Switch(
                          value: _model.switchValue ??= false,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue = newValue!);

                            if (!newValue!) {
                              logFirebaseEvent(
                                  'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Swit');
                              if (!true) {
                                logFirebaseEvent('Switch_widget_animation');
                                if (animationsMap[
                                        'columnOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'columnOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              }
                            }
                          },
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).primaryColor,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'puhl6gls' /* Muu liike */,
                              ),
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.help_outline_rounded,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!_model.switchValue!)
                      Wrap(
                        spacing: 12.0,
                        runSpacing: 18.0,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Visibility(
                            visible: !_model.switchValue!,
                            child: Container(
                              width: 100.0,
                              constraints: BoxConstraints(
                                maxWidth: 334.0,
                              ),
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _model.textController1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController1',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    logFirebaseEvent(
                                        'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                    logFirebaseEvent('TextField_custom_action');
                                    await actions.updateUserDocLiikeAtIndex(
                                      widget.liikeIndex!,
                                      widget.rutiini,
                                      widget.rutiini?.liikkeet
                                          ?.toList()?[widget.liikeIndex]
                                          ?.nimi,
                                      null,
                                      int.tryParse(_model.textController2.text),
                                      int.tryParse(_model.textController1.text),
                                      double.tryParse(
                                          _model.textController3.text),
                                      _model.switchValue,
                                      null,
                                      null,
                                      double.tryParse(
                                          _model.textController7.text),
                                      functions.toSeconds(
                                          int.tryParse(
                                              _model.textController4.text),
                                          int.tryParse(
                                              _model.textController5.text),
                                          double.tryParse(
                                              _model.textController6.text)),
                                    );
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'jjypk83p' /* Sarjoja */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'qq0ca3om' /* 0 */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 20.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .deleteRed,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .deleteRed,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 20.0,
                                    ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !_model.switchValue!,
                            child: Container(
                              width: 100.0,
                              constraints: BoxConstraints(
                                maxWidth: 334.0,
                              ),
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _model.textController2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController2',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    logFirebaseEvent(
                                        'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                    logFirebaseEvent('TextField_custom_action');
                                    await actions.updateUserDocLiikeAtIndex(
                                      widget.liikeIndex!,
                                      widget.rutiini,
                                      widget.rutiini?.liikkeet
                                          ?.toList()?[widget.liikeIndex]
                                          ?.nimi,
                                      null,
                                      int.tryParse(_model.textController2.text),
                                      int.tryParse(_model.textController1.text),
                                      double.tryParse(
                                          _model.textController3.text),
                                      _model.switchValue,
                                      null,
                                      null,
                                      double.tryParse(
                                          _model.textController7.text),
                                      functions.toSeconds(
                                          int.tryParse(
                                              _model.textController4.text),
                                          int.tryParse(
                                              _model.textController5.text),
                                          double.tryParse(
                                              _model.textController6.text)),
                                    );
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'lguwu79m' /* Toistoja */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'i4zrk6hf' /* 0 */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 20.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .deleteRed,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .deleteRed,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 20.0,
                                    ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !_model.switchValue!,
                            child: Container(
                              width: 100.0,
                              constraints: BoxConstraints(
                                maxWidth: 334.0,
                              ),
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _model.textController3,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController3',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    logFirebaseEvent(
                                        'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                    logFirebaseEvent('TextField_custom_action');
                                    await actions.updateUserDocLiikeAtIndex(
                                      widget.liikeIndex!,
                                      widget.rutiini,
                                      widget.rutiini?.liikkeet
                                          ?.toList()?[widget.liikeIndex]
                                          ?.nimi,
                                      null,
                                      int.tryParse(_model.textController2.text),
                                      int.tryParse(_model.textController1.text),
                                      double.tryParse(
                                          _model.textController3.text),
                                      _model.switchValue,
                                      null,
                                      null,
                                      double.tryParse(
                                          _model.textController7.text),
                                      functions.toSeconds(
                                          int.tryParse(
                                              _model.textController4.text),
                                          int.tryParse(
                                              _model.textController5.text),
                                          double.tryParse(
                                              _model.textController6.text)),
                                    );
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'o3f0pnq1' /* Paino */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '7x1niggu' /* 0 */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 20.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .deleteRed,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .deleteRed,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 20.0,
                                    ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: _model.textController3Validator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                          .animateOnPageLoad(
                              animationsMap['wrapOnPageLoadAnimation']!)
                          .animateOnActionTrigger(
                            animationsMap['wrapOnActionTriggerAnimation']!,
                          ),
                    if (_model.switchValue ?? true)
                      Container(
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: TextFormField(
                                        controller: _model.textController4,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController4',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                            logFirebaseEvent(
                                                'TextField_custom_action');
                                            await actions
                                                .updateUserDocLiikeAtIndex(
                                              widget.liikeIndex!,
                                              widget.rutiini,
                                              widget.rutiini?.liikkeet
                                                  ?.toList()?[widget.liikeIndex]
                                                  ?.nimi,
                                              null,
                                              int.tryParse(
                                                  _model.textController2.text),
                                              int.tryParse(
                                                  _model.textController1.text),
                                              double.tryParse(
                                                  _model.textController3.text),
                                              _model.switchValue,
                                              null,
                                              null,
                                              double.tryParse(
                                                  _model.textController7.text),
                                              functions.toSeconds(
                                                  int.tryParse(_model
                                                      .textController4.text),
                                                  int.tryParse(_model
                                                      .textController5.text),
                                                  double.tryParse(_model
                                                      .textController6.text)),
                                            );
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'c41dh2o7' /* Tunnit */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 20.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '0buphc96' /* 0 */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 20.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .deleteRed,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .deleteRed,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20.0,
                                            ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .textController4Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: TextFormField(
                                        controller: _model.textController5,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController5',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                            logFirebaseEvent(
                                                'TextField_custom_action');
                                            await actions
                                                .updateUserDocLiikeAtIndex(
                                              widget.liikeIndex!,
                                              widget.rutiini,
                                              widget.rutiini?.liikkeet
                                                  ?.toList()?[widget.liikeIndex]
                                                  ?.nimi,
                                              null,
                                              int.tryParse(
                                                  _model.textController2.text),
                                              int.tryParse(
                                                  _model.textController1.text),
                                              double.tryParse(
                                                  _model.textController3.text),
                                              _model.switchValue,
                                              null,
                                              null,
                                              double.tryParse(
                                                  _model.textController7.text),
                                              functions.toSeconds(
                                                  int.tryParse(_model
                                                      .textController4.text),
                                                  int.tryParse(_model
                                                      .textController5.text),
                                                  double.tryParse(_model
                                                      .textController6.text)),
                                            );
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'igqi4xj9' /* Minuutit */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 20.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'ijhiym6x' /* 0 */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 20.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .deleteRed,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .deleteRed,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20.0,
                                            ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .textController5Validator
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: TextFormField(
                                        controller: _model.textController6,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController6',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                            logFirebaseEvent(
                                                'TextField_custom_action');
                                            await actions
                                                .updateUserDocLiikeAtIndex(
                                              widget.liikeIndex!,
                                              widget.rutiini,
                                              widget.rutiini?.liikkeet
                                                  ?.toList()?[widget.liikeIndex]
                                                  ?.nimi,
                                              null,
                                              int.tryParse(
                                                  _model.textController2.text),
                                              int.tryParse(
                                                  _model.textController1.text),
                                              double.tryParse(
                                                  _model.textController3.text),
                                              _model.switchValue,
                                              null,
                                              null,
                                              double.tryParse(
                                                  _model.textController7.text),
                                              functions.toSeconds(
                                                  int.tryParse(_model
                                                      .textController4.text),
                                                  int.tryParse(_model
                                                      .textController5.text),
                                                  double.tryParse(_model
                                                      .textController6.text)),
                                            );
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'ujvljcrd' /* Sekunnit */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 20.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'wjt4ylbn' /* 0 */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 20.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .deleteRed,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .deleteRed,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 2.0, 12.0, 2.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20.0,
                                            ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .textController6Validator
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
                                    controller: _model.textController7,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController7',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        logFirebaseEvent(
                                            'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                        logFirebaseEvent(
                                            'TextField_custom_action');
                                        await actions.updateUserDocLiikeAtIndex(
                                          widget.liikeIndex!,
                                          widget.rutiini,
                                          widget.rutiini?.liikkeet
                                              ?.toList()?[widget.liikeIndex]
                                              ?.nimi,
                                          null,
                                          int.tryParse(
                                              _model.textController2.text),
                                          int.tryParse(
                                              _model.textController1.text),
                                          double.tryParse(
                                              _model.textController3.text),
                                          _model.switchValue,
                                          null,
                                          null,
                                          double.tryParse(
                                              _model.textController7.text),
                                          functions.toSeconds(
                                              int.tryParse(
                                                  _model.textController4.text),
                                              int.tryParse(
                                                  _model.textController5.text),
                                              double.tryParse(
                                                  _model.textController6.text)),
                                        );
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                      logFirebaseEvent(
                                          'TextField_custom_action');
                                      await actions.updateUserDocLiikeAtIndex(
                                        widget.liikeIndex!,
                                        widget.rutiini,
                                        widget.rutiini?.liikkeet
                                            ?.toList()?[widget.liikeIndex]
                                            ?.nimi,
                                        null,
                                        valueOrDefault<int>(
                                          int.tryParse(
                                              _model.textController2.text),
                                          0,
                                        ),
                                        valueOrDefault<int>(
                                          int.tryParse(
                                              _model.textController1.text),
                                          0,
                                        ),
                                        valueOrDefault<double>(
                                          double.tryParse(
                                              _model.textController3.text),
                                          0.0,
                                        ),
                                        _model.switchValue,
                                        null,
                                        null,
                                        valueOrDefault<double>(
                                          double.tryParse(
                                              _model.textController7.text),
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          functions.toSeconds(
                                              valueOrDefault<int>(
                                                int.tryParse(_model
                                                    .textController4.text),
                                                0,
                                              ),
                                              valueOrDefault<int>(
                                                int.tryParse(_model
                                                    .textController5.text),
                                                0,
                                              ),
                                              valueOrDefault<double>(
                                                double.tryParse(_model
                                                    .textController6.text),
                                                0.0,
                                              )),
                                          0.0,
                                        ),
                                      );
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'djvuk9g5' /* Tavoite matka (metreinä) */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 20.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '1hygkonx' /* 0 m */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 20.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .deleteRed,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .deleteRed,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 2.0, 12.0, 2.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 20.0,
                                        ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    validator: _model.textController7Validator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                          '(-?)(0|([1-9][0-9]*))(\\\\.[0-9]+)?\$'))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                            .animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation']!)
                            .animateOnActionTrigger(
                              animationsMap['columnOnActionTriggerAnimation']!,
                            ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Wrap(
                  spacing: 22.0,
                  runSpacing: 12.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '8brnuzhc' /* Tyhjennä */,
                        ),
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_VALM');
                        logFirebaseEvent('Button_widget_animation');
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          await animationsMap[
                                  'containerOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                        logFirebaseEvent('Button_custom_action');
                        await actions.updateUserDocLiikeAtIndex(
                          widget.liikeIndex!,
                          widget.rutiini,
                          widget.rutiini?.liikkeet
                              ?.toList()?[widget.liikeIndex]
                              ?.nimi,
                          null,
                          int.tryParse(_model.textController2.text),
                          int.tryParse(_model.textController1.text),
                          double.tryParse(_model.textController3.text),
                          _model.switchValue,
                          null,
                          null,
                          double.tryParse(_model.textController7.text),
                          functions.toSeconds(
                              int.tryParse(_model.textController4.text),
                              int.tryParse(_model.textController5.text),
                              double.tryParse(_model.textController6.text)),
                        );
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().update(() {
                          FFAppState().valittuMuokattavaRutiini = null;
                          FFAppState().valittuMuokattavaLiikeIndex = -1;
                        });
                      },
                      text: FFLocalizations.of(context).getText(
                        'tgyswa0r' /* Valmis */,
                      ),
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
