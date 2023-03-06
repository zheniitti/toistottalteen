import '/backend/backend.dart';
import '/components/my_delete_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TreeniLiikeFormModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  TreeniRutiiniStruct? luotavaRutiini;

  LiikeStruct? luotavaLiike;

  ///  State fields for stateful widgets in this component.

  // State field(s) for liikeNimi widget.
  TextEditingController? liikeNimiController;
  String? Function(BuildContext, String?)? liikeNimiControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for sarjat widget.
  TextEditingController? sarjatController;
  String? Function(BuildContext, String?)? sarjatControllerValidator;
  // State field(s) for tostot widget.
  TextEditingController? tostotController;
  String? Function(BuildContext, String?)? tostotControllerValidator;
  // State field(s) for paino widget.
  TextEditingController? painoController;
  String? Function(BuildContext, String?)? painoControllerValidator;
  // State field(s) for kesto widget.
  TextEditingController? kestoController;
  String? Function(BuildContext, String?)? kestoControllerValidator;
  // State field(s) for matka widget.
  TextEditingController? matkaController;
  String? Function(BuildContext, String?)? matkaControllerValidator;
  // State field(s) for liikeKommentti widget.
  TextEditingController? liikeKommenttiController;
  String? Function(BuildContext, String?)? liikeKommenttiControllerValidator;
  // Model for MyDeleteButton component.
  late MyDeleteButtonModel myDeleteButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    myDeleteButtonModel = createModel(context, () => MyDeleteButtonModel());
  }

  void dispose() {
    liikeNimiController?.dispose();
    sarjatController?.dispose();
    tostotController?.dispose();
    painoController?.dispose();
    kestoController?.dispose();
    matkaController?.dispose();
    liikeKommenttiController?.dispose();
    myDeleteButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
