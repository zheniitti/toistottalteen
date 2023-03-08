import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_model.dart';
export 'drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late DrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ku53fmbs' /* Luo tili tai kirjaudu */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getVariableText(
                            fiText: 'Treenaa',
                            enText: 'Workout',
                          ),
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'qcyu9dqc' /* Hello World  */,
                          ),
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().navBarIndex = 0;
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '9hgn22d8' /* Treenirutiinit */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().navBarIndex = 1;
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '14gzlzjt' /* Treenihistoria */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().navBarIndex = 2;
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'lbpdvgf4' /* Treenitilastot */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'gax7p69h' /* Language */,
                            ),
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                        ),
                        FlutterFlowLanguageSelector(
                          width: 140.0,
                          height: 40.0,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          borderRadius: 8.0,
                          textStyle: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 13.0,
                          ),
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
