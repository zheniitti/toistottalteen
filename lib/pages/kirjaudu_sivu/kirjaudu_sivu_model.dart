import '/auth/firebase_auth/auth_util.dart';
import '/auth/firebase_auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/components/toistot_talteen_text/toistot_talteen_text_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KirjauduSivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showSignInPhoneNumberField = false;

  bool showEmailFields = false;

  ///  State fields for stateful widgets in this page.

  // Model for ToistotTalteenText component.
  late ToistotTalteenTextModel toistotTalteenTextModel;
  // State field(s) for emailAddress_Login widget.
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;
  // State field(s) for password_Login widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  // State field(s) for textfield_phoneNumber widget.
  TextEditingController? textfieldPhoneNumberController1;
  String? Function(BuildContext, String?)?
      textfieldPhoneNumberController1Validator;
  // State field(s) for emailAddress_createAcc widget.
  TextEditingController? emailAddressCreateAccController;
  String? Function(BuildContext, String?)?
      emailAddressCreateAccControllerValidator;
  // State field(s) for password_createAcc widget.
  TextEditingController? passwordCreateAccController;
  late bool passwordCreateAccVisibility;
  String? Function(BuildContext, String?)? passwordCreateAccControllerValidator;
  // State field(s) for passwordConfirm_createAcc widget.
  TextEditingController? passwordConfirmCreateAccController;
  late bool passwordConfirmCreateAccVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmCreateAccControllerValidator;
  // State field(s) for textfield_phoneNumber widget.
  TextEditingController? textfieldPhoneNumberController2;
  String? Function(BuildContext, String?)?
      textfieldPhoneNumberController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    toistotTalteenTextModel =
        createModel(context, () => ToistotTalteenTextModel());
    passwordLoginVisibility = false;
    passwordCreateAccVisibility = false;
    passwordConfirmCreateAccVisibility = false;
  }

  void dispose() {
    toistotTalteenTextModel.dispose();
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    textfieldPhoneNumberController1?.dispose();
    emailAddressCreateAccController?.dispose();
    passwordCreateAccController?.dispose();
    passwordConfirmCreateAccController?.dispose();
    textfieldPhoneNumberController2?.dispose();
  }

  /// Additional helper methods are added here.

}
