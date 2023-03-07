import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/rutiinit_sivu_widget.dart';
import '/components/treeni_historia_sivu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'paasivu_model.dart';
export 'paasivu_model.dart';

class PaasivuWidget extends StatefulWidget {
  const PaasivuWidget({Key? key}) : super(key: key);

  @override
  _PaasivuWidgetState createState() => _PaasivuWidgetState();
}

class _PaasivuWidgetState extends State<PaasivuWidget> {
  late PaasivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaasivuModel());

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

    return StreamBuilder<List<AppDataRecord>>(
      stream: queryAppDataRecord(
        queryBuilder: (appDataRecord) => appDataRecord
            .where('userRef', isEqualTo: currentUserReference)
            .orderBy('created_time', descending: true),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<AppDataRecord> paasivuAppDataRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final paasivuAppDataRecord = paasivuAppDataRecordList.isNotEmpty
            ? paasivuAppDataRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Visibility(
            visible: false,
            child: FloatingActionButton.extended(
              onPressed: () async {
                context.pushNamed('luoRutiini_sivu');
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              icon: Icon(
                Icons.add,
              ),
              elevation: 8.0,
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
          ),
          drawer: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.drawerModel,
              updateCallback: () => setState(() {}),
              child: DrawerWidget(),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: Icon(
                      Icons.help_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
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
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Stack(
                          children: [
                            if (FFAppState().navBarIndex == 0)
                              wrapWithModel(
                                model: _model.rutiinitSivuModel,
                                updateCallback: () => setState(() {}),
                                child: RutiinitSivuWidget(
                                  appData: paasivuAppDataRecord,
                                ),
                              ),
                            if (FFAppState().navBarIndex == 1)
                              wrapWithModel(
                                model: _model.treeniHistoriaSivuModel,
                                updateCallback: () => setState(() {}),
                                child: TreeniHistoriaSivuWidget(
                                  appData: paasivuAppDataRecord,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 14.0, 16.0, 14.0),
                        child: wrapWithModel(
                          model: _model.navigationBarModel,
                          updateCallback: () => setState(() {}),
                          child: NavigationBarWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
