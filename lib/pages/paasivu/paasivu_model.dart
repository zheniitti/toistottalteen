import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation_bar/navigation_bar_widget.dart';
import '/components/sivu_rutiinit_komponentti/sivu_rutiinit_komponentti_widget.dart';
import '/components/sivu_treenaa_komponentti/sivu_treenaa_komponentti_widget.dart';
import '/components/sivu_treeni_historia_komponentti/sivu_treeni_historia_komponentti_widget.dart';
import '/components/sivupalkki/sivupalkki_widget.dart';
import '/components/workout_duration_text/workout_duration_text_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
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

  TreeniSessiotRecord? valittuSessioDoc;

  ///  State fields for stateful widgets in this page.

  // Model for sivu_rutiinit_komponentti.
  late SivuRutiinitKomponenttiModel sivuRutiinitKomponenttiModel;
  // Model for sivu_treeniHistoria_komponentti.
  late SivuTreeniHistoriaKomponenttiModel sivuTreeniHistoriaKomponenttiModel;
  // Model for sivu_treenaa_omponentti.
  late SivuTreenaaKomponenttiModel sivuTreenaaOmponenttiModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;
  // Model for workoutDurationText component.
  late WorkoutDurationTextModel workoutDurationTextModel;
  // State field(s) for TextField widget.
  final textFieldKey1 = GlobalKey();
  TextEditingController? textController1;
  String? textFieldSelectedOption1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  StopWatchTimer timerController = StopWatchTimer(mode: StopWatchMode.countUp);

  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for sivupalkki component.
  late SivupalkkiModel sivupalkkiModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sivuRutiinitKomponenttiModel =
        createModel(context, () => SivuRutiinitKomponenttiModel());
    sivuTreeniHistoriaKomponenttiModel =
        createModel(context, () => SivuTreeniHistoriaKomponenttiModel());
    sivuTreenaaOmponenttiModel =
        createModel(context, () => SivuTreenaaKomponenttiModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    workoutDurationTextModel =
        createModel(context, () => WorkoutDurationTextModel());
    sivupalkkiModel = createModel(context, () => SivupalkkiModel());
  }

  void dispose() {
    sivuRutiinitKomponenttiModel.dispose();
    sivuTreeniHistoriaKomponenttiModel.dispose();
    sivuTreenaaOmponenttiModel.dispose();
    navigationBarModel.dispose();
    workoutDurationTextModel.dispose();
    timerController.dispose();
    textController2?.dispose();
    sivupalkkiModel.dispose();
  }

  /// Additional helper methods are added here.

}
