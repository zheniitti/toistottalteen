import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenaaminen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'treenaaminen_sivu_model.dart';
export 'treenaaminen_sivu_model.dart';

class TreenaaminenSivuWidget extends StatefulWidget {
  const TreenaaminenSivuWidget({
    Key? key,
    this.userAppData,
    this.rutiininNimi,
  }) : super(key: key);

  final AppDataRecord? userAppData;
  final String? rutiininNimi;

  @override
  _TreenaaminenSivuWidgetState createState() => _TreenaaminenSivuWidgetState();
}

class _TreenaaminenSivuWidgetState extends State<TreenaaminenSivuWidget> {
  late TreenaaminenSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreenaaminenSivuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.treeniRutiini?.nimi == null || _model.treeniRutiini?.nimi == '') {
        if (widget.rutiininNimi != null && widget.rutiininNimi != '') {
          setState(() {
            _model.treeniRutiini = functions.getTreeniRutiiniByName(widget.userAppData!.treeniRutiinit!.toList().toList(), widget.rutiininNimi);
          });

          final treeniSessiotCreateData = createTreeniSessiotRecordData(
            userRef: currentUserReference,
            treeniRutiiniData: updateTreeniRutiiniStruct(
              _model.treeniRutiini,
              clearUnsetFields: false,
            ),
          );
          var treeniSessiotRecordReference = TreeniSessiotRecord.collection.doc();
          await treeniSessiotRecordReference.set(treeniSessiotCreateData);
          _model.treeniSessio = TreeniSessiotRecord.getDocumentFromData(treeniSessiotCreateData, treeniSessiotRecordReference);
        }
      }
    });

    _model.rutiininnimiController ??= TextEditingController(text: _model.treeniRutiini?.nimi);
    _model.rutiiniKommenttiController ??= TextEditingController(text: _model.treeniRutiini?.kommentti);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'd3nmcgqj' /* Aikaa kulunut: 29 mim */,
              ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                  ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.not_started_rounded,
                color: FlutterFlowTheme.of(context).secondaryColor,
                size: 30.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'm4nghcy9' /* Aloita */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 12.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 150.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 640.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextFormField(
                                        controller: _model.rutiininnimiController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.rutiininnimiController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        onFieldSubmitted: (_) async {
                                          final treeniSessiotUpdateData = createTreeniSessiotRecordData(
                                            treeniRutiiniData: createTreeniRutiiniStruct(
                                              nimi: _model.rutiininnimiController.text,
                                              clearUnsetFields: false,
                                            ),
                                          );
                                          await _model.treeniSessio!.reference.update(treeniSessiotUpdateData);
                                        },
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context).getText(
                                            'x4q0c5hj' /* Rutiinin nimi */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                fontFamily: 'Roboto',
                                                fontSize: 20.0,
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
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context).title3,
                                        textAlign: TextAlign.center,
                                        maxLines: 4,
                                        minLines: 1,
                                        validator: _model.rutiininnimiControllerValidator.asValidator(context),
                                      ),
                                      TextFormField(
                                        controller: _model.rutiiniKommenttiController,
                                        onFieldSubmitted: (_) async {
                                          final treeniSessiotUpdateData = createTreeniSessiotRecordData(
                                            treeniRutiiniData: createTreeniRutiiniStruct(
                                              kommentti: _model.rutiiniKommenttiController.text,
                                              clearUnsetFields: false,
                                            ),
                                          );
                                          await _model.treeniSessio!.reference.update(treeniSessiotUpdateData);
                                        },
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context).getText(
                                            '87ajo4v7' /*  */,
                                          ),
                                          hintText: FFLocalizations.of(context).getText(
                                            'x5r59ypf' /* Kommentti (vapaaehtoinen) */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context).subtitle2.override(
                                              fontFamily: 'Roboto',
                                              fontSize: 14.0,
                                            ),
                                        maxLines: null,
                                        minLines: 1,
                                        validator: _model.rutiiniKommenttiControllerValidator.asValidator(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final rutiininLiikkeet = _model.treeniRutiini?.liikkeet?.toList()?.toList() ?? [];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(rutiininLiikkeet.length, (rutiininLiikkeetIndex) {
                                      final rutiininLiikkeetItem = rutiininLiikkeet[rutiininLiikkeetIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                        child: LiikeTreenaaminenWidget(
                                          key: Key('Keys1j_${rutiininLiikkeetIndex}_of_${rutiininLiikkeet.length}'),
                                          liike: rutiininLiikkeetItem,
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: InkWell(
                      onTap: () async {
                        final treeniSessiotUpdateData = createTreeniSessiotRecordData(
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
                        await _model.treeniSessio!.reference.update(treeniSessiotUpdateData);
                      },
                      child: Container(
                        width: 150.0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                              child: Icon(
                                Icons.add_rounded,
                                color: FlutterFlowTheme.of(context).secondaryColor,
                                size: 30.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '3aek1fwt' /* Lisää  liike */,
                                ),
                                style: FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
