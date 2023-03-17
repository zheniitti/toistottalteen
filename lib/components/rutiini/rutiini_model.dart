import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/components/rutiinin_liikkeet/rutiinin_liikkeet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

class RutiiniModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  TreeniRutiiniStruct? componentStateRutiini;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_nimi widget.
  TextEditingController? textFieldNimiController;
  String? Function(BuildContext, String?)? textFieldNimiControllerValidator;
  // State field(s) for TextField_kommentti widget.
  TextEditingController? textFieldKommenttiController;
  String? Function(BuildContext, String?)?
      textFieldKommenttiControllerValidator;
  // Model for rutiininLiikkeet component.
  late RutiininLiikkeetModel rutiininLiikkeetModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TreeniSessiotRecord? newSessioWithRutiini;
  // Stores action output result for [Custom Action - jsonRutiiniFromDataStruct] action in Button widget.
  dynamic? rutiiniJson;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiininLiikkeetModel = createModel(context, () => RutiininLiikkeetModel());
  }

  void dispose() {
    textFieldNimiController?.dispose();
    textFieldKommenttiController?.dispose();
    rutiininLiikkeetModel.dispose();
  }

  /// Additional helper methods are added here.

}
