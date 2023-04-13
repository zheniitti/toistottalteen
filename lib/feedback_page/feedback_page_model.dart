import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedbackPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for feedbackMessage widget.
  TextEditingController? feedbackMessageController;
  String? Function(BuildContext, String?)? feedbackMessageControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    feedbackMessageController?.dispose();
  }

  /// Additional helper methods are added here.

}
