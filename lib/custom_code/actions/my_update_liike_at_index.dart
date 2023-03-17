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

Future myUpdateLiikeAtIndex(
  int liikeIndex,
  TreeniRutiiniStruct? treeniRutiini,
  String? liikeNimi,
  String? liikeKommentti,
  int? toistoMaara,
  int? sarjaMaara,
  double? aloitusPainoKg,
  String? liikeTyyppi,
  bool? isTehty,
  bool? showKommentti,
  double? matkaMetreina,
  double? kestoSekunteina,
) async {
  if (treeniRutiini == null || treeniRutiini.createdTime == null) return;

  final int rutiiniIndex = currentUserDocument!.treeniRutiinit!.indexWhere(
      (rutiini) => rutiini.createdTime! == treeniRutiini?.createdTime);
  List<Map<String, dynamic>> rutiinitListaFirestoreData =
      getTreeniRutiiniListFirestoreData(
          currentUserDocument?.treeniRutiinit?.toList() ?? []);
  if (rutiinitListaFirestoreData.isEmpty) return;

  Map<String, dynamic> rutiiniFirestoreData =
      rutiinitListaFirestoreData[rutiiniIndex];
  List<LiikeStruct> liikkeet = treeniRutiini?.liikkeet?.toList() ?? [];
  Map<String, dynamic> liikeFirestoreData =
      getLiikeFirestoreData(liikkeet[liikeIndex], true);

  rutiiniFirestoreData['finishedEditing'] = false;
  liikeFirestoreData['nimi'] = liikeNimi ?? liikeFirestoreData['nimi'];
  liikeFirestoreData['kommentti'] =
      liikeKommentti ?? liikeFirestoreData['kommentti'];
  liikeFirestoreData['toistoMaara'] =
      toistoMaara ?? liikeFirestoreData['toistoMaara'];
  liikeFirestoreData['sarjaMaara'] =
      sarjaMaara ?? liikeFirestoreData['sarjaMaara'];
  liikeFirestoreData['aloitusPainoKg'] =
      aloitusPainoKg ?? liikeFirestoreData['aloitusPainoKg'];
  liikeFirestoreData['liikeTyyppi'] =
      liikeTyyppi ?? liikeFirestoreData['liikeTyyppi'];
  liikeFirestoreData['tehty'] = isTehty ?? liikeFirestoreData['tehty'];
  liikeFirestoreData['showKommentti'] =
      showKommentti ?? liikeFirestoreData['showKommentti'];
  liikeFirestoreData['matkaMetri'] =
      matkaMetreina ?? liikeFirestoreData['matkaMetri'];
  liikeFirestoreData['kestoSekunteina'] =
      kestoSekunteina ?? liikeFirestoreData['kestoSekunteina'];

  rutiiniFirestoreData['liikkeet'][liikeIndex] = liikeFirestoreData;
  rutiinitListaFirestoreData[rutiiniIndex] = rutiiniFirestoreData;
  await currentUserReference!
      .update({'treeniRutiinit': rutiinitListaFirestoreData});
}
