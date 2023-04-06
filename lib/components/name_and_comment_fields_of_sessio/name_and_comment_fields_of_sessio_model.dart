import '/auth/auth_util.dart';
import '/backend/backend.dart';
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

class NameAndCommentFieldsOfSessioModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  TreeniSessiotRecord? sessioDoc;

  ///  State fields for stateful widgets in this component.

  // State field(s) for rutiininnimi widget.
  final rutiininnimiKey = GlobalKey();
  TextEditingController? rutiininnimiController;
  String? rutiininnimiSelectedOption;
  String? Function(BuildContext, String?)? rutiininnimiControllerValidator;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in rutiininnimi widget.
  TreeniRutiiniStruct? updatedRutiiniFromNimiField;
  // State field(s) for rutiiniKommentti widget.
  TextEditingController? rutiiniKommenttiController;
  String? Function(BuildContext, String?)? rutiiniKommenttiControllerValidator;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in rutiiniKommentti widget.
  TreeniRutiiniStruct? updatedRutiiniFromNimiFieldCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    rutiiniKommenttiController?.dispose();
  }

  /// Additional helper methods are added here.

}
