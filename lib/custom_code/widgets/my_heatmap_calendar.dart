// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatmapCalendar extends StatefulWidget {
  const MyHeatmapCalendar({
    Key? key,
    this.width,
    this.height,
    this.sessioDocs,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<TreeniSessiotRecord>? sessioDocs;

  @override
  _MyHeatmapCalendarState createState() => _MyHeatmapCalendarState();
}

class _MyHeatmapCalendarState extends State<MyHeatmapCalendar> {
  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      colorsets: {},
    );
  }
}
