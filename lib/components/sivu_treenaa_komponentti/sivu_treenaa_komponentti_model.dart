import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenin_aikana/liike_treenin_aikana_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SivuTreenaaKomponenttiModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for rutiininnimi widget.
  TextEditingController? rutiininnimiController;
  String? Function(BuildContext, String?)? rutiininnimiControllerValidator;
  // State field(s) for rutiiniKommentti widget.
  TextEditingController? rutiiniKommenttiController;
  String? Function(BuildContext, String?)? rutiiniKommenttiControllerValidator;
  // Stores action output result for [Custom Action - createSarjaList] action in Container_painike_uusiLiike widget.
  List<SarjaStruct>? luotuTyhjaSarja;
  // Stores action output result for [Custom Action - createLiike] action in Container_painike_uusiLiike widget.
  LiikeStruct? luotuLiike;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    rutiininnimiController?.dispose();
    rutiiniKommenttiController?.dispose();
  }

  /// Additional helper methods are added here.

}
