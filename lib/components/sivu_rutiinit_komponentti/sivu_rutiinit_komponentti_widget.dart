import '/auth/auth_util.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/keskenerainen_treeni_komponentti/keskenerainen_treeni_komponentti_widget.dart';
import '/components/rutiini/rutiini_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sivu_rutiinit_komponentti_model.dart';
export 'sivu_rutiinit_komponentti_model.dart';

class SivuRutiinitKomponenttiWidget extends StatefulWidget {
  const SivuRutiinitKomponenttiWidget({Key? key}) : super(key: key);

  @override
  _SivuRutiinitKomponenttiWidgetState createState() =>
      _SivuRutiinitKomponenttiWidgetState();
}

class _SivuRutiinitKomponenttiWidgetState
    extends State<SivuRutiinitKomponenttiWidget> with TickerProviderStateMixin {
  late SivuRutiinitKomponenttiModel _model;

  final animationsMap = {
    'rutiiniOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 800.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

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
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (((currentUserDocument?.treeniRutiinit?.toList() ?? [])
                                .length ==
                            0) ||
                        true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: wrapWithModel(
                                      model: _model.buttonLuoRutiiniModel,
                                      updateCallback: () => setState(() {}),
                                      child: ButtonLuoRutiiniWidget(),
                                    ),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FlutterFlowDropDown<String>(
                                        options: functions
                                            .mapRutiiniNimet(
                                                (currentUserDocument
                                                            ?.treeniRutiinit
                                                            ?.toList() ??
                                                        [])
                                                    .toList())
                                            .toList(),
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue = val),
                                        width: 180.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '68nw3eu6' /* Valitse treenirutiini */,
                                        ),
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                  ),
                                if ((currentUserDocument?.treeniRutiinit
                                                ?.toList() ??
                                            [])
                                        .length ==
                                    0)
                                  Container(
                                    width: 100.0,
                                    height: 250.0,
                                    decoration: BoxDecoration(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: wrapWithModel(
                        model: _model.keskenerainenTreeniKomponenttiModel,
                        updateCallback: () => setState(() {}),
                        child: KeskenerainenTreeniKomponenttiWidget(),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 200.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Builder(
                          builder: (context) {
                            final rutiinit = functions
                                .filterRutiiniList(
                                    (currentUserDocument?.treeniRutiinit
                                                ?.toList() ??
                                            [])
                                        .toList(),
                                    FFAppState().searchbarText,
                                    FFAppState().navBarIndex,
                                    false)
                                .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              reverse: true,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: rutiinit.length,
                              itemBuilder: (context, rutiinitIndex) {
                                final rutiinitItem = rutiinit[rutiinitIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
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
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'rutiiniOnPageLoadAnimation']!),
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
