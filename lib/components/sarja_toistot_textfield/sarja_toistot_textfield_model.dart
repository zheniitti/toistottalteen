import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SarjaToistotTextfieldModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '#####');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - myUpdateSarja] action in TextField widget.
  SarjaStruct? updatedSarja;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in TextField widget.
  LiikeStruct? updatedLiike;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in TextField widget.
  TreeniRutiiniStruct? updatedRutiini;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
