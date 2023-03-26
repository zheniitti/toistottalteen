import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rutiinin_liikkeet/rutiinin_liikkeet_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuilderModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for rutiininLiikkeet component.
  late RutiininLiikkeetModel rutiininLiikkeetModel;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  TreeniSessiotRecord? asdt;
  // Stores action output result for [Backend Call - Create Document] action in Button_aloitaUusiTreeni widget.
  TreeniSessiotRecord? createdSessioDoc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutiininLiikkeetModel = createModel(context, () => RutiininLiikkeetModel());
  }

  void dispose() {
    rutiininLiikkeetModel.dispose();
  }

  /// Additional helper methods are added here.

}
