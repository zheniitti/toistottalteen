import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/liike_treenin_aikana/liike_treenin_aikana_widget.dart';
import '/components/name_and_comment_fields_of_sessio/name_and_comment_fields_of_sessio_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SivuTreenaaKomponenttiModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for nameAndCommentFieldsOfSessio component.
  late NameAndCommentFieldsOfSessioModel nameAndCommentFieldsOfSessioModel;
  // Models for liike_treeninAikana dynamic component.
  late FlutterFlowDynamicModels<LiikeTreeninAikanaModel>
      liikeTreeninAikanaModels;
  // Stores action output result for [Custom Action - myUpdateTreeniRutiiniStruct] action in Container_painike_uusiLiike widget.
  TreeniRutiiniStruct? updatedRutiiniFromLisaaLiike;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameAndCommentFieldsOfSessioModel =
        createModel(context, () => NameAndCommentFieldsOfSessioModel());
    liikeTreeninAikanaModels =
        FlutterFlowDynamicModels(() => LiikeTreeninAikanaModel());
  }

  void dispose() {
    nameAndCommentFieldsOfSessioModel.dispose();
    liikeTreeninAikanaModels.dispose();
  }

  /// Additional helper methods are added here.

}
