// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future removeTreeniRutiini(String rutiininNimi) async {
  // Add your function code here!
  if (currentUserDocument == null) return;
  final TreeniRutiiniStruct struct_poistettavaRutiini = getTreeniRutiiniByName(
          currentUserDocument.treeniRutiinit!.toList(), rutiininNimi)
      as TreeniRutiiniStruct;
  final List<TreeniRutiiniStruct> listRutiinit =
      currentUserDocument.treeniRutiinit!.toList()
        ..removeWhere((rutiiniStruct) => rutiiniStruct.nimi == rutiininNimi);
  final updateData = {
    'treeniRutiinit': getTreeniRutiiniListFirestoreData(listRutiinit),
  };
  await (currentUserDocument?.appDataRefs?.toList() ?? [])
      .first
      .update(updateData);
}
