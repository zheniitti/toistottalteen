import '/auth/auth_util.dart';
import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/rutiini_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SivuRutiinitModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  // Model for button_luoRutiini component.
  late ButtonLuoRutiiniModel buttonLuoRutiiniModel;
  // Model for button_aloitaTreenaaminen component.
  late ButtonAloitaTreenaaminenModel buttonAloitaTreenaaminenModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonLuoRutiiniModel = createModel(context, () => ButtonLuoRutiiniModel());
    buttonAloitaTreenaaminenModel =
        createModel(context, () => ButtonAloitaTreenaaminenModel());
  }

  void dispose() {
    buttonLuoRutiiniModel.dispose();
    buttonAloitaTreenaaminenModel.dispose();
  }

  /// Additional helper methods are added here.

}
