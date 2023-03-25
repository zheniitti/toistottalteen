import '/auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'package:flutter/services.dart';
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
    _model = createModel(context, () => LiikeTreeninAikanaModel());

    _model.textController1 ??= TextEditingController(text: widget.liike?.nimi);
    _model.textController2 ??=
        TextEditingController(text: widget.liike?.kommentti);
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
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: FFLocalizations.of(context).getText(
                              '29oo50bm' /* Liikkeen nimi */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
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
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
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
                              widget.liike?.kommentti != ''))
                        TextFormField(
                          controller: _model.textController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: FFLocalizations.of(context).getText(
                              'l7w663ju' /* Kommentti (vapaaehtoinen) */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
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
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
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
                        child: Icon(
                          Icons.more_vert_rounded,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 24.0,
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
            Builder(
              builder: (context) {
                final sarjat = widget.liike?.sarjat?.toList()?.toList() ?? [];
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(sarjat.length, (sarjatIndex) {
                    final sarjatItem = sarjat[sarjatIndex];
                    return Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.liike?.isOtherExerciseType ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
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
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Wrap(
                                          spacing: 12.0,
                                          runSpacing: 8.0,
                                          alignment: WrapAlignment.center,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
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
                                                controller:
                                                    _model.textController3 ??=
                                                        TextEditingController(
                                                  text: functions
                                                      .remainingHours(sarjatItem
                                                          .kestoSekunteina)
                                                      .toString(),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hoyni067' /* Tunnit */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'okhith2m' /* 0 */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
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
                                                              .primaryColor,
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 20.0,
                                                        ),
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController3Validator
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
                                                controller:
                                                    _model.textController4 ??=
                                                        TextEditingController(
                                                  text: functions
                                                      .remainingMinutes(
                                                          sarjatItem
                                                              .kestoSekunteina)
                                                      .toString(),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ptrnfksh' /* Minuutit */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'g89ptor6' /* 0 */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
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
                                                              .primaryColor,
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 20.0,
                                                        ),
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController4Validator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(
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
                                                controller:
                                                    _model.textController5 ??=
                                                        TextEditingController(
                                                  text: functions
                                                      .remainingSeconds(
                                                          sarjatItem
                                                              .kestoSekunteina)
                                                      .toString(),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'qs7ytc7o' /* Sekunnit */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'fmcdlglk' /* 0 */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
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
                                                              .primaryColor,
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 20.0,
                                                        ),
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController5Validator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
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
                                            controller:
                                                _model.textController6 ??=
                                                    TextEditingController(
                                              text: sarjatItem.matkaMetreina
                                                  ?.toString(),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'dl2outh6' /* matka (metreinä) */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6d0b86sz' /* 0.0 */,
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
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .deleteRed,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .deleteRed,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
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
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(
                                                      '(-?)(0|([1-9][0-9]*))(\\\\.[0-9]+)?\$'))
                                            ],
                                          ),
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
                            ),
                          if (!widget.liike!.isOtherExerciseType!)
                            Stack(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              children: [
                                Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.end,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'u1j0c71n' /* Toistot */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontSize: 12.0,
                                              ),
                                        ),
                                        Container(
                                          width: 130.0,
                                          decoration: BoxDecoration(),
                                          child: SarjaToistotTextfieldWidget(
                                            key: Key(
                                                'Keyfrz_${sarjatIndex}_of_${sarjat.length}'),
                                            sarjaIndex: sarjatIndex,
                                            liikeIndex: widget.liikeIndexInList,
                                            sarja: sarjatItem,
                                            sessioDoc: widget.treeniSessio,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '1zpp3lp9' /* Paino (kg) */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 12.0,
                                              ),
                                        ),
                                        Container(
                                          width: 130.0,
                                          decoration: BoxDecoration(),
                                          child: SarjaPainoTextfieldWidget(
                                            key: Key(
                                                'Key3ik_${sarjatIndex}_of_${sarjat.length}'),
                                            sarjaIndex: sarjatIndex,
                                            liikeIndex: widget.liikeIndexInList,
                                            sarja: sarjatItem,
                                            sessioDoc: widget.treeniSessio,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LIIKE_TREENIN_AIKANA_Icon_5s381y0e_ON_TA');
                                        logFirebaseEvent('Icon_custom_action');
                                        await actions.removeSessioSarjaAtIndex(
                                          widget.treeniSessio,
                                          widget.liikeIndexInList!,
                                          sarjatIndex,
                                        );
                                      },
                                      child: Icon(
                                        Icons.remove_circle_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: sarjatIndex.toString(),
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'hcx7u96d' /* .
sarja */
                                              ,
                                            ),
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          Divider(
                            thickness: 1.0,
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!);
                  }),
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'LIIKE_TREENIN_AIKANA_Row_5f3q34g1_ON_TAP');
                      logFirebaseEvent('Row_update_widget_state');
                      setState(() {});
                      logFirebaseEvent('Row_backend_call');

                      final treeniSessiotUpdateData =
                          createTreeniSessiotRecordData(
                        treeniRutiiniData: createTreeniRutiiniStruct(
                          fieldValues: {
                            'liikkeet': FieldValue.arrayUnion([
                              getLiikeFirestoreData(
                                createLiikeStruct(
                                  nimi: '',
                                  clearUnsetFields: false,
                                ),
                                true,
                              )
                            ]),
                          },
                          clearUnsetFields: false,
                        ),
                      );
                      await widget.treeniSessio!.reference
                          .update(treeniSessiotUpdateData);
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
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  if ((widget.liike!.sarjat!.toList().length > 0) || false)
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'LIIKE_TREENIN_AIKANA_Row_55r3gb8v_ON_TAP');
                        logFirebaseEvent('Row_update_widget_state');
                        setState(() {});
                        logFirebaseEvent('Row_backend_call');

                        final treeniSessiotUpdateData = 
                            createTreeniSessiotRecordData(
                          treeniRutiiniData: createTreeniRutiiniStruct(
                            fieldValues: {
                              'liikkeet': FieldValue.arrayUnion([
                                getLiikeFirestoreData(
                                  createLiikeStruct(
                                    nimi: '',
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                            clearUnsetFields: false,
                          ),
                        );
                        await widget.treeniSessio!.reference
                            .update(treeniSessiotUpdateData);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'rrk6y01u' /* Tehty */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor: Color(0xFFF5F5F5),
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??=
                                  widget.liike!.tehty!,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryColor,
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
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
  }
}
