import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/keskenerainen_treeni_komponentti/keskenerainen_treeni_komponentti_widget.dart';
import '/components/sessio/sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SivuTreeniHistoriaKomponenttiModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for KeskenerainenTreeni_komponentti component.
  late KeskenerainenTreeniKomponenttiModel keskenerainenTreeniKomponenttiModel;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, TreeniSessiotRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  // Model for button_luoRutiini component.
  late ButtonLuoRutiiniModel buttonLuoRutiiniModel;
  // Model for button_aloitaTreenaaminen component.
  late ButtonAloitaTreenaaminenModel buttonAloitaTreenaaminenModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    keskenerainenTreeniKomponenttiModel =
        createModel(context, () => KeskenerainenTreeniKomponenttiModel());
    buttonLuoRutiiniModel = createModel(context, () => ButtonLuoRutiiniModel());
    buttonAloitaTreenaaminenModel =
        createModel(context, () => ButtonAloitaTreenaaminenModel());
  }

  void dispose() {
    keskenerainenTreeniKomponenttiModel.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
    buttonLuoRutiiniModel.dispose();
    buttonAloitaTreenaaminenModel.dispose();
  }

  /// Additional helper methods are added here.

}
