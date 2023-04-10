import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navbar2_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/components/workout_duration_text/workout_duration_text_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/sivu_rutiinit_komponentti/sivu_rutiinit_komponentti_widget.dart';
import '/pages/sivu_treenaa_komponentti/sivu_treenaa_komponentti_widget.dart';
import '/pages/sivu_treeni_historia_komponentti/sivu_treeni_historia_komponentti_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaasivuModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLatestUnfinnishedWorkout = false;

  ///  State fields for stateful widgets in this page.

  // Model for sivu_rutiinit_komponentti.
  late SivuRutiinitKomponenttiModel sivuRutiinitKomponenttiModel;
  // Model for sivu_treenaa_omponentti.
  late SivuTreenaaKomponenttiModel sivuTreenaaOmponenttiModel;
  // Model for sivu_treeniHistoria_komponentti.
  late SivuTreeniHistoriaKomponenttiModel sivuTreeniHistoriaKomponenttiModel;
  // Model for workoutDurationText component.
  late WorkoutDurationTextModel workoutDurationTextModel;
  // State field(s) for TextField_seachBar widget.
  final textFieldSeachBarKey = GlobalKey();
  TextEditingController? textFieldSeachBarController;
  String? textFieldSeachBarSelectedOption;
  String? Function(BuildContext, String?)? textFieldSeachBarControllerValidator;
  // Model for navbar2 component.
  late Navbar2Model navbar2Model;
  // Model for sivupalkki component.
  late SivupalkkiModel sivupalkkiModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sivuRutiinitKomponenttiModel =
        createModel(context, () => SivuRutiinitKomponenttiModel());
    sivuTreenaaOmponenttiModel =
        createModel(context, () => SivuTreenaaKomponenttiModel());
    sivuTreeniHistoriaKomponenttiModel =
        createModel(context, () => SivuTreeniHistoriaKomponenttiModel());
    workoutDurationTextModel =
        createModel(context, () => WorkoutDurationTextModel());
    navbar2Model = createModel(context, () => Navbar2Model());
    sivupalkkiModel = createModel(context, () => SivupalkkiModel());
  }

  void dispose() {
    sivuRutiinitKomponenttiModel.dispose();
    sivuTreenaaOmponenttiModel.dispose();
    sivuTreeniHistoriaKomponenttiModel.dispose();
    workoutDurationTextModel.dispose();
    navbar2Model.dispose();
    sivupalkkiModel.dispose();
  }

  /// Additional helper methods are added here.

}
