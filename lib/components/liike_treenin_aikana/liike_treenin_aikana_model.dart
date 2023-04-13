import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_liike/bottom_sheet_liike_widget.dart';
import '/components/other_type_liike_fields/other_type_liike_fields_widget.dart';
import '/components/sarja_paino_textfield/sarja_paino_textfield_widget.dart';
import '/components/sarja_toistot_textfield/sarja_toistot_textfield_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
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
  // Models for otherTypeLiikeFields dynamic component.
  late FlutterFlowDynamicModels<OtherTypeLiikeFieldsModel>
      otherTypeLiikeFieldsModels;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in Icon widget.
  LiikeStruct? updatedLiikeCopy2;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in Icon widget.
  TreeniRutiiniStruct? updatedRutiiniCopy2;
  // Stores action output result for [Custom Action - myUpdateSarja] action in Row widget.
  SarjaStruct? updatedSarja;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in Row widget.
  LiikeStruct? updatedLiikeCopy3;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in Row widget.
  TreeniRutiiniStruct? updatedRutiiniCopy3;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in Row widget.
  LiikeStruct? updatedLiikeFromAddSarjaButton;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in Row widget.
  TreeniRutiiniStruct? updatedRutiiniAddSarjaButton;
  // Stores action output result for [Custom Action - myUpdateLiikeStruct] action in Row widget.
  LiikeStruct? updatedLiikeFromTehtyCheckBox;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in Row widget.
  TreeniRutiiniStruct? updatedRutiiniTehtyCheckBox;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    otherTypeLiikeFieldsModels =
        FlutterFlowDynamicModels(() => OtherTypeLiikeFieldsModel());
  }

  void dispose() {
    textController2?.dispose();
    otherTypeLiikeFieldsModels.dispose();
  }

  /// Additional helper methods are added here.

}
