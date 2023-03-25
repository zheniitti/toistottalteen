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
  LiikeStruct liike = createLiikeStruct(
    nimi: nimi,
    kommentti: kommentti,
    aloitusPainoKg: aloitusPainoKg ?? 0.0,
    isOtherExerciseType: isOtherExerciseType ?? false,
    matkaMetri: matkaMetreina ?? 0.0,
    kestoSekunteina: kestoSekunteina ?? 0.0,
    sarjaMaara: sarjaMaara ?? 0,
    toistoMaara: toistoMaara ?? 0,
    create: true,
    clearUnsetFields: false,
  );
  return liike;
}
