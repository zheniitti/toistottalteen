import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'navbar2_model.dart';
export 'navbar2_model.dart';

class Navbar2Widget extends StatefulWidget {
  const Navbar2Widget({
    Key? key,
    this.treeniSessiot,
  }) : super(key: key);

  final List<TreeniSessiotRecord>? treeniSessiot;

  @override
  _Navbar2WidgetState createState() => _Navbar2WidgetState();
}

class _Navbar2WidgetState extends State<Navbar2Widget>
    with TickerProviderStateMixin {
  late Navbar2Model _model;

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
    _model = createModel(context, () => Navbar2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAVBAR2_COMP_navbar2_ON_INIT_STATE');
      logFirebaseEvent('navbar2_start_periodic_action');
     /*  _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('navbar2_update_app_state');
          setState(() {
            FFAppState().isLatestUnfinnishedWorkout =
                widget.treeniSessiot!.length > 0
                    ? valueOrDefault<bool>(
                        valueOrDefault<bool>(
                              widget.treeniSessiot?.first!.alku != null,
                              false,
                            ) &&
                            valueOrDefault<bool>(
                              widget.treeniSessiot?.first!.loppu == null,
                              true,
                            ),
                        false,
                      )
                    : false;
          });
        },
        startImmediately: true,
      ); */
    });

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
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 76.0,
          constraints: BoxConstraints(
            maxWidth: 600.0,
            maxHeight: 200.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 5.0),
                spreadRadius: 2.0,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('NAVBAR2_COMP_Container_fxbr1drn_ON_TAP');
                    logFirebaseEvent('Container_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation1'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation1']!
                          .controller
                          .forward(from: 0.0)
                          .whenComplete(animationsMap[
                                  'containerOnActionTriggerAnimation1']!
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
                          ? FlutterFlowTheme.of(context).tertiary
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.featured_play_list_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 36.0,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    FFLocalizations.of(context).getVariableText(
                                  fiText: 'Treenipohjat',
                                  enText: 'Routines',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
                    logFirebaseEvent('NAVBAR2_COMP_Container_kz8mez2q_ON_TAP');
                    logFirebaseEvent('Container_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation2'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation2']!
                          .controller
                          .forward(from: 0.0)
                          .whenComplete(animationsMap[
                                  'containerOnActionTriggerAnimation2']!
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
                          ? FlutterFlowTheme.of(context).tertiary
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_ixy19tfg.json',
                          width: 60.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                          frameRate: FrameRate(60.0),
                          animate: FFAppState().isLatestUnfinnishedWorkout,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    FFLocalizations.of(context).getVariableText(
                                  fiText: 'Treenaa',
                                  enText: 'Workout',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
                    logFirebaseEvent('NAVBAR2_COMP_Container_qc49548v_ON_TAP');
                    logFirebaseEvent('Container_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation3'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation3']!
                          .controller
                          .forward(from: 0.0)
                          .whenComplete(animationsMap[
                                  'containerOnActionTriggerAnimation3']!
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
                          ? FlutterFlowTheme.of(context).tertiary
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.history_toggle_off_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 36.0,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    FFLocalizations.of(context).getVariableText(
                                  fiText: 'Treenit',
                                  enText: 'Workouts',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
                          'NAVBAR2_COMP_Container_iuvhpji2_ON_TAP');
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
                            ? FlutterFlowTheme.of(context).tertiary
                            : Color(0x00000000),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.bar_chart_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 40.0,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context)
                                      .getVariableText(
                                    fiText: 'Tilastot',
                                    enText: 'Statistics',
                                  ),
                                  style: TextStyle(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
      ),
    );
  }
}
