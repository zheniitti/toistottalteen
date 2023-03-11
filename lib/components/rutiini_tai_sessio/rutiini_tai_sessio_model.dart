import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/components/liikkeet_lista/liikkeet_lista_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RutiiniTaiSessioModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for rutiininLiikkeet.
  late LiikkeetListaModel rutiininLiikkeetModel;
  // Stores action output result for [Custom Action - jsonRutiiniFromDataStruct] action in Button widget.
  dynamic? rutiiniJson;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiininLiikkeetModel = createModel(context, () => LiikkeetListaModel());
  }

  void dispose() {
    rutiininLiikkeetModel.dispose();
  }

  /// Additional helper methods are added here.

}
