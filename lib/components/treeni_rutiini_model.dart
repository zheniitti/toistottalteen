import '../backend/backend.dart';
import '../components/rutiini_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TreeniRutiiniModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for rutiini component.
  late RutiiniModel rutiiniModel1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for rutiini component.
  late RutiiniModel rutiiniModel2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiiniModel1 = createModel(context, () => RutiiniModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    rutiiniModel2 = createModel(context, () => RutiiniModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
