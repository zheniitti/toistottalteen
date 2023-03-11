import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiini_model.dart';
export 'rutiini_model.dart';

class RutiiniWidget extends StatefulWidget {
  const RutiiniWidget({
    Key? key,
    this.rutiini,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;

  @override
  _RutiiniWidgetState createState() => _RutiiniWidgetState();
}

class _RutiiniWidgetState extends State<RutiiniWidget> {
  late RutiiniModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutiiniModel());

    _model.textController1 ??=
        TextEditingController(text: widget.rutiini?.nimi);
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
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
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 0.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _model.textController1,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController1',
                          Duration(milliseconds: 2000),
                          () async {
                            logFirebaseEvent(
                                'RUTIINI_TextField_oho31lin_ON_TEXTFIELD_');
                            logFirebaseEvent('TextField_custom_action');
                            await actions.myUpdateTreenirutiini(
                              widget.rutiini,
                              null,
                              null,
                              null,
                              null,
                              null,
                              _model.textController1.text,
                              null,
                              widget.rutiini?.liikkeet?.toList()?.toList(),
                              null,
                              null,
                              null,
                              null,
                              true,
                            );
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            'yi3kozht' /* Treenipohjan nimi */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
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
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Roboto',
                              fontSize: 20.0,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        minLines: 1,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (false)
                            Text(
                              valueOrDefault<String>(
                                widget.rutiini?.kommentti != null &&
                                        widget.rutiini?.kommentti != ''
                                    ? widget.rutiini?.kommentti
                                    : FFLocalizations.of(context)
                                        .getVariableText(
                                        fiText: 'Treenipohjan kommentti 💬',
                                        enText: 'Routine comment 💬',
                                      ),
                                '💬',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                  ),
                            ),
                          TextFormField(
                            controller: _model.textController2,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController2',
                              Duration(milliseconds: 2000),
                              () async {
                                logFirebaseEvent(
                                    'RUTIINI_TextField_jv40h5qj_ON_TEXTFIELD_');
                                logFirebaseEvent('TextField_custom_action');
                                await actions.myUpdateTreenirutiini(
                                  widget.rutiini,
                                  null,
                                  null,
                                  null,
                                  null,
                                  null,
                                  _model.textController1.text,
                                  null,
                                  widget.rutiini?.liikkeet?.toList()?.toList(),
                                  null,
                                  null,
                                  null,
                                  null,
                                  true,
                                );
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'hve3d9eg' /* Treenipohjan kommentti 💬 */,
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
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
                                    ),
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            minLines: 1,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 8.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    logFirebaseEvent('RUTIINI_COMP_Icon_223u20c6_ON_TAP');
                    logFirebaseEvent('Icon_bottom_sheet');
                    await showModalBottomSheet(
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
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  thickness: 1.0,
                ),
                Builder(
                  builder: (context) {
                    final liikkeet =
                        widget.rutiini?.liikkeet?.toList()?.toList() ?? [];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(liikkeet.length, (liikkeetIndex) {
                        final liikkeetItem = liikkeet[liikkeetIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextFormField(
                                        controller: _model.textController3,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController3',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'RUTIINI_TextField_bx35mkk1_ON_TEXTFIELD_');
                                            logFirebaseEvent(
                                                'TextField_custom_action');
                                            await actions.myUpdateLiikeAtIndex(
                                              liikkeetIndex,
                                              widget.rutiini,
                                              _model.textController3.text,
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
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'fku8v94c' /* Liikkeen nimi */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                        textAlign: TextAlign.start,
                                        maxLines: null,
                                        validator: _model
                                            .textController3Validator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller: _model.textController4,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController4',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'RUTIINI_TextField_1p35njsm_ON_TEXTFIELD_');
                                            logFirebaseEvent(
                                                'TextField_custom_action');
                                            await actions.myUpdateLiikeAtIndex(
                                              liikkeetIndex,
                                              widget.rutiini,
                                              null,
                                              _model.textController4.text,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                              null,
                                            );
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'p6ehf4o5' /* Liikkeen kommentti */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14.0,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        textAlign: TextAlign.start,
                                        maxLines: null,
                                        validator: _model
                                            .textController4Validator
                                            .asValidator(context),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          functions
                                              .liikkeenToistot(liikkeetItem),
                                          ' - ',
                                        ),
                                        style: TextStyle(),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                Divider(
                  thickness: 1.0,
                ),
                if (!widget.rutiini!.finishedEditing!)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'RUTIINI_COMP_Row_a4bmbafi_ON_TAP');
                            logFirebaseEvent('Row_custom_action');
                            await actions.myUpdateTreenirutiini(
                              widget.rutiini,
                              true,
                              null,
                              null,
                              null,
                              null,
                              null,
                              null,
                              widget.rutiini?.liikkeet?.toList()?.toList(),
                              null,
                              null,
                              null,
                              null,
                              true,
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
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm9mgmk0g' /* Lisää liike */,
                                ),
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'RUTIINI_COMP_Row_p50usw6f_ON_TAP');
                            logFirebaseEvent('Row_custom_action');
                            await actions.myUpdateTreenirutiini(
                              widget.rutiini,
                              null,
                              null,
                              true,
                              null,
                              null,
                              null,
                              null,
                              widget.rutiini?.liikkeet?.toList()?.toList(),
                              null,
                              null,
                              null,
                              null,
                              true,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'f5f0mc89' /* Lopeta muokkaus */,
                                ),
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.rutiini?.finishedEditing ?? true)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
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
                            width: 120.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'RUTIINI_COMP_TREENAA_NYT_BTN_ON_TAP');
                            logFirebaseEvent('Button_custom_action');
                            _model.rutiiniJson =
                                await actions.jsonRutiiniFromDataStruct(
                              widget.rutiini,
                            );
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().update(() {
                              FFAppState().valittuTreenattavaTreeniRutiini =
                                  _model.rutiiniJson!;
                              FFAppState().navBarIndex = 1;
                            });

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '5o4nggqe' /* Treenaa nyt */,
                          ),
                          options: FFButtonOptions(
                            width: 120.0,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
