import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'builder_model.dart';
export 'builder_model.dart';

class BuilderWidget extends StatefulWidget {
  const BuilderWidget({Key? key}) : super(key: key);

  @override
  _BuilderWidgetState createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget> {
  late BuilderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuilderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'builder'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('BUILDER_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'v1rlq3l4' /* Rakennellaan ja kokeillaan eri... */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondary,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: FlutterFlowTheme.of(context).primary,
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                  indicatorColor: FlutterFlowTheme.of(context).secondary,
                  tabs: [
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '56h7z490' /* Example 1 */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'jrtjhhn9' /* Example 2 */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'lonyrktz' /* Example 3 */,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      KeepAliveWidgetWrapper(
                        builder: (context) => Text(
                          FFLocalizations.of(context).getText(
                            'yqr3d67j' /* Tab View 1 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 32.0,
                                  ),
                        ),
                      ),
                      KeepAliveWidgetWrapper(
                        builder: (context) => Text(
                          FFLocalizations.of(context).getText(
                            '00a35bg7' /* Tab View 2 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 32.0,
                                  ),
                        ),
                      ),
                      KeepAliveWidgetWrapper(
                        builder: (context) => Text(
                          FFLocalizations.of(context).getText(
                            'wd1ipl2k' /* Tab View 3 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 32.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
