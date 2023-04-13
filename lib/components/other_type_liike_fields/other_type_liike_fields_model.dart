import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtherTypeLiikeFieldsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - myUpdateSarja] action in TextField widget.
  SarjaStruct? updatedSarja;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in TextField widget.
  LiikeStruct? updatedLiike;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in TextField widget.
  TreeniRutiiniStruct? updatedRutiini;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - myUpdateSarja] action in TextField widget.
  SarjaStruct? updatedSarjaCopy;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in TextField widget.
  LiikeStruct? updatedLiikeCopy;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in TextField widget.
  TreeniRutiiniStruct? updatedRutiiniCopy;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Custom Action - myUpdateSarja] action in TextField widget.
  SarjaStruct? updatedSarjaCopy2;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in TextField widget.
  LiikeStruct? updatedLiikeCopy2;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in TextField widget.
  TreeniRutiiniStruct? updatedRutiiniCopy2;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Custom Action - myUpdateSarja] action in TextField widget.
  SarjaStruct? updatedSarjaCopy3;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in TextField widget.
  LiikeStruct? updatedLiikeCopy3;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in TextField widget.
  TreeniRutiiniStruct? updatedRutiiniCopy3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
  }

  /// Additional helper methods are added here.

}
