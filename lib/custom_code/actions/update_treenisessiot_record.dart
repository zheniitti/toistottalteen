// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../auth/auth_util.dart';

Future updateTreenisessiotRecord(
  TreeniSessiotRecord? sessiotRecord,
  DateTime? alku,
  DateTime? loppu,
  TreeniRutiiniStruct? rutiini,
  bool? isEditing,
  DateTime? lastModifiedTime,
  bool? createRecordIfNull,
) async {
  var sessioRef = sessiotRecord?.reference;
  if (sessioRef == null && createRecordIfNull != null && createRecordIfNull) {
    sessioRef = TreeniSessiotRecord.collection.doc();
  }
  if (sessioRef == null) {
    return;
  }

  final Map<String, Object?> sessiotUpdateData = {
    if (sessiotRecord?.userRef == null) 'userRef': currentUserReference,
    if (sessiotRecord?.docCreatedTime == null)
      'docCreatedTime': FieldValue.serverTimestamp(),
    if (alku != null) 'alku': alku,
    if (loppu != null) 'loppu': loppu,
    if (!(rutiini == null && sessiotRecord?.treeniRutiiniData == null))
      'treeniRutiiniData': getTreeniRutiiniFirestoreData(
          rutiini ?? sessiotRecord?.treeniRutiiniData, true),
    if (isEditing != null) 'isEditing': isEditing,
    if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
  };

  if (sessiotRecord != null)
    await sessioRef.update(sessiotUpdateData);
  else
    await sessioRef.set(sessiotUpdateData);
}
