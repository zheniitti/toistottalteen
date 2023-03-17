import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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

class _NavigationBarWidgetState extends State<NavigationBarWidget>
    with TickerProviderStateMixin {
  late NavigationBarModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 0),
          end: Offset(0, 3.142),
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
    _model = createModel(context, () => NavigationBarModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

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

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: !(isWeb
          ? MediaQuery.of(context).viewInsets.bottom > 0
          : _isKeyboardVisible),
      child: Container(
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
                  logFirebaseEvent('Container_widget_animation');
                  if (animationsMap['containerOnActionTriggerAnimation1'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation1']!
                        .controller
                        .forward(from: 0.0)
                        .whenComplete(
                            animationsMap['containerOnActionTriggerAnimation1']!
                                .controller
                                .reverse);
                  }
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
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation1']!,
              ),
              InkWell(
                onTap: () async {
                  logFirebaseEvent('NAVIGATION_BAR_Container_5pr6gwjo_ON_TAP');
                  logFirebaseEvent('Container_widget_animation');
                  if (animationsMap['containerOnActionTriggerAnimation2'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation2']!
                        .controller
                        .forward(from: 0.0)
                        .whenComplete(
                            animationsMap['containerOnActionTriggerAnimation2']!
                                .controller
                                .reverse);
                  }
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
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation2']!,
              ),
              InkWell(
                onTap: () async {
                  logFirebaseEvent('NAVIGATION_BAR_Container_0i6hubd6_ON_TAP');
                  logFirebaseEvent('Container_widget_animation');
                  if (animationsMap['containerOnActionTriggerAnimation3'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation3']!
                        .controller
                        .forward(from: 0.0)
                        .whenComplete(
                            animationsMap['containerOnActionTriggerAnimation3']!
                                .controller
                                .reverse);
                  }
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
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation3']!,
              ),
              if (false)
                InkWell(
                  onTap: () async {
                    logFirebaseEvent(
                        'NAVIGATION_BAR_Container_dp5acew7_ON_TAP');
                    logFirebaseEvent('Container_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation4'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation4']!
                          .controller
                          .forward(from: 0.0)
                          .whenComplete(animationsMap[
                                  'containerOnActionTriggerAnimation4']!
                              .controller
                              .reverse);
                    }
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
                                text:
                                    FFLocalizations.of(context).getVariableText(
                                  fiText: 'Tilastot',
                                  enText: 'Statistics',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation4']!,
                ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
