// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<LiikeStruct> createLiike(
  String? nimi,
  String? kommentti,
  String? liikeTyyppi,
  double? painoKg,
  List<SarjaStruct>? sarjat,
) async {
  // Add your function code here!
  sarjat = sarjat ?? [createSarjaStruct()];
  LiikeStruct liike = createLiikeStruct(
    nimi: nimi ?? '',
    kommentti: kommentti ?? '',
    liikeTyyppi: liikeTyyppi ?? '',
    aloitusPainoKg: painoKg,
    fieldValues: {'sarjat': sarjat},
  );
  return liike;
}
