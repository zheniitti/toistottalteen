import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'heatmap_calendar_model.dart';
export 'heatmap_calendar_model.dart';

class HeatmapCalendarWidget extends StatefulWidget {
  const HeatmapCalendarWidget({Key? key}) : super(key: key);

  @override
  _HeatmapCalendarWidgetState createState() => _HeatmapCalendarWidgetState();
}

class _HeatmapCalendarWidgetState extends State<HeatmapCalendarWidget> {
  late HeatmapCalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeatmapCalendarModel());

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

    return FlutterFlowCalendar(
      color: FlutterFlowTheme.of(context).primaryColor,
      weekFormat: false,
      weekStartsMonday: true,
      onChange: (DateTimeRange? newSelectedDate) {
        setState(() => _model.calendarSelectedDay = newSelectedDate);
      },
      titleStyle: TextStyle(),
      dayOfWeekStyle: TextStyle(),
      dateStyle: TextStyle(),
      selectedDateStyle: TextStyle(),
      inactiveDateStyle: TextStyle(),
      locale: FFLocalizations.of(context).languageCode,
    );
  }
}
