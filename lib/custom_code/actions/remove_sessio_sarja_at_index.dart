// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future removeSessioSarjaAtIndex(
  TreeniSessiotRecord? sessioDoc,
  int liikeIndexInList,
  int sarjaIndexInList,
) async {
  if (sessioDoc == null) {
    return;
  }
  TreeniRutiiniStruct? treeniRutiini = sessioDoc.treeniRutiiniData;
  List<LiikeStruct> liikkeet = treeniRutiini.liikkeet.toList();
  LiikeStruct? liike = liikkeet[liikeIndexInList];
  List<SarjaStruct> sarjat = liike.sarjat.toList();
  sarjat.removeAt(sarjaIndexInList);

  liike = updateLiikeStruct(createLiikeStruct(fieldValues: {'sarjat': sarjat}),
      clearUnsetFields: false);
  treeniRutiini = updateTreeniRutiiniStruct(
      createTreeniRutiiniStruct(fieldValues: {'liikkeet': liikkeet}),
      clearUnsetFields: false);
  await sessioDoc.reference.update({
    'treeniRutiiniData': treeniRutiini,
  });
}
