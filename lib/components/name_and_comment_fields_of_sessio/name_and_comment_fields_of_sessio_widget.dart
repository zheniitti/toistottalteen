import '/auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'name_and_comment_fields_of_sessio_model.dart';
export 'name_and_comment_fields_of_sessio_model.dart';

class NameAndCommentFieldsOfSessioWidget extends StatefulWidget {
  const NameAndCommentFieldsOfSessioWidget({
    Key? key,
    this.sessioDoc,
  }) : super(key: key);

  final TreeniSessiotRecord? sessioDoc;

  @override
  _NameAndCommentFieldsOfSessioWidgetState createState() =>
      _NameAndCommentFieldsOfSessioWidgetState();
}

class _NameAndCommentFieldsOfSessioWidgetState
    extends State<NameAndCommentFieldsOfSessioWidget>
    with TickerProviderStateMixin {
  late NameAndCommentFieldsOfSessioModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameAndCommentFieldsOfSessioModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAME_AND_COMMENT_FIELDS_OF_SESSIO_nameAn');
      logFirebaseEvent('nameAndCommentFieldsOfSessio_update_widg');
      _model.sessioDoc = widget.sessioDoc;
    });

    _model.rutiininnimiController ??=
        TextEditingController(text: widget.sessioDoc!.treeniRutiiniData.nimi);
    _model.rutiiniKommenttiController ??= TextEditingController(
        text: widget.sessioDoc!.treeniRutiiniData.kommentti);

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
    // Do not delete -->
    if (_model.sessioDoc?.docCreatedTime != widget.sessioDoc!.docCreatedTime) {
      _model.rutiininnimiController.text = widget.sessioDoc!.treeniRutiiniData.nimi ?? '';
      _model.rutiiniKommenttiController.text = widget.sessioDoc!.treeniRutiiniData.kommentti ?? '';
      _model.sessioDoc = widget.sessioDoc;
    }
    // <-- Do not delete end

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 640.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xB2FFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => Autocomplete<String>(
                    initialValue: TextEditingValue(
                        text: widget.sessioDoc!.treeniRutiiniData.nimi!),
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return functions
                          .mapRutiiniNimet(
                              (currentUserDocument?.treeniRutiinit?.toList() ??
                                      [])
                                  .toList())
                          .toList()
                          .where((option) {
                        final lowercaseOption = option.toLowerCase();
                        return lowercaseOption
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return AutocompleteOptionsList(
                        textFieldKey: _model.rutiininnimiKey,
                        textController: _model.rutiininnimiController!,
                        options: options.toList(),
                        onSelected: onSelected,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        textHighlightStyle: TextStyle(),
                        elevation: 4.0,
                        optionBackgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        optionHighlightColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        maxHeight: 200.0,
                      );
                    },
                    onSelected: (String selection) {
                      setState(
                          () => _model.rutiininnimiSelectedOption = selection);
                      FocusScope.of(context).unfocus();
                    },
                    fieldViewBuilder: (
                      context,
                      textEditingController,
                      focusNode,
                      onEditingComplete,
                    ) {
                      _model.rutiininnimiController = textEditingController;
                      return TextFormField(
                        key: _model.rutiininnimiKey,
                        controller: textEditingController,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.rutiininnimiController',
                          Duration(milliseconds: 1000),
                          () async {
                            logFirebaseEvent(
                                'NAME_AND_COMMENT_FIELDS_OF_SESSIO_rutiin');
                            logFirebaseEvent('rutiininnimi_custom_action');
                            _model.updatedRutiiniFromNimiField =
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
                              true,
                              null,
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
                            logFirebaseEvent('rutiininnimi_backend_call');

                            final treeniSessiotUpdateData =
                                createTreeniSessiotRecordData(
                              treeniRutiiniData: updateTreeniRutiiniStruct(
                                _model.updatedRutiiniFromNimiField,
                                clearUnsetFields: false,
                              ),
                            );
                            await widget.sessioDoc!.reference
                                .update(treeniSessiotUpdateData);

                            setState(() {});
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: FFLocalizations.of(context).getText(
                            'pah0obna' /* Treenin nimi */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 4.0),
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                        textAlign: TextAlign.center,
                        maxLines: null,
                        minLines: 1,
                        validator: _model.rutiininnimiControllerValidator
                            .asValidator(context),
                      );
                    },
                  ),
                ),
                TextFormField(
                  controller: _model.rutiiniKommenttiController,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.rutiiniKommenttiController',
                    Duration(milliseconds: 1000),
                    () async {
                      logFirebaseEvent(
                          'NAME_AND_COMMENT_FIELDS_OF_SESSIO_rutiin');
                      logFirebaseEvent('rutiiniKommentti_custom_action');
                      _model.updatedRutiiniFromNimiFieldCopy =
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
                        true,
                        null,
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
                      logFirebaseEvent('rutiiniKommentti_backend_call');

                      final treeniSessiotUpdateData =
                          createTreeniSessiotRecordData(
                        treeniRutiiniData: updateTreeniRutiiniStruct(
                          _model.updatedRutiiniFromNimiFieldCopy,
                          clearUnsetFields: false,
                        ),
                      );
                      await widget.sessioDoc!.reference
                          .update(treeniSessiotUpdateData);

                      setState(() {});
                    },
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: null,
                    hintText: FFLocalizations.of(context).getText(
                      'b5n4twdx' /* Kommentti (vapaaehtoinen) */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodySmall,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: null,
                  validator: _model.rutiiniKommenttiControllerValidator
                      .asValidator(context),
                ),
              ],
            ),
          ),
          if (false)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
              child: Icon(
                Icons.add_comment_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
            ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
