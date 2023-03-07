import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini_widget.dart';
import '/components/treeni_rutiini_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'rutiinit_sivu_model.dart';
export 'rutiinit_sivu_model.dart';

class RutiinitSivuWidget extends StatefulWidget {
  const RutiinitSivuWidget({
    Key? key,
    this.appData,
  }) : super(key: key);

  final AppDataRecord? appData;

  @override
  _RutiinitSivuWidgetState createState() => _RutiinitSivuWidgetState();
}

class _RutiinitSivuWidgetState extends State<RutiinitSivuWidget> {
  late RutiinitSivuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutiinitSivuModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  final rutiinit = widget.appData!.treeniRutiinit!.toList();
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(rutiinit.length, (rutiinitIndex) {
                        final rutiinitItem = rutiinit[rutiinitIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 4),
                          child: wrapWithModel(
                            model: _model.treeniRutiiniModels.getModel(
                              rutiinitItem.createdTime!.toString(),
                              rutiinitIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: TreeniRutiiniWidget(
                              key: Key(
                                'Key35x_${rutiinitItem.createdTime!.toString()}',
                              ),
                              treeniRutiini: rutiinitItem,
                              treeniSessio: null,
                              appData: widget.appData,
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
              if (widget.appData!.treeniRutiinit!.toList().length == 0)
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 70,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterFlowDropDown<String>(
                            options: [
                              FFLocalizations.of(context).getText(
                                'pr2ftdmo' /* Ylävartalo */,
                              ),
                              FFLocalizations.of(context).getText(
                                '1d67hhk0' /* Työntävät */,
                              )
                            ],
                            onChanged: (val) => setState(() => _model.dropDownValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).subtitle2,
                            hintText: FFLocalizations.of(context).getText(
                              '68nw3eu6' /* Valitse treenirutiini */,
                            ),
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.buttonAloitaTreenaaminenModel,
                        updateCallback: () => setState(() {}),
                        child: ButtonAloitaTreenaaminenWidget(
                          userAppData: widget.appData,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: wrapWithModel(
                          model: _model.buttonLuoRutiiniModel,
                          updateCallback: () => setState(() {}),
                          child: ButtonLuoRutiiniWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
