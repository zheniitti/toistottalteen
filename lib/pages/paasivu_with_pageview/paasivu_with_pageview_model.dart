import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mainos_palkki_widget.dart';
import '/components/nvabar_workout_button_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/components/workout_duration_text/workout_duration_text_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/sivu_rutiinit_komponentti/sivu_rutiinit_komponentti_widget.dart';
import '/pages/sivu_treenaa_komponentti/sivu_treenaa_komponentti_widget.dart';
import '/pages/sivu_treeni_historia_komponentti/sivu_treeni_historia_komponentti_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaasivuWithPageviewModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLatestUnfinnishedWorkout = false;

  ///  State fields for stateful widgets in this page.

  // Model for sivupalkki component.
  late SivupalkkiModel sivupalkkiModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;
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
  // Model for MainosPalkki component.
  late MainosPalkkiModel mainosPalkkiModel;
  // Model for nvabar_workoutButton component.
  late NvabarWorkoutButtonModel nvabarWorkoutButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sivupalkkiModel = createModel(context, () => SivupalkkiModel());
    sivuRutiinitKomponenttiModel =
        createModel(context, () => SivuRutiinitKomponenttiModel());
    sivuTreenaaOmponenttiModel =
        createModel(context, () => SivuTreenaaKomponenttiModel());
    sivuTreeniHistoriaKomponenttiModel =
        createModel(context, () => SivuTreeniHistoriaKomponenttiModel());
    workoutDurationTextModel =
        createModel(context, () => WorkoutDurationTextModel());
    mainosPalkkiModel = createModel(context, () => MainosPalkkiModel());
    nvabarWorkoutButtonModel =
        createModel(context, () => NvabarWorkoutButtonModel());
  }

  void dispose() {
    sivupalkkiModel.dispose();
    sivuRutiinitKomponenttiModel.dispose();
    sivuTreenaaOmponenttiModel.dispose();
    sivuTreeniHistoriaKomponenttiModel.dispose();
    workoutDurationTextModel.dispose();
    mainosPalkkiModel.dispose();
    nvabarWorkoutButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
