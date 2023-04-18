import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/keskenerainen_treeni_komponentti/keskenerainen_treeni_komponentti_widget.dart';
import '/components/rutiini/rutiini_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'sivu_rutiinit_komponentti_model.dart';
export 'sivu_rutiinit_komponentti_model.dart';

class SivuRutiinitKomponenttiWidget extends StatefulWidget {
  const SivuRutiinitKomponenttiWidget({
    Key? key,
    this.latestSessio,
  }) : super(key: key);

  final TreeniSessiotRecord? latestSessio;

  @override
  _SivuRutiinitKomponenttiWidgetState createState() => _SivuRutiinitKomponenttiWidgetState();
}

class _SivuRutiinitKomponenttiWidgetState extends State<SivuRutiinitKomponenttiWidget> {
  late SivuRutiinitKomponenttiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SivuRutiinitKomponenttiModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 30),
                        child: wrapWithModel(
                          model: _model.buttonLuoRutiiniModel,
                          updateCallback: () => setState(() {}),
                          child: ButtonLuoRutiiniWidget(),
                        ),
                      ),
                    ),
                    if ((widget.latestSessio != null) && (widget.latestSessio!.loppu == null) && (widget.latestSessio!.alku != null) && false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: wrapWithModel(
                          model: _model.keskenerainenTreeniKomponenttiModel,
                          updateCallback: () => setState(() {}),
                          child: KeskenerainenTreeniKomponenttiWidget(
                            sessio: widget.latestSessio,
                          ),
                        ),
                      ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((FFAppState().navBarIndex == 0) &&
                            valueOrDefault<bool>(
                              FFAppState().searchbarText != null && FFAppState().searchbarText != '',
                              false,
                            ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'fl9eccts' /* Hakutulokset hakusanalla  */,
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: FFAppState().searchbarText,
                                    style: FlutterFlowTheme.of(context).labelLarge,
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 200),
                      child: AuthUserStreamWidget(
                        builder: (context) => Builder(
                          builder: (context) {
                            final rutiinit = functions.filterRutiiniList((currentUserDocument?.treeniRutiinit?.toList() ?? []).toList(), FFAppState().searchbarText, FFAppState().navBarIndex, false).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              reverse: true,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: rutiinit.length,
                              itemBuilder: (context, rutiinitIndex) {
                                final rutiinitItem = rutiinit[rutiinitIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                    child: wrapWithModel(
                                      model: _model.rutiiniModels.getModel(
                                        rutiinitItem.createdTime!.toString(),
                                        rutiinitIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: RutiiniWidget(
                                        key: Key(
                                          'Keyppk_${rutiinitItem.createdTime!.toString()}',
                                        ),
                                        rutiini: rutiinitItem,
                                        hasUnfinishedWorkout: (widget.latestSessio != null) && (widget.latestSessio!.loppu == null),
                                        pageStateSelectedRutiini: _model.pageStateValittuRutiini,
                                        rutiiniListIndex: rutiinitIndex,
                                        latestSessioDoc: widget.latestSessio,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
