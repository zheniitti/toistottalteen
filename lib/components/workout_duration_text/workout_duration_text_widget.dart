import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_duration_text_model.dart';
export 'workout_duration_text_model.dart';

class WorkoutDurationTextWidget extends StatefulWidget {
  const WorkoutDurationTextWidget({
    Key? key,
    this.sessioDoc,
  }) : super(key: key);

  final TreeniSessiotRecord? sessioDoc;

  @override
  _WorkoutDurationTextWidgetState createState() => _WorkoutDurationTextWidgetState();
}

class _WorkoutDurationTextWidgetState extends State<WorkoutDurationTextWidget> {
  late WorkoutDurationTextModel _model;

  /* do not delete -->
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  } 
  */

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutDurationTextModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WORKOUT_DURATION_TEXT_workoutDurationTex');
      logFirebaseEvent('workoutDurationText_start_periodic_actio');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (mounted) {
            logFirebaseEvent('workoutDurationText_update_widget_state');
            setState(() {
              _model.durationString = functions.durationFromStartEnd(widget.sessioDoc!.alku, widget.sessioDoc!.loppu, FFLocalizations.of(context).languageCode);
            });
          }
        },
        startImmediately: true,
      );
    });

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      '5hy3i3cg' /* Kesto:  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                  ),
                  TextSpan(
                    text: _model.durationString,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontWeight: FontWeight.normal,
                        ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
