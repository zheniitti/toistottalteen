import '/backend/backend.dart';
import '/components/bottom_sheet_liike/bottom_sheet_liike_widget.dart';
import '/components/sarjat_treenin_aikana/sarjat_treenin_aikana_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessioLiikeSarjasModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for sarjatTreeninAikana component.
  late SarjatTreeninAikanaModel sarjatTreeninAikanaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sarjatTreeninAikanaModel =
        createModel(context, () => SarjatTreeninAikanaModel());
  }

  void dispose() {
    sarjatTreeninAikanaModel.dispose();
  }

  /// Additional helper methods are added here.

}
