// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<LiikeStruct?> myUpdateLiikeStruct(
  LiikeStruct? liike,
  DateTime? createdTime,
  String? nimi,
  String? kommentti,
  bool? isOtherExerciseType,
  bool? tehty,
  double? matkaMetreina,
  double? kestoSekunteina,
  int? toistoMaara,
  int? sarjaMaara,
  double? aloitusPainoKg,
  bool? addNewSarja,
  int? removeSarjaAtIndex,
  int? replaceSarjaAtIndex,
  SarjaStruct? replacingSarja,
) async {
  if (liike == null) return null;

  ListBuilder<SarjaStruct> sarjaList = liike.sarjat.toBuilder();
  //sarjaList.removeWhere((sarja) => sarja.createdTime == null);

  String toiminto = '';
  try {
    SarjaStruct newEmptySarja =
        createSarjaStruct(create: true, createdTime: getCurrentTimestamp);
    if (removeSarjaAtIndex != null) {
      toiminto = 'Poista sarja indeksissa $removeSarjaAtIndex';
      sarjaList.removeAt(removeSarjaAtIndex);
    } else if (addNewSarja != null && addNewSarja) {
      toiminto = 'Lisää uusi sarja';
      sarjaList.add(newEmptySarja);
    } else if (replaceSarjaAtIndex != null &&
        replacingSarja != null &&
        replaceSarjaAtIndex >= 0) {
      toiminto = 'Korvaa sarja indeksissa $replaceSarjaAtIndex';
      sarjaList[replaceSarjaAtIndex] = replacingSarja;
    }
  } on Exception catch (e) {
    print('Error: $toiminto epäonnistui: $e');
  }

// jos liikkeen tyyppi vaihtuu, nollataan tietyt kentät
  if (isOtherExerciseType != null &&
      liike.isOtherExerciseType != null &&
      isOtherExerciseType != liike.isOtherExerciseType) {
    if (isOtherExerciseType) {
      sarjaMaara = 0;
      toistoMaara = 0;
      aloitusPainoKg = 0;
    } else {
      matkaMetreina = 0;
      kestoSekunteina = 0;
    }
  }

  final updatedLiike = liike.toBuilder()
    ..modifiedTime = getCurrentTimestamp
    ..firestoreUtilData =
        FirestoreUtilData(clearUnsetFields: false, create: true)
    ..createdTime = createdTime ?? liike.createdTime
    ..nimi = nimi ?? liike.nimi
    ..kommentti = kommentti ?? liike.kommentti
    ..isOtherExerciseType = isOtherExerciseType ?? liike.isOtherExerciseType
    ..tehty = tehty ?? liike.tehty
    ..matkaMetri = matkaMetreina ?? liike.matkaMetri
    ..kestoSekunteina = kestoSekunteina ?? liike.kestoSekunteina
    ..toistoMaara = toistoMaara ?? liike.toistoMaara
    ..sarjaMaara = sarjaMaara ?? liike.sarjaMaara
    ..aloitusPainoKg = aloitusPainoKg ?? liike.aloitusPainoKg
    ..sarjat = sarjaList;

  LiikeStruct updatedLiikeStruct = updatedLiike.build();

  return updatedLiikeStruct;
}
