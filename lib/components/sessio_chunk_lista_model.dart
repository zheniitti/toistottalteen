import '/components/sessio_chunk_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessioChunkListaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Models for sessioChunc.
  late FlutterFlowDynamicModels<SessioChunkModel> sessioChuncModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sessioChuncModels = FlutterFlowDynamicModels(() => SessioChunkModel());
  }

  void dispose() {
    sessioChuncModels.dispose();
  }

  /// Additional helper methods are added here.

}
