import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TilastotSivuModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for sivupalkki component.
  late SivupalkkiModel sivupalkkiModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sivupalkkiModel = createModel(context, () => SivupalkkiModel());
  }

  void dispose() {
    sivupalkkiModel.dispose();
  }

  /// Additional helper methods are added here.

}
