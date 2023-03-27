import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sivupalkki_model.dart';
export 'sivupalkki_model.dart';

class SivupalkkiWidget extends StatefulWidget {
  const SivupalkkiWidget({Key? key}) : super(key: key);

  @override
  _SivupalkkiWidgetState createState() => _SivupalkkiWidgetState();
}

class _SivupalkkiWidgetState extends State<SivupalkkiWidget> {
  late SivupalkkiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SivupalkkiModel());

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
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primaryBackground,
            Color(0xFFB1B1B1)
          ],
          stops: [1.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 100.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (currentUserEmailVerified != true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'SIVUPALKKI_COMP_Row_48iupzve_ON_TAP');
                          logFirebaseEvent('Row_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed(
                            'kirjaudu_sivu',
                            queryParams: {
                              'initialIndex': serializeParam(
                                1,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 22.0, 0.0),
                              child: Icon(
                                Icons.person_rounded,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ku53fmbs' /* Luo tili tai kirjaudu */,
                                ),
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (false)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SIVUPALKKI_COMP_Row_2iowzp08_ON_TAP');
                            logFirebaseEvent('Row_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                            logFirebaseEvent('Row_update_app_state');
                            FFAppState().update(() {
                              FFAppState().navBarIndex = 0;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 22.0, 0.0),
                                child: Icon(
                                  Icons.sticky_note_2,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SIVUPALKKI_Text_treenirutiinit_ON_TAP');
                                    logFirebaseEvent(
                                        'Text_treenirutiinit_close_dialog,_drawer');
                                    Navigator.pop(context);
                                    logFirebaseEvent(
                                        'Text_treenirutiinit_update_app_state');
                                    FFAppState().update(() {
                                      FFAppState().navBarIndex = 0;
                                    });
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'tmzzbmg6' /* Treenirutiinit */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SIVUPALKKI_COMP_Row_c295vkmc_ON_TAP');
                            logFirebaseEvent('Row_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                            logFirebaseEvent('Row_update_app_state');
                            setState(() {
                              FFAppState().navBarIndex = 1;
                              FFAppState().showTreenaaTaiLuoRutiiniSivu = true;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 22.0, 0.0),
                                child: Icon(
                                  Icons.accessibility_new_rounded,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            fiText: 'Treenaa',
                                            enText: 'Workout',
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            't717139a' /*   (käynnissä) */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 22.0, 0.0),
                              child: Icon(
                                Icons.event_note_rounded,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kmmmsdb7' /* Treenihistoria */,
                                ),
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('SIVUPALKKI_COMP_Row_95lguv3f_ON_TAP');
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed('tilastot_sivu');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 22.0, 0.0),
                          child: Icon(
                            Icons.insert_chart_rounded,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'e4qtfwaz' /* Treenitilastot */,
                            ),
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gax7p69h' /* Language */,
                                ),
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ),
                          ),
                          FlutterFlowLanguageSelector(
                            width: 160.0,
                            height: 40.0,
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hideFlags: false,
                            flagSize: 24.0,
                            flagTextGap: 8.0,
                            currentLanguage:
                                FFLocalizations.of(context).languageCode,
                            languages: FFLocalizations.languages(),
                            onChanged: (lang) => setAppLanguage(context, lang),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ],
                ),
                if (false)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'sh3jbjpm' /* Tumma teema */,
                              ),
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                          Switch.adaptive(
                            value: _model.switchValue ??= true,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue = newValue!);
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ],
                  ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ny2fhrqk' /* Lähetä palaute */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '2ttiy67c' /* Tietosuoja ja käyttöehdot */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
