import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenaaminen/liike_treenaaminen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'treenaa_sivu_model.dart';
export 'treenaa_sivu_model.dart';

class TreenaaSivuWidget extends StatefulWidget {
  const TreenaaSivuWidget({
    Key? key,
    this.sessioRef,
    this.rutiinipohja,
  }) : super(key: key);

  final DocumentReference? sessioRef;
  final TreeniRutiiniStruct? rutiinipohja;

  @override
  _TreenaaSivuWidgetState createState() => _TreenaaSivuWidgetState();
}

class _TreenaaSivuWidgetState extends State<TreenaaSivuWidget> {
  late TreenaaSivuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreenaaSivuModel());

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

    return StreamBuilder<List<TreeniSessiotRecord>>(
      stream: queryTreeniSessiotRecord(
        queryBuilder: (treeniSessiotRecord) => treeniSessiotRecord
            .where('userRef', isEqualTo: currentUserReference)
            .orderBy('docCreatedTime', descending: true),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50.0,
              ),
            ),
          );
        }
        List<TreeniSessiotRecord> containerTreeniSessiotRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerTreeniSessiotRecord =
            containerTreeniSessiotRecordList.isNotEmpty
                ? containerTreeniSessiotRecordList.first
                : null;
        return Container(
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 150.0),
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.rutiininnimiController ??=
                                              TextEditingController(
                                        text: containerTreeniSessiotRecord!
                                            .treeniRutiiniData.nimi,
                                      ),
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.rutiininnimiController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      onFieldSubmitted: (_) async {
                                        final treeniSessiotUpdateData =
                                            createTreeniSessiotRecordData(
                                          treeniRutiiniData:
                                              createTreeniRutiiniStruct(
                                            nimi: _model
                                                .rutiininnimiController.text,
                                            clearUnsetFields: false,
                                          ),
                                        );
                                        await widget.sessioRef!
                                            .update(treeniSessiotUpdateData);
                                      },
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'y2ovng6h' /* Rutiinin nimi */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                                          _model.rutiiniKommenttiController ??=
                                              TextEditingController(
                                        text: containerTreeniSessiotRecord!
                                            .kommentti,
                                      ),
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.rutiiniKommenttiController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      onFieldSubmitted: (_) async {
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
                                        await widget.sessioRef!
                                            .update(treeniSessiotUpdateData);
                                      },
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'mdlqfic5' /*  */,
                                        ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'zpecqtzq' /* Kommentti (vapaaehtoinen) */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 14.0,
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLines: null,
                                      minLines: 1,
                                      validator: _model
                                          .rutiiniKommenttiControllerValidator
                                          .asValidator(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final rutiininLiikkeet =
                                    containerTreeniSessiotRecord!
                                            .treeniRutiiniData.liikkeet
                                            ?.toList()
                                            ?.toList() ??
                                        [];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      List.generate(rutiininLiikkeet.length,
                                          (rutiininLiikkeetIndex) {
                                    final rutiininLiikkeetItem =
                                        rutiininLiikkeet[rutiininLiikkeetIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: LiikeTreenaaminenWidget(
                                        key: Key(
                                            'Keyr68_${rutiininLiikkeetIndex}_of_${rutiininLiikkeet.length}'),
                                        liike: rutiininLiikkeetItem,
                                        liikeIndexInList: rutiininLiikkeetIndex,
                                        treeniSessio:
                                            containerTreeniSessiotRecord,
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: InkWell(
                    onTap: () async {
                      _model.luotuTyhjaSarja = await actions.createSarjaList();
                      _model.luotuLiike = await actions.createLiike(
                        null,
                        null,
                        null,
                        null,
                        _model.luotuTyhjaSarja?.toList(),
                      );

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
                      await widget.sessioRef!.update(treeniSessiotUpdateData);

                      setState(() {});
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
                                'c9ll95ki' /* Lisää  liike */,
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
