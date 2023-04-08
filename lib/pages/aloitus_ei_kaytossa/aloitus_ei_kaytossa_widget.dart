import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aloitus_ei_kaytossa_model.dart';
export 'aloitus_ei_kaytossa_model.dart';

class AloitusEiKaytossaWidget extends StatefulWidget {
  const AloitusEiKaytossaWidget({Key? key}) : super(key: key);

  @override
  _AloitusEiKaytossaWidgetState createState() =>
      _AloitusEiKaytossaWidgetState();
}

class _AloitusEiKaytossaWidgetState extends State<AloitusEiKaytossaWidget> {
  late AloitusEiKaytossaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AloitusEiKaytossaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'aloitus_eiKaytossa'});
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Visibility(
            visible: false,
            child: FloatingActionButton.extended(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.add,
              ),
              elevation: 8.0,
              label: Text(
                FFLocalizations.of(context).getText(
                  'rmgg2g5f' /* Luo rutiini */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 16.0,
                    ),
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sivupalkkiModel,
              updateCallback: () => setState(() {}),
              child: SivupalkkiWidget(),
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: true,
            title: Text(
              FFLocalizations.of(context).getText(
                'ogtztobw' /* Päänäkymä */,
              ),
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4.0,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PageView(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'sexpp0z3' /* Heatmap */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 30.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: FlutterFlowDropDown<String>(
                                            controller:
                                                _model.dropDownController ??=
                                                    FormFieldController<String>(
                                                        null),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'cflqv0g1' /* Ylävartalo */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sln6ta4a' /* Työntävät */,
                                              )
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.dropDownValue = val),
                                            width: 180.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'ahatfazp' /* Valitse treenirutiini */,
                                            ),
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 0.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                          ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model
                                            .buttonAloitaTreenaaminenModel,
                                        updateCallback: () => setState(() {}),
                                        child: ButtonAloitaTreenaaminenWidget(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.network(
                          'https://picsum.photos/seed/239/600',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          'https://picsum.photos/seed/664/600',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
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
