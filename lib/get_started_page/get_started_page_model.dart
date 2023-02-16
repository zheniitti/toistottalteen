import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/toistot_talteen_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../treeni_rutiinit/treeni_rutiinit_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GetStartedPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for ToistotTalteen component.
  late ToistotTalteenModel toistotTalteenModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AppDataRecord? appData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    toistotTalteenModel = createModel(context, () => ToistotTalteenModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
