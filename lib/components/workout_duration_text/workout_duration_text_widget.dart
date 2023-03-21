import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  _WorkoutDurationTextWidgetState createState() =>
      _WorkoutDurationTextWidgetState();
}

class _WorkoutDurationTextWidgetState extends State<WorkoutDurationTextWidget> {
  late WorkoutDurationTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutDurationTextModel());

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
            FlutterFlowTimer(
              initialTime: _model.timerMilliseconds,
              getDisplayTime: (value) =>
                  StopWatchTimer.getDisplayTime(value, milliSecond: false),
              timer: _model.timerController,
              updateStateInterval: Duration(milliseconds: 1000),
              onChanged: (value, displayTime, shouldUpdate) {
                _model.timerMilliseconds = value;
                _model.timerValue = displayTime;
                if (shouldUpdate) setState(() {});
              },
              onEnded: () async {
                logFirebaseEvent('WORKOUT_DURATION_TEXT_Timer_vhzwv593_ON_');
                logFirebaseEvent('Timer_update_widget_state');
                setState(() {
                  _model.durationString = functions.durationFromStartEnd(
                      widget.sessioDoc!.alku,
                      widget.sessioDoc!.loppu,
                      FFLocalizations.of(context).languageCode);
                });
              },
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Roboto',
                    color: Colors.transparent,
                    fontSize: 1.0,
                  ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      '5hy3i3cg' /* Aikaa kulunut:  */,
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                  ),
                  TextSpan(
                    text: functions.durationFromStartEnd(
                        widget.sessioDoc!.alku,
                        widget.sessioDoc!.loppu,
                        FFLocalizations.of(context).languageCode),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
