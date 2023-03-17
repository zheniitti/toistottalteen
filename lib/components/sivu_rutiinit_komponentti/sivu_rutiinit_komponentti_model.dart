import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/keskenerainen_treeni_komponentti/keskenerainen_treeni_komponentti_widget.dart';
import '/components/rutiini/rutiini_widget.dart';
import '/components/rutiinin_sarjat_toistot_kesto_matka_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SivuRutiinitKomponenttiModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool showEditRutiiniSarjatToistot = false;

  TreeniRutiiniStruct? localStateValittuRutiini;

  LiikeStruct? localStateValittuLiike;

  int? localStateValittuLiikeIndex;

  ///  State fields for stateful widgets in this component.

  // Model for button_luoRutiini component.
  late ButtonLuoRutiiniModel buttonLuoRutiiniModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownController;
  // Model for KeskenerainenTreeni_komponentti component.
  late KeskenerainenTreeniKomponenttiModel keskenerainenTreeniKomponenttiModel;
  // Models for rutiini dynamic component.
  late FlutterFlowDynamicModels<RutiiniModel> rutiiniModels;
  // Model for rutiininSarjatToistotKestoMatka component.
  late RutiininSarjatToistotKestoMatkaModel
      rutiininSarjatToistotKestoMatkaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonLuoRutiiniModel = createModel(context, () => ButtonLuoRutiiniModel());
    keskenerainenTreeniKomponenttiModel =
        createModel(context, () => KeskenerainenTreeniKomponenttiModel());
    rutiiniModels = FlutterFlowDynamicModels(() => RutiiniModel());
    rutiininSarjatToistotKestoMatkaModel =
        createModel(context, () => RutiininSarjatToistotKestoMatkaModel());
  }

  void dispose() {
    buttonLuoRutiiniModel.dispose();
    keskenerainenTreeniKomponenttiModel.dispose();
    rutiiniModels.dispose();
    rutiininSarjatToistotKestoMatkaModel.dispose();
  }

  /// Additional helper methods are added here.

}
