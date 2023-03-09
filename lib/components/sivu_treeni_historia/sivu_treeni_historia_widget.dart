import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/rutiini_tai_sessio/rutiini_tai_sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sivu_treeni_historia_model.dart';
export 'sivu_treeni_historia_model.dart';

class SivuTreeniHistoriaWidget extends StatefulWidget {
  const SivuTreeniHistoriaWidget({Key? key}) : super(key: key);

  @override
  _SivuTreeniHistoriaWidgetState createState() =>
      _SivuTreeniHistoriaWidgetState();
}

class _SivuTreeniHistoriaWidgetState extends State<SivuTreeniHistoriaWidget> {
  late SivuTreeniHistoriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SivuTreeniHistoriaModel());

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
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 22.0, 0.0, 150.0),
                          child: Builder(
                            builder: (context) {
                              final treeniSessio =
                                  containerTreeniSessiotRecordList.toList();
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: List.generate(treeniSessio.length,
                                    (treeniSessioIndex) {
                                  final treeniSessioItem =
                                      treeniSessio[treeniSessioIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 4.0),
                                    child: wrapWithModel(
                                      model: _model.rutiiniTaiSessioModels
                                          .getModel(
                                        treeniSessioItem.reference.id,
                                        treeniSessioIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: RutiiniTaiSessioWidget(
                                        key: Key(
                                          'Key1od_${treeniSessioItem.reference.id}',
                                        ),
                                        treeniRutiini:
                                            treeniSessioItem.treeniRutiiniData,
                                        treeniSessio: treeniSessioItem,
                                      ),
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
                ),
                if (containerTreeniSessiotRecordList.length == 0)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 80.0, 0.0, 200.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    22.0, 0.0, 22.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'uur18ydl' /* Tämä sivu on tyhjä koska sinul... */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if (false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.buttonLuoRutiiniModel,
                                        updateCallback: () => setState(() {}),
                                        child: ButtonLuoRutiiniWidget(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model
                                            .buttonAloitaTreenaaminenModel,
                                        updateCallback: () => setState(() {}),
                                        child: ButtonAloitaTreenaaminenWidget(),
                                      ),
                                    ),
                                  ],
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
        );
      },
    );
  }
}
