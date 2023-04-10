import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/components/sessio_liike_sarjas/sessio_liike_sarjas_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessioModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Models for sessioLiikeSarjas dynamic component.
  late FlutterFlowDynamicModels<SessioLiikeSarjasModel> sessioLiikeSarjasModels;
  InstantTimer? instantTimer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sessioLiikeSarjasModels =
        FlutterFlowDynamicModels(() => SessioLiikeSarjasModel());
  }

  void dispose() {
    sessioLiikeSarjasModels.dispose();
    instantTimer?.cancel();
  }

  /// Additional helper methods are added here.

}
