import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenin_aikana/liike_treenin_aikana_widget.dart';
import '/components/name_and_comment_fields_of_sessio/name_and_comment_fields_of_sessio_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
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
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 800.ms,
          begin: 0.7,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Stack(
        alignment: AlignmentDirectional(0.0, -1.0),
        children: [
          if (!valueOrDefault<bool>(
            valueOrDefault<bool>(
                  widget.sessioDoc == null,
                  true,
                ) ||
                valueOrDefault<bool>(
                  valueOrDefault<bool>(
                        widget.sessioDoc!.alku != null,
                        false,
                      ) &&
                      valueOrDefault<bool>(
                        widget.sessioDoc!.loppu != null,
                        false,
                      ),
                  false,
                ),
            false,
          ))
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 22.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.nameAndCommentFieldsOfSessioModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: NameAndCommentFieldsOfSessioWidget(
                              sessioDoc: widget.sessioDoc,
                            ),
                          ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 240.0),
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
                              _model.nameAndCommentFieldsOfSessioModel
                                  .rutiininnimiController.text,
                              widget.sessioDoc!.treeniRutiiniData.liikkeet
                                  ?.toList()
                                  ?.toList(),
                              _model.nameAndCommentFieldsOfSessioModel
                                  .rutiiniKommenttiController.text,
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
                              null,
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
                                color: FlutterFlowTheme.of(context).primary,
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 24.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'k8l5bzfl' /* Lisää  liike */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      ),
                    ),
                ],
              ),
            ),
          if (valueOrDefault<bool>(
            valueOrDefault<bool>(
                  widget.sessioDoc == null,
                  true,
                ) ||
                valueOrDefault<bool>(
                  valueOrDefault<bool>(
                        widget.sessioDoc!.alku != null,
                        false,
                      ) &&
                      valueOrDefault<bool>(
                        widget.sessioDoc!.loppu != null,
                        false,
                      ),
                  false,
                ),
            true,
          ))
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hr61kg7a' /* Valitse treenattava treenipohj... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 150.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SIVU_TREENAA_KOMPONENTTI_Button_aloitaUu');
                                logFirebaseEvent(
                                    'Button_aloitaUusiTreeni_backend_call');

                                final treeniSessiotCreateData = {
                                  ...createTreeniSessiotRecordData(
                                    userRef: currentUserReference,
                                    isEditing: false,
                                    treeniRutiiniData:
                                        createTreeniRutiiniStruct(
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
                                                    createSarjaStruct(
                                                      createdTime:
                                                          getCurrentTimestamp,
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
                                            true,
                                          )
                                        ],
                                      },
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                  ),
                                  'alku': FieldValue.serverTimestamp(),
                                  'docCreatedTime':
                                      FieldValue.serverTimestamp(),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
