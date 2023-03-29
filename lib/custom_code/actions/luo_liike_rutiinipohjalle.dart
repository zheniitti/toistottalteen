// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<LiikeStruct> luoLiikeRutiinipohjalle(
  String? nimi,
  String? kommentti,
  double? aloitusPainoKg,
  bool? isOtherExerciseType,
  double? matkaMetreina,
  double? kestoSekunteina,
  int? sarjaMaara,
  int? toistoMaara,
) async {
  final DateTime time = getCurrentTimestamp;
  LiikeStruct liike = createLiikeStruct(
    modifiedTime: time,
    createdTime: time,
    tehty: false,
    nimi: nimi?.trim(),
    kommentti: kommentti?.trim(),
    aloitusPainoKg: aloitusPainoKg,
    isOtherExerciseType: isOtherExerciseType ?? false,
    matkaMetri: matkaMetreina,
    kestoSekunteina: kestoSekunteina,
    sarjaMaara: sarjaMaara,
    toistoMaara: toistoMaara,
    create: true,
    clearUnsetFields: false,
  );
  return liike;
}
