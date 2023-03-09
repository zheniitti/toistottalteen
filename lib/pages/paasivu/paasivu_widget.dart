import '/backend/backend.dart';
import '/components/navigation_bar/navigation_bar_widget.dart';
import '/components/sivu_rutiinit/sivu_rutiinit_widget.dart';
import '/components/sivu_treenaa_tai_luo_rutiini/sivu_treenaa_tai_luo_rutiini_widget.dart';
import '/components/sivu_treeni_historia/sivu_treeni_historia_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'paasivu'});
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Visibility(
          visible: false,
          child: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
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
            model: _model.sivupalkkiModel,
            updateCallback: () => setState(() {}),
            child: SivupalkkiWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: true,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().navBarIndex == 0)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'uwbd7u0v' /* Treenpohjat (rutiinit) */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                    ),
                  ],
                ),
              if (FFAppState().navBarIndex == 1)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'd9b3r5r8' /* Aikaa kulunut: 29min */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.not_started_rounded,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          size: 30.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'hwbly3hr' /* Aloita ajanotto */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
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
                ),
            ],
          ),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Icon(
                        Icons.help_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
                if ((FFAppState().navBarIndex == 1) && true)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.stop_circle_rounded,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 30.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'wbg0l8iz' /* Lopeta treeni */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
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
              child: Container(
                width: double.infinity,
                height: double.infinity,
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
                                model: _model.sivuRutiinitModel,
                                updateCallback: () => setState(() {}),
                                child: SivuRutiinitWidget(),
                              ),
                            if (FFAppState().navBarIndex == 2)
                              wrapWithModel(
                                model: _model.sivuTreeniHistoriaModel,
                                updateCallback: () => setState(() {}),
                                child: SivuTreeniHistoriaWidget(),
                              ),
                            if ((FFAppState().navBarIndex == 1) ||
                                FFAppState().showTreenaaTaiLuoRutiiniSivu)
                              wrapWithModel(
                                model: _model.sivuTreenaaTaiLuoRutiiniModel,
                                updateCallback: () => setState(() {}),
                                child: SivuTreenaaTaiLuoRutiiniWidget(
                                  sessioRef: FFAppState()
                                      .valittuTreenattavaHistorianSessioRef,
                                  rutiinipohja: _model.treenattavaRutiini,
                                  isEditing: FFAppState().isEditing,
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
        ),
      ),
    );
  }
}
