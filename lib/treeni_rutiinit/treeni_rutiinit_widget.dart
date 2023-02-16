import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/treeni_rutiini_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../luo_rutiini_sivu/luo_rutiini_sivu_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'treeni_rutiinit_model.dart';
export 'treeni_rutiinit_model.dart';

class TreeniRutiinitWidget extends StatefulWidget {
  const TreeniRutiinitWidget({Key? key}) : super(key: key);

  @override
  _TreeniRutiinitWidgetState createState() => _TreeniRutiinitWidgetState();
}

class _TreeniRutiinitWidgetState extends State<TreeniRutiinitWidget> {
  late TreeniRutiinitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreeniRutiinitModel());
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

    return StreamBuilder<List<EsimerkkiDataRecord>>(
      stream: queryEsimerkkiDataRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<EsimerkkiDataRecord> treeniRutiinitEsimerkkiDataRecordList =
            snapshot.data!;
        final treeniRutiinitEsimerkkiDataRecord =
            treeniRutiinitEsimerkkiDataRecordList.isNotEmpty
                ? treeniRutiinitEsimerkkiDataRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: LuoRutiiniSivuWidget(),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            icon: Icon(
              Icons.add,
            ),
            elevation: 8,
            label: Text(
              FFLocalizations.of(context).getText(
                't1qezc6y' /* Luo treenirutiini */,
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                  ),
            ),
          ),
          drawer: Drawer(
            elevation: 16,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'tki5o3m2' /* Luo tili */,
                            ),
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'n2lnw1tc' /* Treenirutiinit */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'xdjt7h9s' /* Treenihistoria */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'qz51yime' /* Analytiikka */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'h5cqva6j' /* Asetukset */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'y2oim1eg' /* Lähetä palaute */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'mqf5zmpq' /* Tietosuoja ja käyttöehdot */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              FFLocalizations.of(context).getText(
                'uwbd7u0v' /* Treenirutiinit */,
              ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                  ),
            ),
            actions: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                    child: Icon(
                      Icons.add_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: StreamBuilder<List<AppDataRecord>>(
                stream: queryAppDataRecord(
                  queryBuilder: (appDataRecord) => appDataRecord
                      .where('userRef', isEqualTo: currentUserReference)
                      .orderBy('docCreatedTime'),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitCircle(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<AppDataRecord> backGroundContainerAppDataRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final backGroundContainerAppDataRecord =
                      backGroundContainerAppDataRecordList.isNotEmpty
                          ? backGroundContainerAppDataRecordList.first
                          : null;
                  return InkWell(
                    onTap: () async {
                      if (backGroundContainerAppDataRecord!.treeniRutiinit!
                              .toList()
                              .length ==
                          0) {
                        final appDataUpdateData = {
                          'treeniRutiinit': getTreeniRutiiniListFirestoreData(
                            treeniRutiinitEsimerkkiDataRecord!
                                .esimerkkiRutiinit!
                                .toList(),
                          ),
                          'treeniSessiot': getTreeniSessioListFirestoreData(
                            treeniRutiinitEsimerkkiDataRecord!.esimerkkiSessiot!
                                .toList(),
                          ),
                        };
                        await currentUserDocument!.appDataRef!
                            .update(appDataUpdateData);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(),
                            ),
                            Builder(
                              builder: (context) {
                                final rutiinit =
                                    backGroundContainerAppDataRecord!
                                        .treeniRutiinit!
                                        .toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(rutiinit.length,
                                      (rutiinitIndex) {
                                    final rutiinitItem =
                                        rutiinit[rutiinitIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 8, 16, 6),
                                      child: TreeniRutiiniWidget(
                                        key: Key(
                                            'Key2ve_${rutiinitIndex}_of_${rutiinit.length}'),
                                        treeniRutiini: rutiinitItem,
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            if (backGroundContainerAppDataRecord!
                                    .treeniRutiinit!
                                    .toList()
                                    .length ==
                                0)
                              Builder(
                                builder: (context) {
                                  final rutiinit =
                                      treeniRutiinitEsimerkkiDataRecord!
                                          .esimerkkiRutiinit!
                                          .toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(rutiinit.length,
                                        (rutiinitIndex) {
                                      final rutiinitItem =
                                          rutiinit[rutiinitIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 16, 8),
                                        child: TreeniRutiiniWidget(
                                          key: Key(
                                              'Keynxe_${rutiinitIndex}_of_${rutiinit.length}'),
                                          treeniRutiini: rutiinitItem,
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
