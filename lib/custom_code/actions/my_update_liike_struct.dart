// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
    SarjaStruct newEmptySarja = createSarjaStruct(create: true);
    if (removeSarjaAtIndex != null) {
      toiminto = 'Poista sarja indeksissa $removeSarjaAtIndex';
      sarjaList.removeAt(removeSarjaAtIndex);
    } else if (addNewSarja != null && addNewSarja) {
      toiminto = 'Lisää uusi sarja';
      sarjaList.add(newEmptySarja);
    }else if (replaceSarjaAtIndex != null && replacingSarja != null && replaceSarjaAtIndex >= 0) {
      toiminto = 'Korvaa sarja indeksissa $replaceSarjaAtIndex';
      sarjaList[replaceSarjaAtIndex] = replacingSarja;
    }
  } on Exception catch (e) {
    print('Error: $toiminto epäonnistui: $e');
  }

  final updatedLiike = liike.toBuilder()
    ..firestoreUtilData = FirestoreUtilData(clearUnsetFields: false, create: true)
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

Future<SarjaStruct> myUpdateSarja(
  SarjaStruct sarja,
  bool createSarjaIfNull,
  DateTime? createdTime,
  double? painoKg,
  int? toistoMaara,
  double? kestoSekunteina,
  double? matkaMetreina,
) async {
  if (sarja == null && createSarjaIfNull) {
    sarja = createSarjaStruct(create: true, clearUnsetFields: false);
  }

  final updatedSarja = sarja.toBuilder()
    ..firestoreUtilData = FirestoreUtilData(clearUnsetFields: false, create: true)
    //..createdTime = createdTime ?? sarja.createdTime
    //..modifiedTime = getCurrentTimestamp,
    ..paino = painoKg ?? sarja.paino
    ..toistoMaara = toistoMaara ?? sarja.toistoMaara
    ..kestoSekunteina = kestoSekunteina ?? sarja.kestoSekunteina
    ..matkaMetreina = matkaMetreina ?? sarja.matkaMetreina;

  SarjaStruct updatedSarjaStruct = updatedSarja.build();
  return updatedSarjaStruct;
}