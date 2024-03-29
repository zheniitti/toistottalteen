import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
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
    this.liikeIndex,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;
  final int? liikeIndex;

  @override
  _RutiininSarjatToistotKestoMatkaWidgetState createState() =>
      _RutiininSarjatToistotKestoMatkaWidgetState();
}

class _RutiininSarjatToistotKestoMatkaWidgetState
    extends State<RutiininSarjatToistotKestoMatkaWidget>
    with TickerProviderStateMixin {
  late RutiininSarjatToistotKestoMatkaModel _model;

  final animationsMap = {
    'blurOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
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
          begin: Offset(1.0, 1.0),
          end: Offset(0.0, 0.0),
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
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
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
          begin: Offset(1.0, 1.0),
          end: Offset(0.0, 0.0),
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
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
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
          begin: Offset(1.0, 1.0),
          end: Offset(0.0, 0.0),
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

    _model.textFieldSarjojoaController ??= TextEditingController();
    _model.textFieldTOistojaController ??= TextEditingController();
    _model.textFieldPainoController ??= TextEditingController();
    _model.textFieldTunnitController ??= TextEditingController();
    _model.textFieldMinuutitController ??= TextEditingController();
    _model.textFieldSekunnitController ??= TextEditingController();
    _model.textFieldTavoiteMatkaController ??= TextEditingController();
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Cont');
                  logFirebaseEvent('Container_bottom_sheet');
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    26.0, 8.0, 26.0, 8.0),
                                            child: Text(
                                              widget.rutiini!.liikkeet!
                                                  .toList()[widget.liikeIndex!]
                                                  .nimi!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          if (false)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Icon');
                                                  logFirebaseEvent(
                                                      'Icon_bottom_sheet');
                                                  Navigator.pop(context);
                                                  logFirebaseEvent(
                                                      'Icon_update_app_state');
                                                  FFAppState()
                                                          .valittuMuokattavaRutiini =
                                                      null;
                                                  FFAppState()
                                                      .valittuMuokattavaLiikeIndex = -1;
                                                },
                                                child: Icon(
                                                  Icons.cancel_rounded,
                                                  color: Colors.black,
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
                                  thickness: 1.0,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'uldbvwai' /* Saliliike */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                          Switch(
                                            value: _model.switchValue ??= widget
                                                .rutiini!.liikkeet!
                                                .toList()[widget.liikeIndex!]
                                                .isOtherExerciseType!,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .switchValue = newValue!);
                                              if (newValue!) {
                                                logFirebaseEvent(
                                                    'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Swit');
                                                logFirebaseEvent(
                                                    'Switch_clear_text_fields');
                                                setState(() {
                                                  _model
                                                      .textFieldSarjojoaController
                                                      ?.clear();
                                                  _model
                                                      .textFieldTOistojaController
                                                      ?.clear();
                                                  _model
                                                      .textFieldPainoController
                                                      ?.clear();
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Swit');
                                                if (true) {
                                                  logFirebaseEvent(
                                                      'Switch_clear_text_fields');
                                                  setState(() {
                                                    _model
                                                        .textFieldTunnitController
                                                        ?.clear();
                                                    _model
                                                        .textFieldMinuutitController
                                                        ?.clear();
                                                    _model
                                                        .textFieldSekunnitController
                                                        ?.clear();
                                                    _model
                                                        .textFieldTavoiteMatkaController
                                                        ?.clear();
                                                  });
                                                } else {
                                                  logFirebaseEvent(
                                                      'Switch_widget_animation');
                                                  if (animationsMap[
                                                          'wrapOnActionTriggerAnimation'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'wrapOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                }
                                              }
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ij0w6eqz' /* Muu liike */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.help_outline_rounded,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 18.0, 0.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (!_model.switchValue!)
                                        Wrap(
                                          spacing: 12.0,
                                          runSpacing: 18.0,
                                          alignment: WrapAlignment.center,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.center,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'euebpkmp' /* Sarjat */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                if (!_model.switchValue!)
                                                  Container(
                                                    width: 100.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 334.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textFieldSarjojoaController,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: null,
                                                        hintText:
                                                            valueOrDefault<
                                                                String>(
                                                          widget
                                                              .rutiini?.liikkeet
                                                              ?.toList()?[widget
                                                                  .liikeIndex!]
                                                              ?.sarjaMaara
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .deleteRed,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .deleteRed,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 20.0,
                                                              ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .textFieldSarjojoaControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xd9oxn6z' /* Toistot */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                if (!_model.switchValue!)
                                                  Container(
                                                    width: 100.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 334.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textFieldTOistojaController,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: null,
                                                        hintText:
                                                            valueOrDefault<
                                                                String>(
                                                          widget
                                                              .rutiini?.liikkeet
                                                              ?.toList()?[widget
                                                                  .liikeIndex!]
                                                              ?.toistoMaara
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .deleteRed,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .deleteRed,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 20.0,
                                                              ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .textFieldTOistojaControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Visibility(
                                              visible: false,
                                              child: Container(
                                                width: 100.0,
                                                constraints: BoxConstraints(
                                                  maxWidth: 334.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: TextFormField(
                                                  controller: _model
                                                      .textFieldPainoController,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'odm165t6' /* Paino */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                        ),
                                                    hintText:
                                                        valueOrDefault<String>(
                                                      widget.rutiini?.liikkeet
                                                          ?.toList()?[widget
                                                              .liikeIndex!]
                                                          ?.aloitusPainoKg
                                                          ?.toString(),
                                                      '0',
                                                    ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .deleteRed,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .deleteRed,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 2.0,
                                                                12.0, 2.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 20.0,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .textFieldPainoControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            '^\\d*\\.?\\d*'))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'wrapOnPageLoadAnimation']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'wrapOnActionTriggerAnimation']!,
                                            ),
                                      if (_model.switchValue ?? true)
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                spacing: 12.0,
                                                runSpacing: 14.0,
                                                alignment: WrapAlignment.center,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Wrap(
                                                    spacing: 12.0,
                                                    runSpacing: 8.0,
                                                    alignment:
                                                        WrapAlignment.center,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
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
                                                              'l902twkl' /* tunnit */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Container(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textFieldTunnitController,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  functions
                                                                      .remainingHours(widget
                                                                          .rutiini
                                                                          ?.liikkeet
                                                                          ?.toList()?[
                                                                              widget.liikeIndex!]
                                                                          ?.kestoSekunteina)
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .deleteRed,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .deleteRed,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            2.0,
                                                                            12.0,
                                                                            2.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        20.0,
                                                                  ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator: _model
                                                                  .textFieldTunnitControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        '[0-9]'))
                                                              ],
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
                                                              'ojelm1c7' /* minuutit */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textFieldMinuutitController,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'vjqtyunu' /*  */,
                                                                ),
                                                                hintText: functions
                                                                    .remainingMinutes(widget
                                                                        .rutiini
                                                                        ?.liikkeet
                                                                        ?.toList()?[
                                                                            widget.liikeIndex!]
                                                                        ?.kestoSekunteina)
                                                                    .toString(),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .deleteRed,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .deleteRed,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            2.0,
                                                                            12.0,
                                                                            2.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        20.0,
                                                                  ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator: _model
                                                                  .textFieldMinuutitControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        '^([1-9]|[1-5][0-9])\$'))
                                                              ],
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
                                                              'etxlmgz3' /* sekunnit */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textFieldSekunnitController,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textFieldSekunnitController',
                                                                Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                () async {
                                                                  logFirebaseEvent(
                                                                      'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                                                  if (!true) {
                                                                    logFirebaseEvent(
                                                                        'TextFieldSekunnit_custom_action');
                                                                    await actions
                                                                        .updateUserDocLiikeAtIndex(
                                                                      widget
                                                                          .liikeIndex!,
                                                                      widget
                                                                          .rutiini,
                                                                      widget
                                                                          .rutiini
                                                                          ?.liikkeet
                                                                          ?.toList()?[
                                                                              widget.liikeIndex!]
                                                                          ?.nimi,
                                                                      null,
                                                                      int.tryParse(_model
                                                                          .textFieldTOistojaController
                                                                          .text),
                                                                      int.tryParse(_model
                                                                          .textFieldSarjojoaController
                                                                          .text),
                                                                      double.tryParse(_model
                                                                          .textFieldPainoController
                                                                          .text),
                                                                      _model
                                                                          .switchValue,
                                                                      null,
                                                                      null,
                                                                      double.tryParse(_model
                                                                          .textFieldTavoiteMatkaController
                                                                          .text),
                                                                      functions.toSeconds(
                                                                          int.tryParse(_model
                                                                              .textFieldTunnitController
                                                                              .text),
                                                                          int.tryParse(_model
                                                                              .textFieldMinuutitController
                                                                              .text),
                                                                          double.tryParse(_model
                                                                              .textFieldSekunnitController
                                                                              .text)),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'oeeapx3v' /*  */,
                                                                ),
                                                                hintText: functions
                                                                    .remainingSeconds(widget
                                                                        .rutiini
                                                                        ?.liikkeet
                                                                        ?.toList()?[
                                                                            widget.liikeIndex!]
                                                                        ?.kestoSekunteina)
                                                                    .toString(),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .deleteRed,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .deleteRed,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            2.0,
                                                                            12.0,
                                                                            2.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        20.0,
                                                                  ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator: _model
                                                                  .textFieldSekunnitControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        '^([1-9]|[1-5][0-9])(\\.?\\d*)?\$'))
                                                              ],
                                                            ),
                                                          ),
                                                        ],
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
                                                          'xp3fncw0' /* Tavaoitematka (metrit) */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Container(
                                                        width: 334.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 330.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldTavoiteMatkaController,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              '9nrrllh6' /*  */,
                                                            ),
                                                            hintText:
                                                                valueOrDefault<
                                                                    String>(
                                                              widget.rutiini
                                                                  ?.liikkeet
                                                                  ?.toList()?[widget
                                                                      .liikeIndex!]
                                                                  ?.matkaMetri
                                                                  ?.toString(),
                                                              '0',
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .deleteRed,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .deleteRed,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        2.0,
                                                                        12.0,
                                                                        2.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 20.0,
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .textFieldTavoiteMatkaControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '^\\d*\\.?\\d*'))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                              .animateOnPageLoad(animationsMap[
                                                  'columnOnPageLoadAnimation']!)
                                              .animateOnActionTrigger(
                                                animationsMap[
                                                    'columnOnActionTriggerAnimation']!,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Wrap(
                                    spacing: 22.0,
                                    runSpacing: 12.0,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.center,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            22.0, 0.0, 22.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_Text');
                                            logFirebaseEvent(
                                                'Text_clear_text_fields');
                                            setState(() {
                                              _model.textFieldSarjojoaController
                                                  ?.clear();
                                              _model.textFieldTOistojaController
                                                  ?.clear();
                                              _model.textFieldPainoController
                                                  ?.clear();
                                              _model.textFieldTunnitController
                                                  ?.clear();
                                              _model.textFieldMinuutitController
                                                  ?.clear();
                                              _model.textFieldSekunnitController
                                                  ?.clear();
                                              _model
                                                  .textFieldTavoiteMatkaController
                                                  ?.clear();
                                            });
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'i7qdvfiw' /* Tyhjennä */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'RUTIININ_SARJAT_TOISTOT_KESTO_MATKA_TALL');
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          Navigator.pop(context);
                                          logFirebaseEvent(
                                              'Button_custom_action');
                                          await actions
                                              .updateUserDocLiikeAtIndex(
                                            widget.liikeIndex!,
                                            widget.rutiini,
                                            widget.rutiini?.liikkeet
                                                ?.toList()?[widget.liikeIndex!]
                                                ?.nimi,
                                            null,
                                            valueOrDefault<int>(
                                              _model.switchValue!
                                                  ? 0
                                                  : valueOrDefault<int>(
                                                      int.tryParse(_model
                                                          .textFieldTOistojaController
                                                          .text),
                                                      0,
                                                    ),
                                              0,
                                            ),
                                            valueOrDefault<int>(
                                              _model.switchValue!
                                                  ? 0
                                                  : valueOrDefault<int>(
                                                      int.tryParse(_model
                                                          .textFieldSarjojoaController
                                                          .text),
                                                      0,
                                                    ),
                                              0,
                                            ),
                                            valueOrDefault<double>(
                                              (_model.switchValue!
                                                      ? 0
                                                      : valueOrDefault<int>(
                                                          int.tryParse(_model
                                                              .textFieldPainoController
                                                              .text),
                                                          0,
                                                        ))
                                                  .toDouble(),
                                              0.0,
                                            ),
                                            _model.switchValue,
                                            null,
                                            null,
                                            valueOrDefault<double>(
                                              (_model.switchValue!
                                                      ? valueOrDefault<int>(
                                                          int.tryParse(_model
                                                              .textFieldTavoiteMatkaController
                                                              .text),
                                                          0,
                                                        )
                                                      : 0)
                                                  .toDouble(),
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              _model.switchValue!
                                                  ? valueOrDefault<double>(
                                                      functions.toSeconds(
                                                          int.tryParse(_model
                                                              .textFieldTunnitController
                                                              .text),
                                                          int.tryParse(_model
                                                              .textFieldMinuutitController
                                                              .text),
                                                          double.tryParse(_model
                                                              .textFieldSekunnitController
                                                              .text)),
                                                      0.0,
                                                    )
                                                  : 0.0,
                                              0.0,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Button_clear_text_fields');
                                          setState(() {
                                            _model.textFieldSarjojoaController
                                                ?.clear();
                                            _model.textFieldTOistojaController
                                                ?.clear();
                                            _model.textFieldPainoController
                                                ?.clear();
                                            _model.textFieldTunnitController
                                                ?.clear();
                                            _model.textFieldMinuutitController
                                                ?.clear();
                                            _model.textFieldSekunnitController
                                                ?.clear();
                                            _model
                                                .textFieldTavoiteMatkaController
                                                ?.clear();
                                          });
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState()
                                              .valittuMuokattavaRutiini = null;
                                          FFAppState()
                                              .valittuMuokattavaLiikeIndex = -1;
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'l3dlilme' /* Tallenna */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
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
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!);
  }
}
