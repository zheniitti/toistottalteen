import '/backend/backend.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/navigation_bar/navigation_bar_widget.dart';
import '/components/rutiinit_sivu/rutiinit_sivu_widget.dart';
import '/components/treenaa_tai_luo_rutiini_sivu/treenaa_tai_luo_rutiini_sivu_widget.dart';
import '/components/treeni_historia_sivu/treeni_historia_sivu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaasivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  TreeniRutiiniStruct? valittuTreenattavaRutiini;

  TreeniSessiotRecord? valittuSessioDoc;

  ///  State fields for stateful widgets in this page.

  // Model for rutiinit_sivu component.
  late RutiinitSivuModel rutiinitSivuModel;
  // Model for TreeniHistoriaSivu.
  late TreeniHistoriaSivuModel treeniHistoriaSivuModel;
  // Model for treenaaTaiLuoRutiini_sivu component.
  late TreenaaTaiLuoRutiiniSivuModel treenaaTaiLuoRutiiniSivuModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;
  // Model for drawer component.
  late DrawerModel drawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiinitSivuModel = createModel(context, () => RutiinitSivuModel());
    treeniHistoriaSivuModel =
        createModel(context, () => TreeniHistoriaSivuModel());
    treenaaTaiLuoRutiiniSivuModel =
        createModel(context, () => TreenaaTaiLuoRutiiniSivuModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  void dispose() {
    rutiinitSivuModel.dispose();
    treeniHistoriaSivuModel.dispose();
    treenaaTaiLuoRutiiniSivuModel.dispose();
    navigationBarModel.dispose();
    drawerModel.dispose();
  }

  /// Additional helper methods are added here.

}
