// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import '../../auth/auth_util.dart';

Future updateTreenisessiotRecord(
  TreeniSessiotRecord? sessiotRecord,
  DateTime? alku,
  DateTime? loppu,
  TreeniRutiiniStruct? rutiini,
  bool? isEditing,
  DateTime? lastModifiedTime,
  bool? createRecordIfNull,
  bool? fillSarjatForEveryLiike,
) async {
  var sessioRef = sessiotRecord?.reference;
  if (sessioRef == null && createRecordIfNull != null && createRecordIfNull) {
    sessioRef = TreeniSessiotRecord.collection.doc();
  }
  if (sessioRef == null) {
    return;
  }

  TreeniRutiiniStruct? treeniRutiini =
      rutiini ?? sessiotRecord?.treeniRutiiniData;
  // fill sarjat for every liike based on Liike's sarjaMaara
  if (fillSarjatForEveryLiike != null && fillSarjatForEveryLiike)
    try {
      if (treeniRutiini != null &&
          treeniRutiini.liikkeet != null &&
          treeniRutiini.liikkeet.isNotEmpty) {
        ListBuilder<LiikeStruct> liikkeet =
            (treeniRutiini.liikkeet.toBuilder() ?? [])
                as ListBuilder<LiikeStruct>;
        liikkeet.map((liike) {
          if (liike.sarjaMaara != null && liike.sarjaMaara != 0) {
            ListBuilder<SarjaStruct> sarjatList = List.filled(
                    liike.sarjaMaara ?? 0,
                    createSarjaStruct(
                        create: true,
                        createdTime: getCurrentTimestamp,
                        paino: liike.aloitusPainoKg ?? 0.0,
                        toistoMaara: liike.toistoMaara ?? 0))
                .toBuiltList()
                .toBuilder();
            LiikeStructBuilder liikeBuilder = liike.toBuilder()
              ..sarjat = sarjatList as ListBuilder<SarjaStruct>;
            liike = liikeBuilder.build();
            return liike;
          }
          return liike;
        });
        treeniRutiini = treeniRutiini.rebuild(
            (rut) => rut.liikkeet = liikkeet as ListBuilder<LiikeStruct>?);
      }
    } on Exception catch (e) {
      print('Error: Fill sarjat for every liike: $e ');
    }
  // fill sarjat for every liike end
  final rutiiniFirestoreData =
      getTreeniRutiiniFirestoreData(treeniRutiini, true);

  final Map<String, Object?> sessiotUpdateData = {
    if (sessiotRecord?.userRef == null) 'userRef': currentUserReference,
    if (sessiotRecord?.docCreatedTime == null)
      'docCreatedTime': FieldValue.serverTimestamp(),
    if (alku != null) 'alku': alku,
    if (loppu != null) 'loppu': loppu,
    if (!(rutiini == null && sessiotRecord?.treeniRutiiniData == null))
      'treeniRutiiniData': rutiiniFirestoreData,
    if (isEditing != null) 'isEditing': isEditing,
    'modifiedTime': lastModifiedTime,
  };

  if (sessiotRecord != null)
    await sessioRef.update(sessiotUpdateData);
  else
    await sessioRef.set(sessiotUpdateData);
}
