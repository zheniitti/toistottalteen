import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/sessio_chunk_lista_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sivu_treeni_historia_komponentti_model.dart';
export 'sivu_treeni_historia_komponentti_model.dart';

class SivuTreeniHistoriaKomponenttiWidget extends StatefulWidget {
  const SivuTreeniHistoriaKomponenttiWidget({
    Key? key,
    this.latestSessioStreamDoc,
  }) : super(key: key);

  final TreeniSessiotRecord? latestSessioStreamDoc;

  @override
  _SivuTreeniHistoriaKomponenttiWidgetState createState() =>
      _SivuTreeniHistoriaKomponenttiWidgetState();
}

class _SivuTreeniHistoriaKomponenttiWidgetState
    extends State<SivuTreeniHistoriaKomponenttiWidget> {
  late SivuTreeniHistoriaKomponenttiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SivuTreeniHistoriaKomponenttiModel());

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: FFLocalizations.of(context).getText(
                      'i315lsnw' /* Lisää treeni */,
                    ),
                    options: FFButtonOptions(
                      width: 240.0,
                      height: 70.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle1
                          .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryColor,
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
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 150.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (false)
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  if (false)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.buttonLuoRutiiniModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: ButtonLuoRutiiniWidget(),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model
                                                .buttonAloitaTreenaaminenModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child:
                                                ButtonAloitaTreenaaminenWidget(),
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
                    wrapWithModel(
                      model: _model.sessioChunkListaModel,
                      updateCallback: () => setState(() {}),
                      child: SessioChunkListaWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
