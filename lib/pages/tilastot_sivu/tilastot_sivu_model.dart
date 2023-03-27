import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/heatmap_calendar/heatmap_calendar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TilastotSivuModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heatmap_calendar component.
  late HeatmapCalendarModel heatmapCalendarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    heatmapCalendarModel = createModel(context, () => HeatmapCalendarModel());
  }

  void dispose() {
    heatmapCalendarModel.dispose();
  }

  /// Additional helper methods are added here.

}
