import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenin_aikana/liike_treenin_aikana_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
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

    return Visibility(
      visible: widget.sessioDoc != null,
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Stack(
          alignment: AlignmentDirectional(0.0, -1.0),
          children: [
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
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextFormField(
                                        controller:
                                            _model.rutiininnimiController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.rutiininnimiController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'SIVU_TREENAA_KOMPONENTTI_rutiininnimi_ON');
                                          logFirebaseEvent(
                                              'rutiininnimi_backend_call');

                                          final treeniSessiotUpdateData =
                                              createTreeniSessiotRecordData(
                                            treeniRutiiniData:
                                                createTreeniRutiiniStruct(
                                              nimi: _model
                                                  .rutiininnimiController.text,
                                              clearUnsetFields: false,
                                            ),
                                          );
                                          await widget.sessioDoc!.reference
                                              .update(treeniSessiotUpdateData);
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'a54f48mf' /* Treenin nimi */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'SIVU_TREENAA_KOMPONENTTI_rutiiniKommentt');
                                          logFirebaseEvent(
                                              'rutiiniKommentti_backend_call');

                                          final treeniSessiotUpdateData =
                                              createTreeniSessiotRecordData(
                                            treeniRutiiniData:
                                                createTreeniRutiiniStruct(
                                              kommentti: _model
                                                  .rutiiniKommenttiController
                                                  .text,
                                              clearUnsetFields: false,
                                            ),
                                          );
                                          await widget.sessioDoc!.reference
                                              .update(treeniSessiotUpdateData);
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'm7j3x68g' /*  */,
                                          ),
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
                                        minLines: 1,
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
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(rutiininLiikkeet.length,
                                    (rutiininLiikkeetIndex) {
                                  final rutiininLiikkeetItem =
                                      rutiininLiikkeet[rutiininLiikkeetIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: LiikeTreeninAikanaWidget(
                                      key: Key(
                                          'Keyjkz_${rutiininLiikkeetIndex}_of_${rutiininLiikkeet.length}'),
                                      liike: rutiininLiikkeetItem,
                                      liikeIndexInList: rutiininLiikkeetIndex,
                                      treeniSessio: widget.sessioDoc,
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
            if (!(isWeb
                ? MediaQuery.of(context).viewInsets.bottom > 0
                : _isKeyboardVisible))
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
                      _model.luotuTyhjaSarja = await actions.createSarjaList();
                      logFirebaseEvent(
                          'Container_painike_uusiLiike_custom_actio');
                      _model.luotuLiike = await actions.createLiike(
                        null,
                        null,
                        null,
                        _model.luotuTyhjaSarja?.toList(),
                      );
                      logFirebaseEvent(
                          'Container_painike_uusiLiike_backend_call');

                      final treeniSessiotUpdateData =
                          createTreeniSessiotRecordData(
                        treeniRutiiniData: createTreeniRutiiniStruct(
                          fieldValues: {
                            'liikkeet': FieldValue.arrayUnion([
                              getLiikeFirestoreData(
                                updateLiikeStruct(
                                  _model.luotuLiike,
                                  clearUnsetFields: false,
                                ),
                                true,
                              )
                            ]),
                          },
                          clearUnsetFields: false,
                        ),
                      );
                      await widget.sessioDoc!.reference
                          .update(treeniSessiotUpdateData);

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
          ],
        ),
      ),
    );
  }
}
