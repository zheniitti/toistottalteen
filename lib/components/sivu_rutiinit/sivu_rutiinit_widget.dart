import '/auth/auth_util.dart';
import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/rutiini_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sivu_rutiinit_model.dart';
export 'sivu_rutiinit_model.dart';

class SivuRutiinitWidget extends StatefulWidget {
  const SivuRutiinitWidget({Key? key}) : super(key: key);

  @override
  _SivuRutiinitWidgetState createState() => _SivuRutiinitWidgetState();
}

class _SivuRutiinitWidgetState extends State<SivuRutiinitWidget> {
  late SivuRutiinitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SivuRutiinitModel());

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (((currentUserDocument?.treeniRutiinit?.toList() ?? []).length ==
                    0) ||
                true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: FlutterFlowDropDown<String>(
                                options: functions
                                    .mapRutiiniNimet((currentUserDocument
                                                ?.treeniRutiinit
                                                ?.toList() ??
                                            [])
                                        .toList())
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue = val),
                                width: 180.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).subtitle2,
                                hintText: FFLocalizations.of(context).getText(
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
                        Wrap(
                          spacing: 20.0,
                          runSpacing: 20.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Visibility(
                              visible: true,
                              child: wrapWithModel(
                                model: _model.buttonLuoRutiiniModel,
                                updateCallback: () => setState(() {}),
                                child: ButtonLuoRutiiniWidget(),
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: wrapWithModel(
                                model: _model.buttonAloitaTreenaaminenModel,
                                updateCallback: () => setState(() {}),
                                child: ButtonAloitaTreenaaminenWidget(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 200.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final rutiinit =
                          (currentUserDocument?.treeniRutiinit?.toList() ?? [])
                              .toList();
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(rutiinit.length, (rutiinitIndex) {
                          final rutiinitItem = rutiinit[rutiinitIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: RutiiniWidget(
                              key: Key(
                                  'Key6wy_${rutiinitIndex}_of_${rutiinit.length}'),
                              rutiini: rutiinitItem,
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
