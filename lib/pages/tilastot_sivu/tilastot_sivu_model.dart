import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_stats_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TilastotSivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> allLiikeNames = [];
  void addToAllLiikeNames(String item) => allLiikeNames.add(item);
  void removeFromAllLiikeNames(String item) => allLiikeNames.remove(item);
  void removeAtIndexFromAllLiikeNames(int index) =>
      allLiikeNames.removeAt(index);

  LiikeStruct? selectedLiike;

  ///  State fields for stateful widgets in this page.

  // Model for LiikeStats component.
  late LiikeStatsModel liikeStatsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    liikeStatsModel = createModel(context, () => LiikeStatsModel());
  }

  void dispose() {
    liikeStatsModel.dispose();
  }

  /// Additional helper methods are added here.

}
