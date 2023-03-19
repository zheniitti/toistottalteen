import '/backend/backend.dart';
import '/components/rutiinin_liike_kommentti_textfield/rutiinin_liike_kommentti_textfield_widget.dart';
import '/components/rutiinin_liike_nimi_textfield/rutiinin_liike_nimi_textfield_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiinin_liikkeet_model.dart';
export 'rutiinin_liikkeet_model.dart';

class RutiininLiikkeetWidget extends StatefulWidget {
  const RutiininLiikkeetWidget({
    Key? key,
    this.rutiini,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;

  @override
  _RutiininLiikkeetWidgetState createState() => _RutiininLiikkeetWidgetState();
}

class _RutiininLiikkeetWidgetState extends State<RutiininLiikkeetWidget>
    with TickerProviderStateMixin {
  late RutiininLiikkeetModel _model;

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
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
    _model = createModel(context, () => RutiininLiikkeetModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Builder(
      builder: (context) {
        final liikkeet = widget.rutiini?.liikkeet?.toList()?.toList() ?? [];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(liikkeet.length, (liikkeetIndex) {
            final liikkeetItem = liikkeet[liikkeetIndex];
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.rutiini!.finishedEditing!)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 4.0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'RUTIININ_LIIKKEET_Icon_deleteLiike_ON_TA');
                        logFirebaseEvent('Icon_deleteLiike_custom_action');
                        await actions.updateUserDocTreenirutiini(
                          widget.rutiini,
                          null,
                          null,
                          false,
                          true,
                          liikkeetIndex,
                          null,
                          null,
                          widget.rutiini?.liikkeet?.toList()?.toList(),
                          null,
                          null,
                          null,
                          null,
                          true,
                          false,
                          false,
                        );
                      },
                      child: Icon(
                        Icons.remove_circle_rounded,
                        color: FlutterFlowTheme.of(context).deleteRed,
                        size: 24.0,
                      ),
                    )
                        .animateOnPageLoad(
                            animationsMap['iconOnPageLoadAnimation']!)
                        .animateOnActionTrigger(
                          animationsMap['iconOnActionTriggerAnimation']!,
                        ),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RutiininLiikeNimiTextfieldWidget(
                                  key: Key(
                                      'Key8jh_${liikkeetIndex}_of_${liikkeet.length}'),
                                  liikeIndex: liikkeetIndex,
                                  rutiini: widget.rutiini,
                                  liike: liikkeetItem,
                                ),
                                if (valueOrDefault<bool>(
                                  widget.rutiini!.finishedEditing!
                                      ? (liikkeetItem.kommentti != null &&
                                          liikkeetItem.kommentti != '')
                                      : (liikkeetItem.nimi != null &&
                                          liikkeetItem.nimi != ''),
                                  false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 0.0, 0.0, 0.0),
                                    child:
                                        RutiininLiikeKommenttiTextfieldWidget(
                                      key: Key(
                                          'Keyst7_${liikkeetIndex}_of_${liikkeet.length}'),
                                      liikeIndex: liikkeetIndex,
                                      rutiini: widget.rutiini,
                                      liike: liikkeetItem,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'RUTIININ_LIIKKEET_Row_fttroc4g_ON_TAP');
                              logFirebaseEvent('Row_custom_action');
                              _model.jsonRutiini =
                                  await actions.rutiiniToFirestoreData(
                                widget.rutiini,
                              );
                              logFirebaseEvent('Row_update_app_state');
                              FFAppState().update(() {
                                FFAppState().valittuMuokattavaLiikeIndex =
                                    liikkeetIndex;
                                FFAppState().valittuMuokattavaRutiini =
                                    _model.jsonRutiini!;
                              });

                              setState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'hr3m8o05' /* Hello World */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '1hc9efy1' /* Hello World */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
