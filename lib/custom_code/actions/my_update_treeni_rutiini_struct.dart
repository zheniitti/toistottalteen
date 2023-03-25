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
  bool? addNewLiike,
  int? removeLiikeAtIndex,
  int? addNewLiikeAtBelowThisIndex,
  int? addNewLiikeAtAboveThisIndex,
  int? replaceLiikeAtIndex,
  LiikeStruct? replacingLiike,
) async {
  if (treeniRutiini == null)
    treeniRutiini = createTreeniRutiiniStruct(
        create: true, createdTime: getCurrentTimestamp);

  ListBuilder<LiikeStruct> liikeList = liikkeet != null
      ? ListBuilder<LiikeStruct>(liikkeet)
      : treeniRutiini.liikkeet.toBuilder();
  String toiminto = 'Lisää uusi liike';
  try {
    LiikeStruct newEmptyLiike = await luoLiikeRutiinipohjalle(
        null, null, null, false, null, null, null, null);
    if (removeLiikeAtIndex != null) {
      toiminto = 'Poista liike';
      liikeList.removeAt(removeLiikeAtIndex);
    } else if (addNewLiike != null && addNewLiike) {
      toiminto = 'Lisää uusi liike';
      liikeList.add(newEmptyLiike);
    } else if (addNewLiikeAtBelowThisIndex != null) {
      toiminto = 'Lisää uusi liike below this $addNewLiikeAtBelowThisIndex';
      liikeList.insert(addNewLiikeAtBelowThisIndex + 1, newEmptyLiike);
    } else if (addNewLiikeAtAboveThisIndex != null) {
      toiminto = 'Lisää uusi liike above this $addNewLiikeAtAboveThisIndex';
      liikeList.insert(addNewLiikeAtAboveThisIndex, newEmptyLiike);
    } else if (replaceLiikeAtIndex != null &&
        replacingLiike != null &&
        replaceLiikeAtIndex >= 0) {
      toiminto = 'Korvaa liike';
      liikeList[replaceLiikeAtIndex] = replacingLiike;
    }
  } on Exception catch (e) {
    print('Error: Liikkeen $toiminto epäonnistui: $e');
  }

  final updatedTreeniRutiini = treeniRutiini.toBuilder()
    ..firestoreUtilData =
        FirestoreUtilData(clearUnsetFields: false, create: true)
    ..createdTime = createdTime ?? treeniRutiini.createdTime
    ..nimi = nimi ?? treeniRutiini.nimi
    ..liikkeet = liikeList
    ..kommentti = kommentti ?? treeniRutiini.kommentti
    ..valitutViikonPaivat = valitutViikonPaivat != null
        ? valitutViikonPaivat.toBuilder()
        : treeniRutiini.valitutViikonPaivat.toBuilder()
    ..lastWorkoutTime = lastWorkoutTime ?? treeniRutiini.lastWorkoutTime
    ..isTreeniPohja = isTreeniPohja ?? treeniRutiini.isTreeniPohja
    ..finishedEditing = finishedEditing ?? treeniRutiini.finishedEditing;

  TreeniRutiiniStruct updatedRutiiniStruct = updatedTreeniRutiini.build();

  return updatedRutiiniStruct;
}
