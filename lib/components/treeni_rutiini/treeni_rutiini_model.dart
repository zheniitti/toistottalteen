import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini/bottom_sheet_rutiini_widget.dart';
import '/components/liikkeet/liikkeet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TreeniRutiiniModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for rutiininLiikkeet.
  late LiikkeetModel rutiininLiikkeetModel;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiininLiikkeetModel = createModel(context, () => LiikkeetModel());
  }

  void dispose() {
    rutiininLiikkeetModel.dispose();
  }

  /// Additional helper methods are added here.

}
