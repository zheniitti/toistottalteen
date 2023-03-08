import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/rutiini_tai_sessio/rutiini_tai_sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TreeniHistoriaSivuModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Models for rutiiniTaiSessio dynamic component.
  late FlutterFlowDynamicModels<RutiiniTaiSessioModel> rutiiniTaiSessioModels;
  // Model for button_aloitaTreenaaminen component.
  late ButtonAloitaTreenaaminenModel buttonAloitaTreenaaminenModel;
  // Model for button_luoRutiini component.
  late ButtonLuoRutiiniModel buttonLuoRutiiniModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiiniTaiSessioModels =
        FlutterFlowDynamicModels(() => RutiiniTaiSessioModel());
    buttonAloitaTreenaaminenModel =
        createModel(context, () => ButtonAloitaTreenaaminenModel());
    buttonLuoRutiiniModel = createModel(context, () => ButtonLuoRutiiniModel());
  }

  void dispose() {
    rutiiniTaiSessioModels.dispose();
    buttonAloitaTreenaaminenModel.dispose();
    buttonLuoRutiiniModel.dispose();
  }

  /// Additional helper methods are added here.

}
