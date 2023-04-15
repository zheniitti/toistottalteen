import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RutiininSarjatToistotKestoMatkaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField_sarjojoa widget.
  TextEditingController? textFieldSarjojoaController;
  String? Function(BuildContext, String?)? textFieldSarjojoaControllerValidator;
  // State field(s) for TextFieldTOistoja widget.
  TextEditingController? textFieldTOistojaController;
  String? Function(BuildContext, String?)? textFieldTOistojaControllerValidator;
  // State field(s) for TextFieldPaino widget.
  TextEditingController? textFieldPainoController;
  String? Function(BuildContext, String?)? textFieldPainoControllerValidator;
  // State field(s) for TextFieldTunnit widget.
  TextEditingController? textFieldTunnitController;
  String? Function(BuildContext, String?)? textFieldTunnitControllerValidator;
  // State field(s) for TextFieldMinuutit widget.
  TextEditingController? textFieldMinuutitController;
  String? Function(BuildContext, String?)? textFieldMinuutitControllerValidator;
  // State field(s) for TextFieldSekunnit widget.
  TextEditingController? textFieldSekunnitController;
  String? Function(BuildContext, String?)? textFieldSekunnitControllerValidator;
  // State field(s) for TextFieldTavoiteMatka widget.
  TextEditingController? textFieldTavoiteMatkaController;
  String? Function(BuildContext, String?)?
      textFieldTavoiteMatkaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldSarjojoaController?.dispose();
    textFieldTOistojaController?.dispose();
    textFieldPainoController?.dispose();
    textFieldTunnitController?.dispose();
    textFieldMinuutitController?.dispose();
    textFieldSekunnitController?.dispose();
    textFieldTavoiteMatkaController?.dispose();
  }

  /// Additional helper methods are added here.

}
