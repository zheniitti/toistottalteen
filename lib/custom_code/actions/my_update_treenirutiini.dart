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

Future myUpdateTreenirutiini(
  TreeniRutiiniStruct? treeniRutiini,
  bool? lisaaUusiLiike,
  bool? poistaViimeisinLiike,
  bool? finishedEditing,
  bool? isTreeniPohja,
  int? poistaLiikeIndeksissa,
  String? name,
  String? kommentti,
  List<LiikeStruct>? liikkeet,
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  bool? widgetExpanded,
  DateTime? lastWorkoutTime,
  bool? showComment,
  bool? addModifiedTime,
  bool? deleteThisRutiini,
) async {
  if (treeniRutiini == null || treeniRutiini.createdTime == null) return;
  List<TreeniRutiiniStruct>? rutiinitLista =
      currentUserDocument?.treeniRutiinit?.toList() ?? [];
  List<Map<String, dynamic>> rutiiniListaFirestoreData =
      getTreeniRutiiniListFirestoreData(rutiinitLista);
  if (rutiinitLista.isEmpty) return;

  final int rutiiniIndex = rutiinitLista.indexWhere(
      (rutiini) => rutiini.createdTime! == treeniRutiini?.createdTime);
  Map<String, dynamic> rutiiniFirestoreData =
      getTreeniRutiiniFirestoreData(treeniRutiini);

  try {
    if (deleteThisRutiini != null && deleteThisRutiini) {
      rutiiniListaFirestoreData.removeAt(rutiiniIndex);
      await currentUserReference!
          .update({'treeniRutiinit': rutiiniListaFirestoreData});
      return;
    }
  } on Exception catch (e) {
    print('Rutiinin poisto epäonnistui: $e');
  }

  try {
    if (lisaaUusiLiike != null && lisaaUusiLiike) {
      List<LiikeStruct> liikkeet = treeniRutiini.liikkeet.toList();
      liikkeet.add(await createLiike('', '', '', null, []));
      rutiiniFirestoreData['liikkeet'] = getLiikeListFirestoreData(liikkeet);
    } else if (poistaViimeisinLiike != null && poistaViimeisinLiike) {
      List<LiikeStruct> liikkeet = treeniRutiini.liikkeet.toList();
      liikkeet.removeLast();
      rutiiniFirestoreData['liikkeet'] = getLiikeListFirestoreData(liikkeet);
    }
  } on Exception catch (e) {
    print('Rutiinin liikkeen lisäys tai poisto epäonnistui: $e');
  }

  try {
    if (finishedEditing != null && finishedEditing) {
      rutiiniFirestoreData['finishedEditing'] = finishedEditing;
    }
  } on Exception catch (e) {
    print('Rutiinin finishedEditing päivitys epäonnistui: $e');
  }

  try {
    if (isTreeniPohja != null) {
      rutiiniFirestoreData['isTreeniPohja'] = isTreeniPohja;
    }
  } on Exception catch (e) {
    print('Rutiinin isTreeniPohja päivitys epäonnistui: $e');
  }

  try {
    if (poistaLiikeIndeksissa != null) {
      List<LiikeStruct> liikkeet = treeniRutiini?.liikkeet.toList() ?? [];
      liikkeet.removeAt(poistaLiikeIndeksissa);
      rutiiniFirestoreData['liikkeet'] = getLiikeListFirestoreData(liikkeet);
    }
  } on Exception catch (e) {
    print('Rutiinin liikkeen poisto epäonnistui: $e');
  }

  try {
    if (name != null) {
      rutiiniFirestoreData['nimi'] = name;
    }
  } on Exception catch (e) {
    print('Rutiinin nimen päivitys epäonnistui: $e');
  }

  try {
    if (kommentti != null) {
      rutiiniFirestoreData['kommentti'] = kommentti;
    }
  } on Exception catch (e) {
    print('Rutiinin kommentin päivitys epäonnistui: $e');
  }

  try {
    if (valitutViikonPaivat != null) {
      rutiiniFirestoreData['valitutViikonPaivat'] =
          getValitutViikonPaivatFirestoreData(valitutViikonPaivat, true);
    }
  } on Exception catch (e) {
    print('Rutiinin valittujen viikonpäivien päivitys epäonnistui: $e');
  }

  try {
    if (widgetExpanded != null) {
      rutiiniFirestoreData['widgetExpanded'] = widgetExpanded;
    }
  } on Exception catch (e) {
    print('Rutiinin widgetExpanded päivitys epäonnistui: $e');
  }

  try {
    if (lastWorkoutTime != null) {
      rutiiniFirestoreData['lastWorkoutTime'] = lastWorkoutTime;
    }
  } on Exception catch (e) {
    print('Rutiinin lastWorkoutTime päivitys epäonnistui: $e');
  }

  try {
    if (showComment != null) {
      rutiiniFirestoreData['showComment'] = showComment;
    }
  } on Exception catch (e) {
    print('Rutiinin showComment päivitys epäonnistui: $e');
  }

  /*
  try {
    if (addModifiedTime != null && addModifiedTime) {
      rutiiniFirestoreData['modifiedTimes'] = rutiiniFirestoreData['modifiedTimes'].toList()..add(getCurrentTimestamp);
    }
  } on Exception catch (e) {
    print('Rutiinin modifiedTimes päivitys epäonnistui: $e');
  }
  */

  try {
    //rutiinitLista[rutiiniIndex] = treeniRutiini!;
    rutiiniListaFirestoreData[rutiiniIndex] = rutiiniFirestoreData;
    await currentUserReference!
        .update({'treeniRutiinit': rutiiniListaFirestoreData});
  } on Exception catch (e) {
    print('Error: Rutiinin päivitys epäonnistui: $e');
  }
}
