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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sessio_model.dart';
export 'sessio_model.dart';

class SessioWidget extends StatefulWidget {
  const SessioWidget({
    Key? key,
    this.treeniSessio,
  }) : super(key: key);

  final TreeniSessiotRecord? treeniSessio;

  @override
  _SessioWidgetState createState() => _SessioWidgetState();
}

class _SessioWidgetState extends State<SessioWidget>
    with TickerProviderStateMixin {
  late SessioModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessioModel());

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
      width: MediaQuery.of(context).size.width * 1.0,
      constraints: BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.treeniSessio!.treeniRutiiniData.nimi,
                          'Unnamed workout',
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      if (widget.treeniSessio != null)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            alignment: WrapAlignment.spaceAround,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.center,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: dateTimeFormat(
                                            'yMd',
                                            widget.treeniSessio!.alku!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '7mlsyz8f' /* 
 */
                                            ,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: dateTimeFormat(
                                            'Hm',
                                            widget.treeniSessio!.alku!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '5fe6fdq5' /*  -  */,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                              'Hm',
                                              widget.treeniSessio!.loppu,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            'Ei lopetettu',
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '7yngkmsu' /* Kesto:
 */
                                            ,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: functions.durationFromStartEnd(
                                              widget.treeniSessio!.alku,
                                              widget.treeniSessio!.loppu,
                                              FFLocalizations.of(context)
                                                  .languageCode),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'qfw31zro' /* Liikkeitä:
 */
                                              ,
                                            ),
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              widget.treeniSessio!
                                                  .treeniRutiiniData.liikkeet
                                                  ?.toList()
                                                  ?.length
                                                  ?.toString(),
                                              '0',
                                            ),
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      textAlign: TextAlign.center,
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 8.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    logFirebaseEvent('SESSIO_COMP_Icon_q579ijmn_ON_TAP');
                    logFirebaseEvent('Icon_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Color(0x00000000),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: BottomSheetRutiiniJaSessioWidget(
                            rutiiniData: widget.treeniSessio!.treeniRutiiniData,
                            treeniSessioDoc: widget.treeniSessio,
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
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  thickness: 1.0,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    widget.treeniSessio!.treeniRutiiniData.kommentti!,
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.rutiininLiikkeetModel,
                    updateCallback: () => setState(() {}),
                    child: RutiininLiikkeetWidget(
                      rutiini: widget.treeniSessio!.treeniRutiiniData,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Visibility(
                    visible: true,
                    child: Wrap(
                      spacing: 0.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Visibility(
                          visible: false,
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button_muokkaa pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'zg2n2e21' /* Muokkaa */,
                            ),
                            options: FFButtonOptions(
                              width: 120.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SESSIO_COMP_Button_uudestaan_ON_TAP');
                            logFirebaseEvent('Button_uudestaan_backend_call');

                            final treeniSessiotCreateData = {
                              ...createTreeniSessiotRecordData(
                                userRef: currentUserReference,
                                isEditing: false,
                                treeniRutiiniData: updateTreeniRutiiniStruct(
                                  widget.treeniSessio!.treeniRutiiniData,
                                  clearUnsetFields: false,
                                ),
                              ),
                              'docCreatedTime': FieldValue.serverTimestamp(),
                            };
                            var treeniSessiotRecordReference =
                                TreeniSessiotRecord.collection.doc();
                            await treeniSessiotRecordReference
                                .set(treeniSessiotCreateData);
                            _model.newSessioWithRutiini =
                                TreeniSessiotRecord.getDocumentFromData(
                                    treeniSessiotCreateData,
                                    treeniSessiotRecordReference);
                            logFirebaseEvent('Button_uudestaan_custom_action');
                            _model.rutiiniJson =
                                await actions.rutiiniToJsonFirestoreData(
                              widget.treeniSessio!.treeniRutiiniData,
                            );
                            logFirebaseEvent(
                                'Button_uudestaan_update_app_state');
                            FFAppState().update(() {
                              FFAppState().valittuTreenattavaTreeniRutiini =
                                  _model.rutiiniJson!;
                              FFAppState().navBarIndex = 1;
                            });

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'h16b2vng' /* Treenaa uudestaan */,
                          ),
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
