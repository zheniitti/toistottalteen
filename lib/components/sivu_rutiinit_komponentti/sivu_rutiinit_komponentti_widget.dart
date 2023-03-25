import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/keskenerainen_treeni_komponentti/keskenerainen_treeni_komponentti_widget.dart';
import '/components/rutiini/rutiini_widget.dart';
import '/components/rutiinin_sarjat_toistot_kesto_matka/rutiinin_sarjat_toistot_kesto_matka_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
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
  const SivuRutiinitKomponenttiWidget({
    Key? key,
    this.latestSessio,
  }) : super(key: key);

  final TreeniSessiotRecord? latestSessio;

  @override
  _SivuRutiinitKomponenttiWidgetState createState() => _SivuRutiinitKomponenttiWidgetState();
}

class _SivuRutiinitKomponenttiWidgetState extends State<SivuRutiinitKomponenttiWidget> with TickerProviderStateMixin {
  late SivuRutiinitKomponenttiModel _model;

  final animationsMap = {
    'blurOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rutiininSarjatToistotKestoMatkaOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
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

    return Stack(
      alignment: AlignmentDirectional(0, 0),
      children: [
        Container(
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
                    maxWidth: 600,
                  ),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                                    child: wrapWithModel(
                                      model: _model.buttonLuoRutiiniModel,
                                      updateCallback: () => setState(() {}),
                                      child: ButtonLuoRutiiniWidget(),
                                    ),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FlutterFlowDropDown<String>(
                                          controller: _model.dropDownController ??= FormFieldController<String>(null),
                                          options: functions.mapRutiiniNimet((currentUserDocument?.treeniRutiinit?.toList() ?? []).toList()).toList(),
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
                                          isSearchable: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((currentUserDocument?.treeniRutiinit?.toList() ?? []).length == 0)
                                  AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 100,
                                      height: 250,
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if ((widget.latestSessio != null) && (widget.latestSessio!.loppu == null) && (widget.latestSessio!.alku != null))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                            child: wrapWithModel(
                              model: _model.keskenerainenTreeniKomponenttiModel,
                              updateCallback: () => setState(() {}),
                              child: KeskenerainenTreeniKomponenttiWidget(
                                sessio: widget.latestSessio,
                              ),
                            ),
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
                                    return Padding(
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
        ),
        if (FFAppState().valittuMuokattavaRutiini != null ? (FFAppState().valittuMuokattavaLiikeIndex >= 0) : false)
          Builder(builder: (_) {
            final child = Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(),
            );
            if (FFAppState().valittuMuokattavaRutiini != null ? (FFAppState().valittuMuokattavaLiikeIndex != null) : false) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 3,
                    sigmaY: 3,
                  ),
                  child: child,
                ),
              );
            }
            return child;
          }).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!),
        if (FFAppState().valittuMuokattavaRutiini != null ? (FFAppState().valittuMuokattavaLiikeIndex >= 0) : false)
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 120),
                  child: wrapWithModel(
                    model: _model.rutiininSarjatToistotKestoMatkaModel,
                    updateCallback: () => setState(() {}),
                    child: RutiininSarjatToistotKestoMatkaWidget(
                      liikeIndex: FFAppState().valittuMuokattavaLiikeIndex,
                      rutiini: functions.jsonToRutiini(FFAppState().valittuMuokattavaRutiini),
                    ),
                  ).animateOnPageLoad(animationsMap['rutiininSarjatToistotKestoMatkaOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
