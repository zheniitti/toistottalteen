import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyPhoneNuberPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for sms_code widget.
  TextEditingController? smsCodeController;
  String? Function(BuildContext, String?)? smsCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    smsCodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
