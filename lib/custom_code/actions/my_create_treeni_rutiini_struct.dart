// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<TreeniRutiiniStruct> myCreateTreeniRutiiniStruct(
    bool? finishedEditing) async {
  // Add your function code here!
  return createTreeniRutiiniStruct(
      isTreeniPohja: true,
      createdTime: getCurrentTimestamp,
      fieldValues: {
        'liikkeet': getLiikeListFirestoreData([createLiikeStruct()])
      },
      finishedEditing: finishedEditing ?? true,
      clearUnsetFields: false,
      create: true);
}
