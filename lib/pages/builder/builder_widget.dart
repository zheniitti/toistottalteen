import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'builder_model.dart';
export 'builder_model.dart';

class BuilderWidget extends StatefulWidget {
  const BuilderWidget({Key? key}) : super(key: key);

  @override
  _BuilderWidgetState createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget> {
  late BuilderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuilderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'builder'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('BUILDER_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'v1rlq3l4' /* Rakennellaan ja kokeillaan eri... */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondary,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('BUILDER_PAGE_Container_kyp4e9su_ON_TAP');
                    logFirebaseEvent('Container_backend_call');

                    final usersUpdateData = {
                      'treeniRutiinit': getTreeniRutiiniListFirestoreData(
                        (currentUserDocument?.treeniRutiinit?.toList() ?? []),
                      ),
                    };
                    await currentUserReference!.update(usersUpdateData);
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('BUILDER_PAGE_Text_sfpf9cms_ON_TAP');
                        logFirebaseEvent('Text_backend_call');

                        final treeniSessiotCreateData =
                            createTreeniSessiotRecordData(
                          treeniRutiiniData: createTreeniRutiiniStruct(
                            fieldValues: {
                              'liikkeet': [
                                getLiikeFirestoreData(
                                  createLiikeStruct(
                                    nimi: 'ekaliike',
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
                        );
                        var treeniSessiotRecordReference =
                            TreeniSessiotRecord.collection.doc();
                        await treeniSessiotRecordReference
                            .set(treeniSessiotCreateData);
                        _model.asdt = TreeniSessiotRecord.getDocumentFromData(
                            treeniSessiotCreateData,
                            treeniSessiotRecordReference);
                        logFirebaseEvent('Text_backend_call');

                        final treeniSessiotUpdateData =
                            createTreeniSessiotRecordData(
                          treeniRutiiniData: updateTreeniRutiiniStruct(
                            _model.asdt!.treeniRutiiniData,
                            clearUnsetFields: false,
                          ),
                        );
                        await _model.createdSessioDoc!.reference
                            .update(treeniSessiotUpdateData);

                        setState(() {});
                      },
                      child: Text(
                        valueOrDefault<String>(
                          FFLocalizations.of(context).languageCode,
                          'ast',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ),
                if (null ?? true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 200.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'BUILDER_Button_aloitaUusiTreeni_ON_TAP');
                        logFirebaseEvent(
                            'Button_aloitaUusiTreeni_backend_call');

                        final treeniSessiotCreateData = {
                          ...createTreeniSessiotRecordData(
                            userRef: currentUserReference,
                            isEditing: false,
                            treeniRutiiniData: createTreeniRutiiniStruct(
                              isTreeniPohja: false,
                              finishedEditing: true,
                              fieldValues: {
                                'createdTime': FieldValue.serverTimestamp(),
                                'liikkeet': [
                                  getLiikeFirestoreData(
                                    createLiikeStruct(
                                      tehty: false,
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
                          'docCreatedTime': FieldValue.serverTimestamp(),
                        };
                        var treeniSessiotRecordReference =
                            TreeniSessiotRecord.collection.doc();
                        await treeniSessiotRecordReference
                            .set(treeniSessiotCreateData);
                        _model.createdSessioDoc =
                            TreeniSessiotRecord.getDocumentFromData(
                                treeniSessiotCreateData,
                                treeniSessiotRecordReference);

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'u76vj92f' /* Aloita uusi treeni */,
                      ),
                      options: FFButtonOptions(
                        width: 240.0,
                        height: 70.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).secondary,
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
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
