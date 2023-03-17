import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AloitusEiKaytossaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for sivupalkki component.
  late SivupalkkiModel sivupalkkiModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownController;
  // Model for button_aloitaTreenaaminen component.
  late ButtonAloitaTreenaaminenModel buttonAloitaTreenaaminenModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sivupalkkiModel = createModel(context, () => SivupalkkiModel());
    buttonAloitaTreenaaminenModel =
        createModel(context, () => ButtonAloitaTreenaaminenModel());
  }

  void dispose() {
    sivupalkkiModel.dispose();
    buttonAloitaTreenaaminenModel.dispose();
  }

  /// Additional helper methods are added here.

}
