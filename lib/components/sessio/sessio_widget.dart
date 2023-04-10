import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/components/sessio_liike_sarjas/sessio_liike_sarjas_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
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
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: (widget.treeniSessio!.alku == null) ||
                (widget.treeniSessio!.loppu == null) ||
                widget.treeniSessio!.isEditing!
            ? FlutterFlowTheme.of(context).activeWidgetBackground
            : FlutterFlowTheme.of(context).inactiveWidgetBackground,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Container(
        width: double.infinity,
        color: Color(0x00000000),
        child: ExpandableNotifier(
          initialExpanded: false,
          child: ExpandablePanel(
            header: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 22.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.treeniSessio != null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Wrap(
                              spacing: 22.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SESSIO_COMP_RichText_7vt6koup_ON_TAP');
                                        logFirebaseEvent(
                                            'RichText_date_time_picker');
                                        final _datePicked1Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050),
                                        );

                                        TimeOfDay? _datePicked1Time;
                                        if (_datePicked1Date != null) {
                                          _datePicked1Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                          );
                                        }

                                        if (_datePicked1Date != null &&
                                            _datePicked1Time != null) {
                                          setState(() {
                                            _model.datePicked1 = DateTime(
                                              _datePicked1Date.year,
                                              _datePicked1Date.month,
                                              _datePicked1Date.day,
                                              _datePicked1Time!.hour,
                                              _datePicked1Time.minute,
                                            );
                                          });
                                        }
                                        logFirebaseEvent(
                                            'RichText_backend_call');

                                        final treeniSessiotUpdateData =
                                            createTreeniSessiotRecordData(
                                          alku: _model.datePicked1,
                                        );
                                        await widget.treeniSessio!.reference
                                            .update(treeniSessiotUpdateData);
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: dateTimeFormat(
                                                'd/M/y',
                                                widget.treeniSessio!.alku!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '5jsli42l' /* 
 */
                                                ,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'Hm',
                                                  widget.treeniSessio!.alku,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Ei aloitettu',
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'w3ztekll' /*  -  */,
                                              ),
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'Hm',
                                                  widget.treeniSessio!.loppu,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Ei lopetettu',
                                              ),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SESSIO_COMP_RichText_mfk9zdp2_ON_TAP');
                                        logFirebaseEvent(
                                            'RichText_date_time_picker');
                                        final _datePicked2Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050),
                                        );

                                        TimeOfDay? _datePicked2Time;
                                        if (_datePicked2Date != null) {
                                          _datePicked2Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                          );
                                        }

                                        if (_datePicked2Date != null &&
                                            _datePicked2Time != null) {
                                          setState(() {
                                            _model.datePicked2 = DateTime(
                                              _datePicked2Date.year,
                                              _datePicked2Date.month,
                                              _datePicked2Date.day,
                                              _datePicked2Time!.hour,
                                              _datePicked2Time.minute,
                                            );
                                          });
                                        }
                                        logFirebaseEvent(
                                            'RichText_backend_call');

                                        final treeniSessiotUpdateData =
                                            createTreeniSessiotRecordData(
                                          loppu: _model.datePicked2,
                                        );
                                        await widget.treeniSessio!.reference
                                            .update(treeniSessiotUpdateData);
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'ydiiiguc' /* Kesto:
 */
                                                ,
                                              ),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            TextSpan(
                                              text: functions
                                                  .durationFromStartEnd(
                                                      widget.treeniSessio!.alku,
                                                      widget
                                                          .treeniSessio!.loppu,
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
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
                                                'y6vzjpet' /* Liikkeitä:
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
                                              .bodyMedium,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (valueOrDefault<bool>(
                            widget.treeniSessio!.treeniRutiiniData.nimi !=
                                    null &&
                                widget.treeniSessio!.treeniRutiiniData.nimi !=
                                    '',
                            false,
                          ))
                            Text(
                              widget.treeniSessio!.treeniRutiiniData.nimi!,
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                          if (widget.treeniSessio!.treeniRutiiniData.nimi ==
                                  null ||
                              widget.treeniSessio!.treeniRutiiniData.nimi == '')
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: dateTimeFormat(
                                      'EEEE',
                                      widget.treeniSessio!.alku!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'vjrwisv6' /*  treeni */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          if (widget.treeniSessio!.treeniRutiiniData
                                      .kommentti !=
                                  null &&
                              widget.treeniSessio!.treeniRutiiniData
                                      .kommentti !=
                                  '')
                            SelectionArea(
                                child: Text(
                              widget.treeniSessio!.treeniRutiiniData.kommentti!
                                  .maybeHandleOverflow(
                                maxChars: 50,
                                replacement: '…',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            )),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 8.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('SESSIO_COMP_Icon_vthfjdmh_ON_TAP');
                        logFirebaseEvent('Icon_bottom_sheet');
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x00000000),
                          context: context,
                          builder: (bottomSheetContext) {
                            return Padding(
                              padding:
                                  MediaQuery.of(bottomSheetContext).viewInsets,
                              child: BottomSheetRutiiniJaSessioWidget(
                                rutiiniData:
                                    widget.treeniSessio!.treeniRutiiniData,
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
                ),
              ],
            ),
            collapsed: Container(
              width: 100.0,
              height: 0.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            expanded: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 1.0,
                  ),
                  Builder(
                    builder: (context) {
                      final sessionLiikkeet = widget
                              .treeniSessio!.treeniRutiiniData.liikkeet
                              ?.toList()
                              ?.toList() ??
                          [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: sessionLiikkeet.length,
                        itemBuilder: (context, sessionLiikkeetIndex) {
                          final sessionLiikkeetItem =
                              sessionLiikkeet[sessionLiikkeetIndex];
                          return wrapWithModel(
                            model: _model.sessioLiikeSarjasModels.getModel(
                              sessionLiikkeetItem.createdTime!.toString(),
                              sessionLiikkeetIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: SessioLiikeSarjasWidget(
                              key: Key(
                                'Keyfln_${sessionLiikkeetItem.createdTime!.toString()}',
                              ),
                              liikeIndexInList: sessionLiikkeetIndex,
                              liike: sessionLiikkeetItem,
                              treeniSessio: widget.treeniSessio,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  if (widget.treeniSessio!.loppu == null)
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('SESSIO_COMP_Button_uudestaan_ON_TAP');
                        logFirebaseEvent('Button_uudestaan_custom_action');
                        await actions.updateTreenisessiotRecord(
                          null,
                          null,
                          null,
                          widget.treeniSessio!.treeniRutiiniData,
                          false,
                          null,
                          true,
                          null,
                        );
                        logFirebaseEvent(
                            'Button_uudestaan_start_periodic_action');
                        _model.instantTimer = InstantTimer.periodic(
                          duration: Duration(milliseconds: 100),
                          callback: (timer) async {
                            if (widget.treeniSessio != null
                                ? (widget.treeniSessio!.loppu == null)
                                : false) {
                              logFirebaseEvent(
                                  'Button_uudestaan_update_app_state');
                              _model.updatePage(() {
                                FFAppState().navBarIndex = 1;
                              });
                              logFirebaseEvent(
                                  'Button_uudestaan_stop_periodic_action');
                              null?.cancel();
                              return;
                            } else {
                              return;
                            }
                          },
                          startImmediately: true,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'hmew5d0m' /* Treenaa uudestaan */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                        elevation: 2.0,
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
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: false,
            ),
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
