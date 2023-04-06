// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<SarjaStruct> myUpdateSarja(
  SarjaStruct sarja,
  bool createSarjaIfNull,
  DateTime? createdTime,
  int? toistoMaara,
  double? painoKg,
  double? kestoSekunteina,
  double? matkaMetreina,
  bool? done,
) async {
  if (sarja == null && createSarjaIfNull) {
    sarja = createSarjaStruct(create: true, clearUnsetFields: false);
  }

  final updatedSarja = sarja.toBuilder()
    ..firestoreUtilData =
        FirestoreUtilData(clearUnsetFields: false, create: true)
    ..createdTime = createdTime ?? sarja.createdTime ?? getCurrentTimestamp
    ..modifiedTime = getCurrentTimestamp
    ..paino = painoKg ?? sarja.paino
    ..toistoMaara = toistoMaara ?? sarja.toistoMaara
    ..kestoSekunteina = kestoSekunteina ?? sarja.kestoSekunteina
    ..matkaMetreina = matkaMetreina ?? sarja.matkaMetreina
    ..done = done ?? sarja.done;

  SarjaStruct updatedSarjaStruct = updatedSarja.build();
  return updatedSarjaStruct;
}
