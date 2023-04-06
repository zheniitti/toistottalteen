import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LiikeStatsModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<int> weightNumbersList = [];
  void addToWeightNumbersList(int item) => weightNumbersList.add(item);
  void removeFromWeightNumbersList(int item) => weightNumbersList.remove(item);
  void removeAtIndexFromWeightNumbersList(int index) =>
      weightNumbersList.removeAt(index);

  List<int> repsNumbersList = [];
  void addToRepsNumbersList(int item) => repsNumbersList.add(item);
  void removeFromRepsNumbersList(int item) => repsNumbersList.remove(item);
  void removeAtIndexFromRepsNumbersList(int index) =>
      repsNumbersList.removeAt(index);

  List<String> liikeNamesList = [];
  void addToLiikeNamesList(String item) => liikeNamesList.add(item);
  void removeFromLiikeNamesList(String item) => liikeNamesList.remove(item);
  void removeAtIndexFromLiikeNamesList(int index) =>
      liikeNamesList.removeAt(index);

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
