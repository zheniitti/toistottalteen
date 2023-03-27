import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenin_aikana/liike_treenin_aikana_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sivu_treenaa_komponentti_model.dart';
export 'sivu_treenaa_komponentti_model.dart';

class SivuTreenaaKomponenttiWidget extends StatefulWidget {
  const SivuTreenaaKomponenttiWidget({
    Key? key,
    this.sessioDoc,
  }) : super(key: key);

  final TreeniSessiotRecord? sessioDoc;

  @override
  _SivuTreenaaKomponenttiWidgetState createState() =>
      _SivuTreenaaKomponenttiWidgetState();
}

class _SivuTreenaaKomponenttiWidgetState
    extends State<SivuTreenaaKomponenttiWidget> with TickerProviderStateMixin {
  late SivuTreenaaKomponenttiModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1500.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 1500.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 1500.ms,
          duration: 800.ms,
          begin: 0.7,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
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
    _model = createModel(context, () => SivuTreenaaKomponenttiModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.rutiininnimiController ??=
        TextEditingController(text: widget.sessioDoc!.treeniRutiiniData.nimi);
    _model.rutiiniKommenttiController ??= TextEditingController(
        text: widget.sessioDoc!.treeniRutiiniData.kommentti);

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Stack(
        alignment: AlignmentDirectional(0.0, -1.0),
        children: [
          if (valueOrDefault<bool>(
            widget.sessioDoc != null,
            false,
          ))
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 240.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 640.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 4.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        controller:
                                            _model.rutiininnimiController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.rutiininnimiController',
                                          Duration(milliseconds: 1000),
                                          () async {
                                            logFirebaseEvent(
                                                'SIVU_TREENAA_KOMPONENTTI_rutiininnimi_ON');
                                            logFirebaseEvent(
                                                'rutiininnimi_custom_action');
                                            _model.updatedRutiiniFromNimiField =
                                                await actions
                                                    .myUpdateTreeniRutiiniStruct(
                                              widget
                                                  .sessioDoc!.treeniRutiiniData,
                                              null,
                                              _model
                                                  .rutiininnimiController.text,
                                              widget.sessioDoc!
                                                  .treeniRutiiniData.liikkeet
                                                  ?.toList()
                                                  ?.toList(),
                                              _model.rutiiniKommenttiController
                                                  .text,
                                              null,
                                              null,
                                              false,
                                              true,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              functions
                                                  .emptyJsonList()
                                                  ?.toList(),
                                              false,
                                              false,
                                            );
                                            logFirebaseEvent(
                                                'rutiininnimi_backend_call');

                                            final treeniSessiotUpdateData =
                                                createTreeniSessiotRecordData(
                                              treeniRutiiniData:
                                                  updateTreeniRutiiniStruct(
                                                _model
                                                    .updatedRutiiniFromNimiField,
                                                clearUnsetFields: false,
                                              ),
                                            );
                                            await widget.sessioDoc!.reference
                                                .update(
                                                    treeniSessiotUpdateData);

                                            setState(() {});
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'a54f48mf' /* Treenin nimi */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 4.0),
                                        ),
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                        textAlign: TextAlign.center,
                                        maxLines: null,
                                        minLines: 1,
                                        validator: _model
                                            .rutiininnimiControllerValidator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.rutiiniKommenttiController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.rutiiniKommenttiController',
                                          Duration(milliseconds: 1000),
                                          () async {
                                            logFirebaseEvent(
                                                'SIVU_TREENAA_KOMPONENTTI_rutiiniKommentt');
                                            logFirebaseEvent(
                                                'rutiiniKommentti_custom_action');
                                            _model.updatedRutiiniFromNimiFieldCopy =
                                                await actions
                                                    .myUpdateTreeniRutiiniStruct(
                                              widget
                                                  .sessioDoc!.treeniRutiiniData,
                                              null,
                                              _model
                                                  .rutiininnimiController.text,
                                              widget.sessioDoc!
                                                  .treeniRutiiniData.liikkeet
                                                  ?.toList()
                                                  ?.toList(),
                                              _model.rutiiniKommenttiController
                                                  .text,
                                              null,
                                              null,
                                              false,
                                              true,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              functions
                                                  .emptyJsonList()
                                                  ?.toList(),
                                              false,
                                              false,
                                            );
                                            logFirebaseEvent(
                                                'rutiiniKommentti_backend_call');

                                            final treeniSessiotUpdateData =
                                                createTreeniSessiotRecordData(
                                              treeniRutiiniData:
                                                  updateTreeniRutiiniStruct(
                                                _model
                                                    .updatedRutiiniFromNimiField,
                                                clearUnsetFields: false,
                                              ),
                                            );
                                            await widget.sessioDoc!.reference
                                                .update(
                                                    treeniSessiotUpdateData);

                                            setState(() {});
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: null,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '8prjh7ks' /* Kommentti (vapaaehtoinen) */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 2.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: null,
                                        validator: _model
                                            .rutiiniKommenttiControllerValidator
                                            .asValidator(context),
                                      ),
                                    ],
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 10.0),
                                    child: Icon(
                                      Icons.add_comment_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24.0,
                                    ),
                                  ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 6.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final rutiininLiikkeet = widget
                                      .sessioDoc!.treeniRutiiniData.liikkeet
                                      ?.toList()
                                      ?.toList() ??
                                  [];
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(rutiininLiikkeet.length,
                                    (rutiininLiikkeetIndex) {
                                  final rutiininLiikkeetItem =
                                      rutiininLiikkeet[rutiininLiikkeetIndex];
                                  return Visibility(
                                    visible: valueOrDefault<bool>(
                                      rutiininLiikkeetItem.createdTime != null,
                                      false,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.liikeTreeninAikanaModels
                                            .getModel(
                                          rutiininLiikkeetItem.createdTime!
                                              .toString(),
                                          rutiininLiikkeetIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: LiikeTreeninAikanaWidget(
                                          key: Key(
                                            'Keyjkz_${rutiininLiikkeetItem.createdTime!.toString()}',
                                          ),
                                          liike: rutiininLiikkeetItem,
                                          liikeIndexInList:
                                              rutiininLiikkeetIndex,
                                          treeniSessio: widget.sessioDoc,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (valueOrDefault<bool>(
            widget.sessioDoc != null,
            true,
          )
              ? !(isWeb
                  ? MediaQuery.of(context).viewInsets.bottom > 0
                  : _isKeyboardVisible)
              : false)
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 108.0),
                child: InkWell(
                  onTap: () async {
                    logFirebaseEvent(
                        'SIVU_TREENAA_KOMPONENTTI_Container_paini');
                    logFirebaseEvent(
                        'Container_painike_uusiLiike_custom_actio');
                    _model.updatedRutiiniFromLisaaLiike =
                        await actions.myUpdateTreeniRutiiniStruct(
                      widget.sessioDoc!.treeniRutiiniData,
                      null,
                      _model.rutiininnimiController.text,
                      widget.sessioDoc!.treeniRutiiniData.liikkeet
                          ?.toList()
                          ?.toList(),
                      _model.rutiiniKommenttiController.text,
                      null,
                      null,
                      false,
                      null,
                      true,
                      null,
                      null,
                      null,
                      null,
                      null,
                      null,
                      functions.emptyJsonList()?.toList(),
                      false,
                      false,
                    );
                    logFirebaseEvent(
                        'Container_painike_uusiLiike_custom_actio');
                    await actions.updateTreenisessiotRecord(
                      widget.sessioDoc,
                      null,
                      null,
                      _model.updatedRutiiniFromLisaaLiike,
                      null,
                      null,
                      false,
                    );

                    setState(() {});
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: 160.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Icon(
                              Icons.add_rounded,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 30.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '44rq35vd' /* Lisää  liike */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
            ),
          if (valueOrDefault<bool>(
            widget.sessioDoc == null,
            true,
          ))
            Container(
              constraints: BoxConstraints(
                maxWidth: 300.0,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'hr61kg7a' /* Sinulla ei ole keskeneräistä t... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 150.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'SIVU_TREENAA_KOMPONENTTI_Button_aloitaUu');
                        logFirebaseEvent(
                            'Button_aloitaUusiTreeni_clear_text_field');
                        setState(() {
                          _model.rutiininnimiController?.clear();
                          _model.rutiiniKommenttiController?.clear();
                        });
                        logFirebaseEvent(
                            'Button_aloitaUusiTreeni_backend_call');

                        final treeniSessiotCreateData = {
                          ...createTreeniSessiotRecordData(
                            userRef: currentUserReference,
                            isEditing: false,
                            treeniRutiiniData: createTreeniRutiiniStruct(
                              createdTime: getCurrentTimestamp,
                              isTreeniPohja: false,
                              finishedEditing: true,
                              fieldValues: {
                                'liikkeet': [
                                  getLiikeFirestoreData(
                                    createLiikeStruct(
                                      tehty: false,
                                      isOtherExerciseType: false,
                                      createdTime: getCurrentTimestamp,
                                      fieldValues: {
                                        'sarjat': [
                                          getSarjaFirestoreData(
                                            updateSarjaStruct(
                                              null,
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ],
                                      },
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                    true,
                                  )
                                ],
                              },
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ),
                          'alku': FieldValue.serverTimestamp(),
                          'docCreatedTime': FieldValue.serverTimestamp(),
                        };
                        await TreeniSessiotRecord.collection
                            .doc()
                            .set(treeniSessiotCreateData);
                      },
                      text: FFLocalizations.of(context).getText(
                        'uz6rq23u' /* Aloita tyhjä treeni */,
                      ),
                      options: FFButtonOptions(
                        width: 240.0,
                        height: 70.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle1
                            .override(
                              fontFamily: 'Outfit',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 1.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation3']!),
        ],
      ),
    );
  }
}
