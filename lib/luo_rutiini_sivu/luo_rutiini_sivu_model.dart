import '../backend/backend.dart';
import '../components/liike_widget.dart';
import '../components/treeni_liike_form_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LuoRutiiniSivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showLuoRutiiniSivu = true;

  TreeniRutiiniStruct? luotavaRutiini;

  LiikeStruct? luotavaLiike;

  bool showLuoLiikeForm = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for rutiininnimi widget.
  TextEditingController? rutiininnimiController;
  String? Function(BuildContext, String?)? rutiininnimiControllerValidator;
  // State field(s) for rutiiniKommentti widget.
  TextEditingController? rutiiniKommenttiController;
  String? Function(BuildContext, String?)? rutiiniKommenttiControllerValidator;
  // Model for treeniLiikeForm component.
  late TreeniLiikeFormModel treeniLiikeFormModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    treeniLiikeFormModel = createModel(context, () => TreeniLiikeFormModel());
  }

  void dispose() {
    rutiininnimiController?.dispose();
    rutiiniKommenttiController?.dispose();
  }

  /// Additional helper methods are added here.

}
