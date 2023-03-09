import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_model.dart';
export 'navigation_bar_model.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  late NavigationBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarModel());

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
      width: MediaQuery.of(context).size.width * 1.0,
      height: 76.0,
      constraints: BoxConstraints(
        maxWidth: 600.0,
        maxHeight: 200.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                logFirebaseEvent('NAVIGATION_BAR_Container_8dx41aen_ON_TAP');
                logFirebaseEvent('Container_update_app_state');
                FFAppState().update(() {
                  FFAppState().navBarIndex = 0;
                });
              },
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: FFAppState().navBarIndex == 0
                      ? FlutterFlowTheme.of(context).tertiaryColor
                      : Color(0x00000000),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.featured_play_list_rounded,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      size: 36.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getVariableText(
                              fiText: 'Treenipohjat',
                              enText: 'Routines',
                            ),
                            style: TextStyle(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                logFirebaseEvent('NAVIGATION_BAR_Container_5pr6gwjo_ON_TAP');
                logFirebaseEvent('Container_update_app_state');
                FFAppState().update(() {
                  FFAppState().navBarIndex = 1;
                });
              },
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: FFAppState().navBarIndex == 1
                      ? FlutterFlowTheme.of(context).tertiaryColor
                      : Color(0x00000000),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.accessibility_new_rounded,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      size: 36.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getVariableText(
                              fiText: 'Treenaa',
                              enText: 'Workout',
                            ),
                            style: TextStyle(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                logFirebaseEvent('NAVIGATION_BAR_Container_0i6hubd6_ON_TAP');
                logFirebaseEvent('Container_update_app_state');
                FFAppState().update(() {
                  FFAppState().navBarIndex = 2;
                });
              },
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: FFAppState().navBarIndex == 2
                      ? FlutterFlowTheme.of(context).tertiaryColor
                      : Color(0x00000000),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.history_toggle_off_rounded,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      size: 36.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getVariableText(
                              fiText: 'Treenihistoria',
                              enText: 'History',
                            ),
                            style: TextStyle(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (false)
              InkWell(
                onTap: () async {
                  logFirebaseEvent('NAVIGATION_BAR_Container_dp5acew7_ON_TAP');
                  logFirebaseEvent('Container_update_app_state');
                  FFAppState().update(() {
                    FFAppState().navBarIndex = 3;
                  });
                },
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FFAppState().navBarIndex == 3
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : Color(0x00000000),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.bar_chart_rounded,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 40.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getVariableText(
                                fiText: 'Tilastot',
                                enText: 'Statistics',
                              ),
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context).bodyText1,
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
