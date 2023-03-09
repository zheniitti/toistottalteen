import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tilastot_sivu_model.dart';
export 'tilastot_sivu_model.dart';

class TilastotSivuWidget extends StatefulWidget {
  const TilastotSivuWidget({Key? key}) : super(key: key);

  @override
  _TilastotSivuWidgetState createState() => _TilastotSivuWidgetState();
}

class _TilastotSivuWidgetState extends State<TilastotSivuWidget> {
  late TilastotSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TilastotSivuModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'tilastot_sivu'});
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
        title: Text(
          FFLocalizations.of(context).getText(
            'jxhd0x84' /* Analytiikka */,
          ),
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).dadada,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: StreamBuilder<List<TreeniSessiotRecord>>(
                  stream: queryTreeniSessiotRecord(
                    queryBuilder: (treeniSessiotRecord) => treeniSessiotRecord
                        .where('userRef', isEqualTo: currentUserReference)
                        .orderBy('alku', descending: true),
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
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: FlutterFlowBarChart(
                          barData: [
                            FFBarChartData(
                              yData: containerTreeniSessiotRecordList
                                  .map((d) => d.alku)
                                  .toList(),
                              color: FlutterFlowTheme.of(context).gradient2,
                            )
                          ],
                          xLabels:[] /* TODO fix containerEsimerkkiAnalytiikkaDataRecordList
                              .map((d) => d.idPvm)
                              .toList() */,
                          barWidth: 25.0,
                          barBorderRadius: BorderRadius.circular(0.0),
                          groupSpace: 5.0,
                          chartStylingInfo: ChartStylingInfo(
                            backgroundColor: Colors.white,
                            showBorder: false,
                          ),
                          axisBounds: AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            title: FFLocalizations.of(context).getText(
                              'pugewx7s' /* Aika */,
                            ),
                            titleTextStyle: FlutterFlowTheme.of(context).title3,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            title: FFLocalizations.of(context).getText(
                              '3ehztlt6' /* Painot */,
                            ),
                            titleTextStyle: FlutterFlowTheme.of(context).title3,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
