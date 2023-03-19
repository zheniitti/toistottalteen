import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/components/rutiinin_liikkeet/rutiinin_liikkeet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiini_model.dart';
export 'rutiini_model.dart';

class RutiiniWidget extends StatefulWidget {
  const RutiiniWidget({
    Key? key,
    this.rutiini,
    this.hasUnfinishedWorkout,
    this.pageStateSelectedRutiini,
    this.rutiiniListIndex,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;
  final bool? hasUnfinishedWorkout;
  final TreeniRutiiniStruct? pageStateSelectedRutiini;
  final int? rutiiniListIndex;

  @override
  _RutiiniWidgetState createState() => _RutiiniWidgetState();
}

class _RutiiniWidgetState extends State<RutiiniWidget>
    with TickerProviderStateMixin {
  late RutiiniModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        SaturateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.7,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 0.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.9,
          end: 1.1,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.9,
          end: 1.1,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.9,
          end: 1.1,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.9,
          end: 1.1,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.9,
          end: 1.1,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.9,
          end: 1.1,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.9,
          end: 1.1,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 220.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 220.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 420.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.97,
          end: 1.07,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.6,
          end: 1.0,
        ),
      ],
    ),
    'rowOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 0.9,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 200.ms,
          duration: 200.ms,
          begin: 1.0,
          end: 1.2,
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 3000.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 3000.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 3000.ms,
          duration: 900.ms,
          begin: 0.9,
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
    _model = createModel(context, () => RutiiniModel());

    _model.textFieldNimiController ??=
        TextEditingController(text: widget.rutiini?.nimi);
    _model.textFieldKommenttiController ??=
        TextEditingController(text: widget.rutiini?.kommentti);
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1.0,
          constraints: BoxConstraints(
            maxWidth: 500.0,
          ),
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              !widget.rutiini!.finishedEditing!
                  ? FlutterFlowTheme.of(context).alternate
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (false)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if ((widget.rutiini?.kommentti == null ||
                                      widget.rutiini?.kommentti == '') &&
                                  widget.rutiini!.finishedEditing!)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 8.0, 0.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'RUTIINI_COMP_Text_ivf90nsb_ON_TAP');
                                      logFirebaseEvent('Text_custom_action');
                                      await actions.updateUserDocTreenirutiini(
                                        widget.rutiini,
                                        null,
                                        null,
                                        false,
                                        null,
                                        null,
                                        null,
                                        null,
                                        widget.rutiini?.liikkeet
                                            ?.toList()
                                            ?.toList(),
                                        null,
                                        null,
                                        null,
                                        true,
                                        true,
                                        false,
                                        false,
                                      );
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'a7t1o69i' /* 💬 */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation']!),
                                ),
                            ],
                          ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 6.0, 0.0, 6.0),
                            child: TextFormField(
                              controller: _model.textFieldNimiController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textFieldNimiController',
                                Duration(milliseconds: 300),
                                () async {
                                  logFirebaseEvent(
                                      'RUTIINI_TextField_nimi_ON_TEXTFIELD_CHAN');
                                  logFirebaseEvent(
                                      'TextField_nimi_custom_action');
                                  await actions.updateUserDocTreenirutiini(
                                    widget.rutiini,
                                    null,
                                    null,
                                    false,
                                    true,
                                    null,
                                    _model.textFieldNimiController.text,
                                    _model.textFieldKommenttiController.text,
                                    widget.rutiini?.liikkeet
                                        ?.toList()
                                        ?.toList(),
                                    null,
                                    null,
                                    null,
                                    true,
                                    false,
                                    false,
                                    false,
                                  );
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: FFLocalizations.of(context).getText(
                                  'yi3kozht' /* Treenipohjan nimi */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
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
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 20.0,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              minLines: 1,
                              validator: _model.textFieldNimiControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 4.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'RUTIINI_COMP_Icon_208l4wig_ON_TAP');
                              logFirebaseEvent('Icon_bottom_sheet');
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: BottomSheetRutiiniJaSessioWidget(
                                      rutiiniData: widget.rutiini,
                                      treeniSessioDoc: null,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Icon(
                              Icons.more_vert_rounded,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                    if (widget.rutiini?.nimi != null &&
                            widget.rutiini?.nimi != ''
                        ? !widget.rutiini!.finishedEditing!
                        : false)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 6.0),
                            child: TextFormField(
                              controller: _model.textFieldKommenttiController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textFieldKommenttiController',
                                Duration(milliseconds: 300),
                                () async {
                                  logFirebaseEvent(
                                      'RUTIINI_TextField_kommentti_ON_TEXTFIELD');
                                  logFirebaseEvent(
                                      'TextField_kommentti_custom_action');
                                  await actions.updateUserDocTreenirutiini(
                                    widget.rutiini,
                                    null,
                                    null,
                                    false,
                                    null,
                                    null,
                                    _model.textFieldNimiController.text,
                                    null,
                                    widget.rutiini?.liikkeet
                                        ?.toList()
                                        ?.toList(),
                                    null,
                                    null,
                                    null,
                                    null,
                                    false,
                                    false,
                                    false,
                                  );
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: FFLocalizations.of(context).getText(
                                  'kiyozfj3' /* Treenipohjan kommentti 💬 */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
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
                                    4.0, 4.0, 4.0, 4.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 5,
                              minLines: 1,
                              validator: _model
                                  .textFieldKommenttiControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Wrap(
                          spacing: 4.0,
                          runSpacing: 4.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('RUTIINI_COMP_MA_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'buttonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_custom_action');
                                await actions.updateUserDocTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  true,
                                  null,
                                  _model.textFieldNimiController.text,
                                  _model.textFieldKommenttiController.text,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  functions.updatedValitutViikonPaivat(
                                      widget.rutiini?.valitutViikonPaivat,
                                      !widget.rutiini!.valitutViikonPaivat!.ma!,
                                      widget.rutiini?.valitutViikonPaivat?.ti,
                                      widget.rutiini?.valitutViikonPaivat?.ke,
                                      widget.rutiini?.valitutViikonPaivat?.to,
                                      widget.rutiini?.valitutViikonPaivat?.pe,
                                      widget.rutiini?.valitutViikonPaivat?.la,
                                      widget.rutiini?.valitutViikonPaivat?.su),
                                  null,
                                  null,
                                  null,
                                  false,
                                  false,
                                  false,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'yod6uchb' /* Ma */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget.rutiini!.valitutViikonPaivat!.ma!
                                    ? FlutterFlowTheme.of(context).tertiaryColor
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: widget
                                              .rutiini!.valitutViikonPaivat!.ma!
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation1']!,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('RUTIINI_COMP_TI_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'buttonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_custom_action');
                                await actions.updateUserDocTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  true,
                                  null,
                                  _model.textFieldNimiController.text,
                                  _model.textFieldKommenttiController.text,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  functions.updatedValitutViikonPaivat(
                                      widget.rutiini?.valitutViikonPaivat,
                                      widget.rutiini?.valitutViikonPaivat?.ma,
                                      !widget.rutiini!.valitutViikonPaivat!.ti!,
                                      widget.rutiini?.valitutViikonPaivat?.ke,
                                      widget.rutiini?.valitutViikonPaivat?.to,
                                      widget.rutiini?.valitutViikonPaivat?.pe,
                                      widget.rutiini?.valitutViikonPaivat?.la,
                                      widget.rutiini?.valitutViikonPaivat?.su),
                                  null,
                                  null,
                                  null,
                                  false,
                                  false,
                                  false,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'vv4fc4r4' /* Ti */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget.rutiini!.valitutViikonPaivat!.ti!
                                    ? FlutterFlowTheme.of(context).tertiaryColor
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: widget
                                              .rutiini!.valitutViikonPaivat!.ti!
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation2']!,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('RUTIINI_COMP_KE_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'buttonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_custom_action');
                                await actions.updateUserDocTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  true,
                                  null,
                                  _model.textFieldNimiController.text,
                                  _model.textFieldKommenttiController.text,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  functions.updatedValitutViikonPaivat(
                                      widget.rutiini?.valitutViikonPaivat,
                                      widget.rutiini?.valitutViikonPaivat?.ma,
                                      widget.rutiini?.valitutViikonPaivat?.ti,
                                      !widget.rutiini!.valitutViikonPaivat!.ke!,
                                      widget.rutiini?.valitutViikonPaivat?.to,
                                      widget.rutiini?.valitutViikonPaivat?.pe,
                                      widget.rutiini?.valitutViikonPaivat?.la,
                                      widget.rutiini?.valitutViikonPaivat?.su),
                                  null,
                                  null,
                                  null,
                                  false,
                                  false,
                                  false,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'yuw8d4lw' /* Ke */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget.rutiini!.valitutViikonPaivat!.ke!
                                    ? FlutterFlowTheme.of(context).tertiaryColor
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: widget
                                              .rutiini!.valitutViikonPaivat!.ke!
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation3']!,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('RUTIINI_COMP_TO_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation4'] !=
                                    null) {
                                  animationsMap[
                                          'buttonOnActionTriggerAnimation4']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_custom_action');
                                await actions.updateUserDocTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  true,
                                  null,
                                  _model.textFieldNimiController.text,
                                  _model.textFieldKommenttiController.text,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  functions.updatedValitutViikonPaivat(
                                      widget.rutiini?.valitutViikonPaivat,
                                      widget.rutiini?.valitutViikonPaivat?.ma,
                                      widget.rutiini?.valitutViikonPaivat?.ti,
                                      widget.rutiini?.valitutViikonPaivat?.ke,
                                      !widget.rutiini!.valitutViikonPaivat!.to!,
                                      widget.rutiini?.valitutViikonPaivat?.pe,
                                      widget.rutiini?.valitutViikonPaivat?.la,
                                      widget.rutiini?.valitutViikonPaivat?.su),
                                  null,
                                  null,
                                  null,
                                  false,
                                  false,
                                  false,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'ruf636mt' /* To */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget.rutiini!.valitutViikonPaivat!.to!
                                    ? FlutterFlowTheme.of(context).tertiaryColor
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: widget
                                              .rutiini!.valitutViikonPaivat!.to!
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation4']!,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('RUTIINI_COMP_PE_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation5'] !=
                                    null) {
                                  animationsMap[
                                          'buttonOnActionTriggerAnimation5']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_custom_action');
                                await actions.updateUserDocTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  true,
                                  null,
                                  _model.textFieldNimiController.text,
                                  _model.textFieldKommenttiController.text,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  functions.updatedValitutViikonPaivat(
                                      widget.rutiini?.valitutViikonPaivat,
                                      widget.rutiini?.valitutViikonPaivat?.ma,
                                      widget.rutiini?.valitutViikonPaivat?.ti,
                                      widget.rutiini?.valitutViikonPaivat?.ke,
                                      widget.rutiini?.valitutViikonPaivat?.to,
                                      !widget.rutiini!.valitutViikonPaivat!.pe!,
                                      widget.rutiini?.valitutViikonPaivat?.la,
                                      widget.rutiini?.valitutViikonPaivat?.su),
                                  null,
                                  null,
                                  null,
                                  false,
                                  false,
                                  false,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'an7uyedx' /* Pe */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget.rutiini!.valitutViikonPaivat!.pe!
                                    ? FlutterFlowTheme.of(context).tertiaryColor
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: widget
                                              .rutiini!.valitutViikonPaivat!.pe!
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation5']!,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('RUTIINI_COMP_LA_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation6'] !=
                                    null) {
                                  animationsMap[
                                          'buttonOnActionTriggerAnimation6']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_custom_action');
                                await actions.updateUserDocTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  true,
                                  null,
                                  _model.textFieldNimiController.text,
                                  _model.textFieldKommenttiController.text,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  functions.updatedValitutViikonPaivat(
                                      widget.rutiini?.valitutViikonPaivat,
                                      widget.rutiini?.valitutViikonPaivat?.ma,
                                      widget.rutiini?.valitutViikonPaivat?.ti,
                                      widget.rutiini?.valitutViikonPaivat?.ke,
                                      widget.rutiini?.valitutViikonPaivat?.to,
                                      widget.rutiini?.valitutViikonPaivat?.pe,
                                      !widget.rutiini!.valitutViikonPaivat!.la!,
                                      widget.rutiini?.valitutViikonPaivat?.su),
                                  null,
                                  null,
                                  null,
                                  false,
                                  false,
                                  false,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'vlibsxm0' /* La */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget.rutiini!.valitutViikonPaivat!.la!
                                    ? FlutterFlowTheme.of(context).tertiaryColor
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: widget
                                              .rutiini!.valitutViikonPaivat!.la!
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation6']!,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('RUTIINI_COMP_SU_BTN_ON_TAP');
                                logFirebaseEvent('Button_widget_animation');
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation7'] !=
                                    null) {
                                  animationsMap[
                                          'buttonOnActionTriggerAnimation7']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('Button_custom_action');
                                await actions.updateUserDocTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  true,
                                  null,
                                  _model.textFieldNimiController.text,
                                  _model.textFieldKommenttiController.text,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  functions.updatedValitutViikonPaivat(
                                      widget.rutiini?.valitutViikonPaivat,
                                      widget.rutiini?.valitutViikonPaivat?.ma,
                                      widget.rutiini?.valitutViikonPaivat?.ti,
                                      widget.rutiini?.valitutViikonPaivat?.ke,
                                      widget.rutiini?.valitutViikonPaivat?.to,
                                      widget.rutiini?.valitutViikonPaivat?.pe,
                                      widget.rutiini?.valitutViikonPaivat?.la,
                                      !widget
                                          .rutiini!.valitutViikonPaivat!.su!),
                                  null,
                                  null,
                                  null,
                                  false,
                                  false,
                                  false,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'c5mfuuxh' /* Su */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget.rutiini!.valitutViikonPaivat!.su!
                                    ? FlutterFlowTheme.of(context).tertiaryColor
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: widget
                                              .rutiini!.valitutViikonPaivat!.su!
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation7']!,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'qqp0ddb4' /* Treenipäivät  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      functions.treenipaivatString(
                                          widget.rutiini!.valitutViikonPaivat!,
                                          FFLocalizations.of(context)
                                              .languageCode)!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                        child: wrapWithModel(
                          model: _model.rutiininLiikkeetModel,
                          updateCallback: () => setState(() {}),
                          child: RutiininLiikkeetWidget(
                            rutiini: widget.rutiini,
                          ),
                        ),
                      ),
                      if (widget.rutiini!.finishedEditing! &&
                          (widget.rutiini!.liikkeet!.toList().length > 0))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 1.0,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Wrap(
                                  spacing: 30.0,
                                  runSpacing: 12.0,
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'xvtlnaay' /* Treenihistoria */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation1']!),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'RUTIINI_COMP_TREENAA_NYT_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        final treeniSessiotCreateData = {
                                          ...createTreeniSessiotRecordData(
                                            userRef: currentUserReference,
                                            isEditing: false,
                                            treeniRutiiniData:
                                                updateTreeniRutiiniStruct(
                                              widget.rutiini,
                                              clearUnsetFields: false,
                                            ),
                                          ),
                                          'docCreatedTime':
                                              FieldValue.serverTimestamp(),
                                          'alku': FieldValue.serverTimestamp(),
                                        };
                                        await TreeniSessiotRecord.collection
                                            .doc()
                                            .set(treeniSessiotCreateData);
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().update(() {
                                          FFAppState().navBarIndex = 1;
                                        });
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '5o4nggqe' /* Treenaa nyt */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation2']!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!(widget.rutiini!.finishedEditing! &&
                          (widget.rutiini!.liikkeet!.toList().length > 0)))
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'RUTIINI_COMP_Row_a4bmbafi_ON_TAP');
                                  logFirebaseEvent('Row_custom_action');
                                  await actions.updateUserDocTreenirutiini(
                                    widget.rutiini,
                                    true,
                                    null,
                                    false,
                                    true,
                                    null,
                                    _model.textFieldNimiController.text,
                                    _model.textFieldKommenttiController.text,
                                    widget.rutiini?.liikkeet
                                        ?.toList()
                                        ?.toList(),
                                    null,
                                    null,
                                    null,
                                    null,
                                    true,
                                    false,
                                    false,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        Icons.add_rounded,
                                        color: Colors.black,
                                        size: 24.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'm9mgmk0g' /* Lisää harjoitusliike */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation1']!),
                            ],
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation2']!,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
            .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!)
            .animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation1']!,
            ),
        if (!widget.rutiini!.finishedEditing!)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 22.0, 8.0),
            child: InkWell(
              onTap: () async {
                logFirebaseEvent('RUTIINI_COMP_Row_lopetaMuokkaus_ON_TAP');
                logFirebaseEvent('Row_lopetaMuokkaus_widget_animation');
                if (animationsMap['rowOnActionTriggerAnimation'] != null) {
                  animationsMap['rowOnActionTriggerAnimation']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('Row_lopetaMuokkaus_custom_action');
                await actions.updateUserDocTreenirutiini(
                  widget.rutiini,
                  null,
                  null,
                  true,
                  true,
                  null,
                  _model.textFieldNimiController.text,
                  _model.textFieldKommenttiController.text,
                  widget.rutiini?.liikkeet?.toList()?.toList(),
                  null,
                  null,
                  null,
                  _model.textFieldKommenttiController.text != null &&
                      _model.textFieldKommenttiController.text != '',
                  true,
                  false,
                  true,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      's66i837o' /* Lopeta muokkaus */,
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2,
                  ),
                ],
              ),
            )
                .animateOnPageLoad(animationsMap['rowOnPageLoadAnimation2']!)
                .animateOnActionTrigger(
                  animationsMap['rowOnActionTriggerAnimation']!,
                ),
          ),
      ],
    );
  }
}
