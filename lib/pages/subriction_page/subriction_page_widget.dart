import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subriction_page_model.dart';
export 'subriction_page_model.dart';

class SubrictionPageWidget extends StatefulWidget {
  const SubrictionPageWidget({Key? key}) : super(key: key);

  @override
  _SubrictionPageWidgetState createState() => _SubrictionPageWidgetState();
}

class _SubrictionPageWidgetState extends State<SubrictionPageWidget> {
  late SubrictionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubrictionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subrictionPage'});
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
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).secondary),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'wpjuhtau' /* Subscription / Payment */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondary,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'hwgol8rz' /* Sinun jäsenyytesi */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x34111417),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor: Color(0xFF95A1AC),
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue1 ??=
                                  !revenue_cat.activeEntitlementIds
                                      .contains('Premium'),
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.checkboxListTileValue1 = newValue!);
                              },
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'br2c5t9e' /* Basic käyttäjä */,
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                              subtitle: Text(
                                FFLocalizations.of(context).getText(
                                  'ddywiwkf' /* Ilmainen */,
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 24.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '3p7287li' /* Sisältää mainokset ja muut raj... */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '2zf8p5oc' /* Muut tarjoukset */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('SUBRICTION_Container_x1ry4mvr_ON_TAP');
                      logFirebaseEvent('Container_revenue_cat');
                      final isEntitled =
                          await revenue_cat.isEntitled('Premium');
                      if (isEntitled == null) {
                        return;
                      } else if (!isEntitled) {
                        await revenue_cat.loadOfferings();
                      }

                      if (!isEntitled) {
                        logFirebaseEvent('Container_revenue_cat');
                        _model.didPurchase = await revenue_cat.purchasePackage(
                            revenue_cat
                                .offerings!.current!.monthly!.identifier);
                        if (_model.didPurchase!) {
                          logFirebaseEvent(
                              'Container_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'yee! 😊',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        } else {
                          logFirebaseEvent('Container_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Nooo😬',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x34111417),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                unselectedWidgetColor: Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: _model.checkboxListTileValue2 ??=
                                    revenue_cat.activeEntitlementIds
                                        .contains('Premium'),
                                onChanged: (newValue) async {
                                  setState(() => _model.checkboxListTileValue2 =
                                      newValue!);
                                },
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    '5vook0a2' /* Kuukausittain Premium-jäsenyys */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                subtitle: Text(
                                  revenue_cat.offerings!.current!.monthly!
                                      .storeProduct.priceString,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 24.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'dtagbld2' /* Ei mainoksia, ei muita rajoitu... */,
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x34111417),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                unselectedWidgetColor: Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: _model.checkboxListTileValue3 ??=
                                    revenue_cat.activeEntitlementIds.contains(
                                        'toistottalteen_annual:toistottalteen-annual'),
                                onChanged: (newValue) async {
                                  setState(() => _model.checkboxListTileValue3 =
                                      newValue!);
                                },
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'x8bvpqai' /* Vuosittainen Premium-jäsenyys */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                subtitle: Text(
                                  revenue_cat.offerings!.current!.annual!
                                      .storeProduct.priceString,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 24.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'bzi4a8ik' /* Ei mainoksia + ei muita rajoit... */,
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x34111417),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor: Color(0xFF95A1AC),
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue4 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.checkboxListTileValue4 = newValue!);
                              },
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'uolqmsaw' /* Elinikäinen premium jäsenyys */,
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                              subtitle: Text(
                                revenue_cat.offerings!.current!.lifetime!
                                    .storeProduct.priceString,
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 24.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'rkeo8bcf' /* Ei mainoksia + ei muita rajoit... */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 24.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'gf6voqtu' /* Maksa kerran ja nauti premiumj... */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          '9v7axq1b' /* Jatka */,
                        ),
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
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
