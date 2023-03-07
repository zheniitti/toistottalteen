import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenaaminen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TreenaaminenSivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  TreeniRutiiniStruct? treeniRutiini;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in treenaaminen_sivu widget.
  TreeniSessiotRecord? treeniSessio;
  // State field(s) for rutiininnimi widget.
  TextEditingController? rutiininnimiController;
  String? Function(BuildContext, String?)? rutiininnimiControllerValidator;
  // State field(s) for rutiiniKommentti widget.
  TextEditingController? rutiiniKommenttiController;
  String? Function(BuildContext, String?)? rutiiniKommenttiControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    rutiininnimiController?.dispose();
    rutiiniKommenttiController?.dispose();
  }

  /// Additional helper methods are added here.

}
