import '/backend/backend.dart';
import '/components/liike/liike_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LiikkeetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Models for liike dynamic component.
  late FlutterFlowDynamicModels<LiikeModel> liikeModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    liikeModels = FlutterFlowDynamicModels(() => LiikeModel());
  }

  void dispose() {
    liikeModels.dispose();
  }

  /// Additional helper methods are added here.

}
