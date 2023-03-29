import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rutiinin_liikkeet/rutiinin_liikkeet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
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
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: ExpandableNotifier(
                      initialExpanded: false,
                      child: ExpandablePanel(
                        header: Wrap(
                          spacing: 12.0,
                          runSpacing: 2.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'v217xhtu' /* Ylävartalotreeni */,
                              ),
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'cfxbyihj' /* Aloitettu:  */,
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'kyjyqea3' /* 30 min sitten dsltkphklp */,
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                        collapsed: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 0.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.rutiininLiikkeetModel,
                                updateCallback: () => setState(() {}),
                                child: RutiininLiikkeetWidget(
                                  rutiini: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                          iconSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
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
                        style: FlutterFlowTheme.of(context).bodyText1,
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
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle1
                            .override(
                              fontFamily: 'Outfit',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
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
