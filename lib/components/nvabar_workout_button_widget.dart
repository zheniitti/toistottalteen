import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'nvabar_workout_button_model.dart';
export 'nvabar_workout_button_model.dart';

class NvabarWorkoutButtonWidget extends StatefulWidget {
  const NvabarWorkoutButtonWidget({
    Key? key,
    this.activeTreenisessions,
  }) : super(key: key);

  final List<TreeniSessiotRecord>? activeTreenisessions;

  @override
  _NvabarWorkoutButtonWidgetState createState() =>
      _NvabarWorkoutButtonWidgetState();
}

class _NvabarWorkoutButtonWidgetState extends State<NvabarWorkoutButtonWidget>
    with TickerProviderStateMixin {
  late NvabarWorkoutButtonModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
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
    _model = createModel(context, () => NvabarWorkoutButtonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NVABAR_WORKOUT_BUTTON_nvabar_workoutButt');
      logFirebaseEvent('nvabar_workoutButton_start_periodic_acti');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 500),
        callback: (timer) async {
          if (_model.isPlayingIconAnimation!) {
            if (!(widget.activeTreenisessions!.length > 0
                ? valueOrDefault<bool>(
                    valueOrDefault<bool>(
                          widget.activeTreenisessions?.first != null,
                          false,
                        ) &&
                        valueOrDefault<bool>(
                          widget.activeTreenisessions?.first == null,
                          true,
                        ),
                    false,
                  )
                : false)) {
              logFirebaseEvent('nvabar_workoutButton_lottie_animation');
              setState(() =>
                  _model.lottieAnimationStatus = !_model.lottieAnimationStatus);
              logFirebaseEvent('nvabar_workoutButton_update_widget_state');
              _model.isPlayingIconAnimation = false;
            }
          } else {
            if (widget.activeTreenisessions!.length > 0
                ? valueOrDefault<bool>(
                    valueOrDefault<bool>(
                          widget.activeTreenisessions?.first != null,
                          false,
                        ) &&
                        valueOrDefault<bool>(
                          widget.activeTreenisessions?.first == null,
                          true,
                        ),
                    false,
                  )
                : false) {
              logFirebaseEvent('nvabar_workoutButton_lottie_animation');
              if (_model.lottieAnimationStatus ==
                  _model.lottieAnimationInitialStatus) {
                setState(() => _model.lottieAnimationStatus =
                    !_model.lottieAnimationStatus);
              }
              logFirebaseEvent('nvabar_workoutButton_update_widget_state');
              _model.isPlayingIconAnimation = true;
            }
          }
        },
        startImmediately: true,
      );
    });

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

    return InkWell(
      onTap: () async {
        logFirebaseEvent('NVABAR_WORKOUT_BUTTON_Container_obgfdozu');
        logFirebaseEvent('Container_widget_animation');
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0)
              .whenComplete(animationsMap['containerOnActionTriggerAnimation']!
                  .controller
                  .reverse);
        }
        logFirebaseEvent('Container_update_app_state');
        setState(() {
          FFAppState().navBarIndex = 1;
          FFAppState().modiedNavbarIndexTime = getCurrentTimestamp;
        });
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: FFAppState().navBarIndex == 1
              ? FlutterFlowTheme.of(context).tertiary
              : Color(0x00000000),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Lottie.network(
                    'https://assets8.lottiefiles.com/packages/lf20_ixy19tfg.json',
                    width: 130,
                    height: 40,
                    fit: BoxFit.cover,
                    frameRate: FrameRate(60),
                    animate: _model.lottieAnimationStatus),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: FFLocalizations.of(context).getVariableText(
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
              ),
            ],
          ),
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
