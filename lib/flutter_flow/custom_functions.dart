import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String? liikkeenToistot(LiikeStruct? liike) {
  if (liike == null) return 'null';
  final String setit = liike?.sarjaMaara.toString() ?? '';
  final String toistot = liike?.toistoMaara.toString() ?? '';
  final String paino = (liike?.aloitusPainoKg.toString() ?? '0') + 'kg';
  return setit + ' x ' + toistot;
}

TreeniRutiiniStruct? getTreeniRutiiniByName(
  List<TreeniRutiiniStruct>? rutiinitList,
  String? name,
) {
  if (rutiinitList == null ||
      rutiinitList.isEmpty ||
      name == null ||
      name.isEmpty) return null;
  return rutiinitList.firstWhere((rutiini) => rutiini.nimi == name);
}

List<String> mapRutiiniNimet(List<TreeniRutiiniStruct>? treeniRutiinit) {
  if (treeniRutiinit == null || treeniRutiinit.isEmpty) return [];
  return treeniRutiinit.toList().map((rutiini) => rutiini.nimi).toList()
      as List<String>;
}

bool showLuoRutiiniButton(List<TreeniRutiiniStruct>? rutiiniList) {
  // return false if atleast one of the rutiini in the rutiiniList has finishedEditing field set to false
  if (rutiiniList == null || rutiiniList.isEmpty) return true;
  return rutiiniList.every((rutiini) => rutiini.finishedEditing == true);
}

ValitutViikonPaivatStruct updatedValitutViikonPaivat(
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  bool? mon,
  bool? tue,
  bool? wed,
  bool? thu,
  bool? fri,
  bool? sat,
  bool? sun,
) {
  if (valitutViikonPaivat == null) {
    return createValitutViikonPaivatStruct();
  }
  return createValitutViikonPaivatStruct(
      ma: mon ?? valitutViikonPaivat?.ma ?? false,
      ti: tue ?? valitutViikonPaivat?.ti ?? false,
      ke: wed ?? valitutViikonPaivat?.ke ?? false,
      to: thu ?? valitutViikonPaivat?.to ?? false,
      pe: fri ?? valitutViikonPaivat?.pe ?? false,
      la: sat ?? valitutViikonPaivat?.la ?? false,
      su: sun ?? valitutViikonPaivat?.su ?? false,
      clearUnsetFields: false);
}
