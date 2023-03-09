import '/backend/backend.dart';
import '/components/navigation_bar/navigation_bar_widget.dart';
import '/components/sivu_rutiinit/sivu_rutiinit_widget.dart';
import '/components/sivu_treenaa_tai_luo_rutiini/sivu_treenaa_tai_luo_rutiini_widget.dart';
import '/components/sivu_treeni_historia/sivu_treeni_historia_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaasivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  TreeniRutiiniStruct? treenattavaRutiini;

  TreeniSessiotRecord? treenattavaSessioDoc;

  ///  State fields for stateful widgets in this page.

  // Model for sivu_rutiinit component.
  late SivuRutiinitModel sivuRutiinitModel;
  // Model for sivu_treeniHistoria component.
  late SivuTreeniHistoriaModel sivuTreeniHistoriaModel;
  // Model for sivu_treenaaTaiLuoRutiini component.
  late SivuTreenaaTaiLuoRutiiniModel sivuTreenaaTaiLuoRutiiniModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;
  // Model for sivupalkki component.
  late SivupalkkiModel sivupalkkiModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sivuRutiinitModel = createModel(context, () => SivuRutiinitModel());
    sivuTreeniHistoriaModel =
        createModel(context, () => SivuTreeniHistoriaModel());
    sivuTreenaaTaiLuoRutiiniModel =
        createModel(context, () => SivuTreenaaTaiLuoRutiiniModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    sivupalkkiModel = createModel(context, () => SivupalkkiModel());
  }

  void dispose() {
    sivuRutiinitModel.dispose();
    sivuTreeniHistoriaModel.dispose();
    sivuTreenaaTaiLuoRutiiniModel.dispose();
    navigationBarModel.dispose();
    sivupalkkiModel.dispose();
  }

  /// Additional helper methods are added here.

}
