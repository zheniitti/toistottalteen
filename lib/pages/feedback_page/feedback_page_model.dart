import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/feedback_message_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FeedbackPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? pageOpenTime;

  ///  State fields for stateful widgets in this page.

  // Models for FeedbackMessage dynamic component.
  late FlutterFlowDynamicModels<FeedbackMessageModel> feedbackMessageModels;
  // State field(s) for feedbackMessage widget.
  TextEditingController? feedbackMessageController;
  String? Function(BuildContext, String?)? feedbackMessageControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    feedbackMessageModels =
        FlutterFlowDynamicModels(() => FeedbackMessageModel());
  }

  void dispose() {
    feedbackMessageModels.dispose();
    feedbackMessageController?.dispose();
  }

  /// Additional helper methods are added here.

}
