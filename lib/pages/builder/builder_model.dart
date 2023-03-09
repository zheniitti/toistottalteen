import '/components/rutiini_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuilderModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for rutiini component.
  late RutiiniModel rutiiniModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiiniModel = createModel(context, () => RutiiniModel());
  }

  void dispose() {
    rutiiniModel.dispose();
  }

  /// Additional helper methods are added here.

}
