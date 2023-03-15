// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> jsonRutiiniFromDataStruct(
    TreeniRutiiniStruct? rutiiniDataStruct) async {
  if (rutiiniDataStruct == null) {
    return getTreeniRutiiniFirestoreData(createTreeniRutiiniStruct());
  }
  Map<String, dynamic> map = getTreeniRutiiniFirestoreData(rutiiniDataStruct);
  map['isTreeniPohja'] = false;
  return map;
}
