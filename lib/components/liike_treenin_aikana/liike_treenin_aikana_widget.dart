import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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

class _LiikeTreeninAikanaWidgetState extends State<LiikeTreeninAikanaWidget> {
  late LiikeTreeninAikanaModel _model;

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
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).c797979,
            width: 1.0,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController1,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
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
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.0,
                                  ),
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          minLines: 1,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                      if (widget.liike?.showComment ?? true)
                        TextFormField(
                          controller: _model.textController2,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
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
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
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
                if (!widget.liike!.showComment!)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                    child: Icon(
                      Icons.add_comment_rounded,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 24.0,
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
                                        child: TextFormField(
                                          controller: _model.textController3 ??=
                                              TextEditingController(
                                            text: sarjatItem.toistoMaara
                                                ?.toString(),
                                          ),
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController3',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'vzw2070w' /* 0 */,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
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
                                                fontSize: 20.0,
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                          inputFormatters: [
                                            _model.textFieldMask3
                                          ],
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
                                        child: TextFormField(
                                          controller: _model.textController4 ??=
                                              TextEditingController(
                                            text: sarjatItem.paino?.toString(),
                                          ),
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController4',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'utdud272' /* 0 */,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
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
                                              .title3,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController4Validator
                                              .asValidator(context),
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
                    );
                  }),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Wrap(
                          spacing: 50.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 6.0),
                              child: InkWell(
                                onTap: () async {
                                  setState(() {});

                                  final treeniSessiotUpdateData =
                                      createTreeniSessiotRecordData(
                                    treeniRutiiniData:
                                        createTreeniRutiiniStruct(
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
                                        size: 30.0,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'dxvry4te' /* lisää sarja */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 8.0, 6.0),
                          child: InkWell(
                            onTap: () async {
                              setState(() {});

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
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor: Color(0xFFF5F5F5),
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue ??=
                                        widget.liike!.tehty!,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue = newValue!);
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
