import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import '../../auth/auth_util.dart';




TreeniRutiiniStruct myUpdateTreeniRutiiniStruct(
  TreeniRutiiniStruct treeniRutiini, {
  DateTime? createdTime,
  String? nimi,
  BuiltList<LiikeStruct>? liikkeet,
  String? kommentti,
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  bool? widgetExpanded,
  DateTime? lastWorkoutTime,
  bool? isTreeniPohja,
  bool? finishedEditing,
  //ListBuilder<DateTime>? modifiedTimes,
  FirestoreUtilData? firestoreUtilData,
}) =>
    treeniRutiini.rebuild((b) => b
      ..createdTime = createdTime ?? treeniRutiini.createdTime
      ..nimi = nimi ?? treeniRutiini.nimi
      ..liikkeet = (liikkeet ?? treeniRutiini.liikkeet) as ListBuilder<LiikeStruct>?
      ..kommentti = kommentti ?? treeniRutiini.kommentti
      ..valitutViikonPaivat.replace(
          valitutViikonPaivat ?? treeniRutiini.valitutViikonPaivat)
      ..widgetExpanded = widgetExpanded ?? treeniRutiini.widgetExpanded
      ..lastWorkoutTime = lastWorkoutTime ?? treeniRutiini.lastWorkoutTime
      ..isTreeniPohja = isTreeniPohja ?? treeniRutiini.isTreeniPohja
      ..finishedEditing = finishedEditing ?? treeniRutiini.finishedEditing
      //..modifiedTimes.replace(modifiedTimes ?? treeniRutiini.modifiedTimes)
      ..firestoreUtilData =
          firestoreUtilData ?? treeniRutiini.firestoreUtilData);