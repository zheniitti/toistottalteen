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

Future<TreeniRutiiniStruct?> myUpdateTreeniRutiiniStruct(
  TreeniRutiiniStruct? treeniRutiini,
  DateTime? createdTime,
  String? nimi,
  List<LiikeStruct>? liikkeet,
  String? kommentti,
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  DateTime? lastWorkoutTime,
  bool? isTreeniPohja,
  bool? finishedEditing,
  bool? addNewLiike,
  int? removeLiikeAtIndex,
  int? addNewLiikeAtBelowThisIndex,
  int? addNewLiikeAtAboveThisIndex,
  int? replaceLiikeAtIndex,
  LiikeStruct? replacingLiike,
  int? currentLiikeIndex,
  List<dynamic>? copiedLiikes,
  bool? pasteToAbove,
  bool? pasteToBelow,
) async {
  if (treeniRutiini == null)
    treeniRutiini = createTreeniRutiiniStruct(
        create: true, createdTime: getCurrentTimestamp);

  ListBuilder<LiikeStruct> liikeList = liikkeet != null
      ? ListBuilder<LiikeStruct>(liikkeet)
      : treeniRutiini.liikkeet.toBuilder();
  liikeList.removeWhere((liike) => liike.createdTime == null);
  String toiminto = '';
  try {
    LiikeStruct newEmptyLiike = await luoLiikeRutiinipohjalle(
        null, null, null, false, null, null, null, null);
    if (removeLiikeAtIndex != null) {
      toiminto = 'Poista liike';
      liikeList.removeAt(removeLiikeAtIndex);
    } else if (addNewLiike != null && addNewLiike) {
      toiminto = 'Lisää uusi liike';
      liikeList.add(newEmptyLiike);
    } else if (addNewLiikeAtBelowThisIndex != null) {
      toiminto = 'Lisää uusi liike below this $addNewLiikeAtBelowThisIndex';
      liikeList.insert(addNewLiikeAtBelowThisIndex + 1, newEmptyLiike);
    } else if (addNewLiikeAtAboveThisIndex != null) {
      toiminto = 'Lisää uusi liike above this $addNewLiikeAtAboveThisIndex';
      liikeList.insert(addNewLiikeAtAboveThisIndex, newEmptyLiike);
    } else if (replaceLiikeAtIndex != null &&
        replacingLiike != null &&
        replaceLiikeAtIndex >= 0) {
      toiminto = 'Korvaa liike';
      liikeList[replaceLiikeAtIndex] = replacingLiike;
    } else if (currentLiikeIndex != null && copiedLiikes != null) {
      toiminto = 'Liitä liike';
      final Iterable<LiikeStruct> copiedLiikesList =
          copiedLiikes.map<LiikeStruct>(
        (liikeMap) {
          LiikeStruct? liikeStruct;
          try {
            liikeStruct =
                serializers.deserializeWith(LiikeStruct.serializer, liikeMap);
          } on Exception catch (e) {
            print('Error: $toiminto epäonnistui: $e');
          }

          //päivitetään sarjan createdTime ja modifiedTime
          ListBuilder<SarjaStruct>? sarjatListbuilder =
              liikeStruct?.sarjat?.toBuilder()
                ?..map((sar) {
                  final sarbuilder = sar.toBuilder()
                    ..createdTime = getCurrentTimestamp
                    ..modifiedTime = getCurrentTimestamp;
                  return sarbuilder.build();
                });

          LiikeStructBuilder? liikeStructBuilder = liikeStruct?.toBuilder()
            ?..firestoreUtilData =
                FirestoreUtilData(clearUnsetFields: false, create: true)
            ..sarjat = sarjatListbuilder
            ..tehty = false
            ..createdTime = getCurrentTimestamp
            ..modifiedTime = getCurrentTimestamp;
          return liikeStructBuilder?.build() ??
              createLiikeStruct(createdTime: getCurrentTimestamp, create: true);
        },
      ).toList();
      if (pasteToAbove != null && pasteToAbove) {
        liikeList.insertAll(currentLiikeIndex, copiedLiikesList);
      } else if (pasteToBelow != null && pasteToBelow) {
        liikeList.insertAll(currentLiikeIndex + 1, copiedLiikesList);
      }
    }
  } on Exception catch (e) {
    print('Error: $toiminto epäonnistui: $e');
  }

  final updatedTreeniRutiini = treeniRutiini.toBuilder()
    ..firestoreUtilData =
        FirestoreUtilData(clearUnsetFields: false, create: true)
    ..createdTime = createdTime ?? treeniRutiini.createdTime
    ..nimi = nimi?.trim() ?? treeniRutiini.nimi?.trim()
    ..liikkeet = liikeList
    ..kommentti = kommentti?.trim() ?? treeniRutiini.kommentti?.trim()
    ..valitutViikonPaivat = valitutViikonPaivat != null
        ? valitutViikonPaivat.toBuilder()
        : treeniRutiini.valitutViikonPaivat.toBuilder()
    ..isTreeniPohja = isTreeniPohja ?? treeniRutiini.isTreeniPohja
    ..finishedEditing = finishedEditing ?? treeniRutiini.finishedEditing;

  TreeniRutiiniStruct updatedRutiiniStruct = updatedTreeniRutiini.build();

  return updatedRutiiniStruct;
}
