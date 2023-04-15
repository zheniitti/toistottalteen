import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_liike/bottom_sheet_liike_widget.dart';
import '/components/sarjat_treenin_aikana/sarjat_treenin_aikana_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
    'containerOnPageLoadAnimation': AnimationInfo(
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
          color:
              functions.isAllSarjaDone(widget.liike?.sarjat?.toList()?.toList())
                  ? FlutterFlowTheme.of(context).inactiveWidgetBackground
                  : FlutterFlowTheme.of(context).activeWidgetBackground,
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
                        child: AuthUserStreamWidget(
                          builder: (context) => Autocomplete<String>(
                            initialValue:
                                TextEditingValue(text: widget.liike!.nimi!),
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return (currentUserDocument?.liikeNames
                                          ?.toList() ??
                                      [])
                                  .toList()
                                  .where((option) {
                                final lowercaseOption = option.toLowerCase();
                                return lowercaseOption.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return AutocompleteOptionsList(
                                textFieldKey: _model.textFieldKey1,
                                textController: _model.textController1!,
                                options: options.toList(),
                                onSelected: onSelected,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                textHighlightStyle: TextStyle(),
                                elevation: 4.0,
                                optionBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                optionHighlightColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                maxHeight: 200.0,
                              );
                            },
                            onSelected: (String selection) {
                              setState(() =>
                                  _model.textFieldSelectedOption1 = selection);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (
                              context,
                              textEditingController,
                              focusNode,
                              onEditingComplete,
                            ) {
                              _model.textController1 = textEditingController;
                              return TextFormField(
                                key: _model.textFieldKey1,
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController1',
                                  Duration(milliseconds: 1000),
                                  () async {
                                    logFirebaseEvent(
                                        'LIIKE_TREENIN_AIKANA_TextField_fgw8ho34_');
                                    logFirebaseEvent('TextField_custom_action');
                                    _model.updatedLiike =
                                        await actions.myUpdateLiikeStruct(
                                      widget.liike,
                                      null,
                                      _model.textController1.text,
                                      _model.textController2.text,
                                      null,
                                      null,
                                      null,
                                      null,
                                      null,
                                      null,
                                      null,
                                      false,
                                      null,
                                      null,
                                      null,
                                    );
                                    logFirebaseEvent('TextField_custom_action');
                                    _model.updatedRutiini = await actions
                                        .myUpdateTreeniRutiiniStruct(
                                      widget.treeniSessio!.treeniRutiiniData,
                                      null,
                                      null,
                                      widget.treeniSessio!.treeniRutiiniData
                                          .liikkeet
                                          ?.toList()
                                          ?.toList(),
                                      null,
                                      null,
                                      null,
                                      false,
                                      null,
                                      null,
                                      null,
                                      null,
                                      null,
                                      widget.liikeIndexInList,
                                      _model.updatedLiike,
                                      null,
                                      FFAppState().kopioidutLiikkeet.toList(),
                                      false,
                                      false,
                                    );
                                    logFirebaseEvent('TextField_backend_call');

                                    final treeniSessiotUpdateData =
                                        createTreeniSessiotRecordData(
                                      treeniRutiiniData:
                                          updateTreeniRutiiniStruct(
                                        _model.updatedRutiini,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await widget.treeniSessio!.reference
                                        .update(treeniSessiotUpdateData);

                                    setState(() {});
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: FFLocalizations.of(context).getText(
                                    '29oo50bm' /* Liikkeen nimi */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      lineHeight: 1.0,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                                minLines: 1,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                      ),
                      if (!widget.liike!.tehty! ||
                          (widget.liike?.kommentti != null &&
                              widget.liike?.kommentti != '') ||
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: TextFormField(
                            controller: _model.textController2,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController2',
                              Duration(milliseconds: 500),
                              () async {
                                logFirebaseEvent(
                                    'LIIKE_TREENIN_AIKANA_TextField_rwco0ti2_');
                                logFirebaseEvent('TextField_custom_action');
                                _model.updatedLiikeCopy =
                                    await actions.myUpdateLiikeStruct(
                                  widget.liike,
                                  null,
                                  _model.textController1.text,
                                  _model.textController2.text,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                );
                                logFirebaseEvent('TextField_custom_action');
                                _model.updatedRutiiniCopy =
                                    await actions.myUpdateTreeniRutiiniStruct(
                                  widget.treeniSessio!.treeniRutiiniData,
                                  null,
                                  null,
                                  widget
                                      .treeniSessio!.treeniRutiiniData.liikkeet
                                      ?.toList()
                                      ?.toList(),
                                  null,
                                  null,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  widget.liikeIndexInList,
                                  _model.updatedLiike,
                                  null,
                                  FFAppState().kopioidutLiikkeet.toList(),
                                  null,
                                  null,
                                );
                                logFirebaseEvent('TextField_backend_call');

                                final treeniSessiotUpdateData =
                                    createTreeniSessiotRecordData(
                                  treeniRutiiniData: updateTreeniRutiiniStruct(
                                    _model.updatedRutiini,
                                    clearUnsetFields: false,
                                  ),
                                );
                                await widget.treeniSessio!.reference
                                    .update(treeniSessiotUpdateData);

                                setState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: FFLocalizations.of(context).getText(
                                'l7w663ju' /* Kommentti (vapaaehtoinen) */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  lineHeight: 1.0,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 20,
                            minLines: 1,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
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
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'LIIKE_TREENIN_AIKANA_Icon_more_ON_TAP');
                            logFirebaseEvent('Icon_more_bottom_sheet');
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x00FFFFFF),
                              context: context,
                              builder: (bottomSheetContext) {
                                return Padding(
                                  padding: MediaQuery.of(bottomSheetContext)
                                      .viewInsets,
                                  child: BottomSheetLiikeWidget(
                                    sessioDoc: widget.treeniSessio,
                                    liikeIndex: valueOrDefault<int>(
                                      widget.liikeIndexInList,
                                      99999999999,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Icon(
                            Icons.more_vert_rounded,
                            color: FlutterFlowTheme.of(context).primary,
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
              height: 1.0,
              thickness: 1.0,
            ),
            wrapWithModel(
              model: _model.sarjatTreeninAikanaModel,
              updateCallback: () => setState(() {}),
              child: SarjatTreeninAikanaWidget(
                liikeIndexInList: widget.liikeIndexInList,
                liike: widget.liike,
                treeniSessio: widget.treeniSessio,
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
