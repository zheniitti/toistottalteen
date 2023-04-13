import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sessio/sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessioChunkModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Models for sessio dynamic component.
  late FlutterFlowDynamicModels<SessioModel> sessioModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sessioModels = FlutterFlowDynamicModels(() => SessioModel());
  }

  void dispose() {
    sessioModels.dispose();
  }

  /// Additional helper methods are added here.

}
