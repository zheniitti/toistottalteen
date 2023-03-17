// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<TreeniRutiiniStruct?> myUpdateTreeniRutiiniStruct(
  TreeniRutiiniStruct? treeniRutiini,
  DateTime? createdTime,
  String? nimi,
  List<LiikeStruct>? liikkeet,
  String? kommentti,
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  DateTime? lastWorkoutTime,
  bool? isTreeniPohja,
  bool? finishedEditing,
  dynamic fieldValues,
) async {
  if (treeniRutiini == null) return null;
  treeniRutiini.rebuild((b) => b
    ..createdTime = createdTime ?? treeniRutiini.createdTime
    ..nimi = nimi ?? treeniRutiini.nimi
    ..liikkeet =
        (liikkeet ?? treeniRutiini.liikkeet) as ListBuilder<LiikeStruct>?
    ..kommentti = kommentti ?? treeniRutiini.kommentti
    ..valitutViikonPaivat
        .replace(valitutViikonPaivat ?? treeniRutiini.valitutViikonPaivat)
    //..widgetExpanded = widgetExpanded ?? treeniRutiini.widgetExpanded
    ..lastWorkoutTime = lastWorkoutTime ?? treeniRutiini.lastWorkoutTime
    ..isTreeniPohja = isTreeniPohja ?? treeniRutiini.isTreeniPohja
    ..finishedEditing = finishedEditing ?? treeniRutiini.finishedEditing);
  //..modifiedTimes.replace(modifiedTimes ?? treeniRutiini.modifiedTimes)
  //..firestoreUtilData =
  //  firestoreUtilData ?? treeniRutiini.firestoreUtilData);

  return treeniRutiini;
}
