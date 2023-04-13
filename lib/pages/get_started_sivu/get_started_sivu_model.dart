import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/toistot_talteen_text/toistot_talteen_text_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GetStartedSivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool pressedAnonymousLogin = false;

  ///  State fields for stateful widgets in this page.

  // Model for ToistotTalteenText component.
  late ToistotTalteenTextModel toistotTalteenTextModel;
  // Stores action output result for [Custom Action - platformString] action in Text widget.
  String? platformStringCopy;
  // Stores action output result for [Custom Action - platformString] action in Button widget.
  String? platformString;
  // Stores action output result for [Custom Action - platformString] action in Button widget.
  String? platformStringCopy2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    toistotTalteenTextModel =
        createModel(context, () => ToistotTalteenTextModel());
  }

  void dispose() {
    toistotTalteenTextModel.dispose();
  }

  /// Additional helper methods are added here.

}
