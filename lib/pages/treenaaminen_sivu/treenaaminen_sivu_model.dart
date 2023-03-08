import '/components/treenaa_sivu/treenaa_sivu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TreenaaminenSivuModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for treenaa_sivu component.
  late TreenaaSivuModel treenaaSivuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    treenaaSivuModel = createModel(context, () => TreenaaSivuModel());
  }

  void dispose() {
    treenaaSivuModel.dispose();
  }

  /// Additional helper methods are added here.

}
