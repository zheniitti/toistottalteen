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

class NvabarWorkoutButtonModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool? isPlayingIconAnimation = false;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // State field(s) for LottieAnimation widget.
  late bool lottieAnimationStatus;
  late bool lottieAnimationInitialStatus;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    lottieAnimationStatus = FFAppState().isLatestUnfinnishedWorkout;
    lottieAnimationInitialStatus = FFAppState().isLatestUnfinnishedWorkout;
  }

  void dispose() {
    instantTimer?.cancel();
  }

  /// Additional helper methods are added here.

}
