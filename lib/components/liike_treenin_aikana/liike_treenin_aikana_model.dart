import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_liike/bottom_sheet_liike_widget.dart';
import '/components/sarjat_treenin_aikana/sarjat_treenin_aikana_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LiikeTreeninAikanaModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool? showKommenttiKentta = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  final textFieldKey1 = GlobalKey();
  TextEditingController? textController1;
  String? textFieldSelectedOption1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in TextField widget.
  LiikeStruct? updatedLiike;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in TextField widget.
  TreeniRutiiniStruct? updatedRutiini;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in TextField widget.
  LiikeStruct? updatedLiikeCopy;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in TextField widget.
  TreeniRutiiniStruct? updatedRutiiniCopy;
  // Model for sarjatTreeninAikana component.
  late SarjatTreeninAikanaModel sarjatTreeninAikanaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sarjatTreeninAikanaModel =
        createModel(context, () => SarjatTreeninAikanaModel());
  }

  void dispose() {
    textController2?.dispose();
    sarjatTreeninAikanaModel.dispose();
  }

  /// Additional helper methods are added here.

}
