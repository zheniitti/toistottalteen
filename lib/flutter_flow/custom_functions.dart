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
