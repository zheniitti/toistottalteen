import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini_widget.dart';
import '/components/treeni_rutiini_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RutiinitSivuModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Models for treeniRutiini dynamic component.
  late FlutterFlowDynamicModels<TreeniRutiiniModel> treeniRutiiniModels;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // Model for button_aloitaTreenaaminen component.
  late ButtonAloitaTreenaaminenModel buttonAloitaTreenaaminenModel;
  // Model for button_luoRutiini component.
  late ButtonLuoRutiiniModel buttonLuoRutiiniModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    treeniRutiiniModels = FlutterFlowDynamicModels(() => TreeniRutiiniModel());
    buttonAloitaTreenaaminenModel =
        createModel(context, () => ButtonAloitaTreenaaminenModel());
    buttonLuoRutiiniModel = createModel(context, () => ButtonLuoRutiiniModel());
  }

  void dispose() {
    treeniRutiiniModels.dispose();
    buttonAloitaTreenaaminenModel.dispose();
    buttonLuoRutiiniModel.dispose();
  }

  /// Additional helper methods are added here.

}
