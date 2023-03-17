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

String? rutiininToistotJaPaino(LiikeStruct? liike) {
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
  ValitutViikonPaivatStruct valitutViikonPaivatStruct =
      createValitutViikonPaivatStruct(
          ma: mon ?? valitutViikonPaivat.ma ?? false,
          ti: tue ?? valitutViikonPaivat.ti ?? false,
          ke: wed ?? valitutViikonPaivat.ke ?? false,
          to: thu ?? valitutViikonPaivat.to ?? false,
          pe: fri ?? valitutViikonPaivat.pe ?? false,
          la: sat ?? valitutViikonPaivat.la ?? false,
          su: sun ?? valitutViikonPaivat.su ?? false,
          clearUnsetFields: false);

  return valitutViikonPaivatStruct;
}

List<TreeniRutiiniStruct> filterRutiiniList(
  List<TreeniRutiiniStruct> rutiiList,
  String? seachbarString,
  int? navbarIndex,
  bool? reverseList,
) {
  final list = rutiiList.toList();
  if (navbarIndex == 0 && seachbarString != null && seachbarString.isNotEmpty) {
    list.toList().retainWhere((element) => seachbarString
        .toLowerCase()
        .contains((element.nimi ?? '').toLowerCase()));
  }
  if (reverseList != null && reverseList) list.reversed.toList();
  return list;
}

String duration(
  DateTime? start,
  DateTime? end,
  String? langCode,
) {
  if (start == null || end == null) {
    return '';
  }
  final Duration duration = end.difference(start);
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes % 60;
  final int seconds = duration.inSeconds % 60;
  if (hours == 0) {
    return '$minutes min $seconds s';
  } else
    return '$hours h $minutes min $seconds s';
}

double stringSimilarity(
  String? string1,
  String? string2,
) {
  if (string1 == null || string2 == null) return 0.0;
  // Convert both strings to lowercase
  string1 = string1.toLowerCase();
  string2 = string2.toLowerCase();

  // Calculate the length of the longer string
  int maxLength =
      string1.length > string2.length ? string1.length : string2.length;

  // Initialize variables for counting matches and differences
  int matches = 0;
  int differences = 0;

  // Loop through each character in the longer string
  for (int i = 0; i < maxLength; i++) {
    // Get the character at index i for each string
    String char1 = i < string1.length ? string1[i] : '';
    String char2 = i < string2.length ? string2[i] : '';

    // Compare the characters
    if (char1 == char2) {
      matches++;
    } else {
      differences++;
    }
  }

  // Calculate the similarity as a percentage
  double similarity = (matches / (matches + differences)) * 100;

  return similarity;
}

int addNumberTo(
  int add,
  int toBeAdded,
) {
  return add + toBeAdded;
}

TreeniRutiiniStruct jsonToRutiini(dynamic json) {
  final treeniRutiiniSerializer = TreeniRutiiniStruct.serializer;

  // Deserialize the map to a BuiltValue instance.
  final treeniRutiini = serializers.deserializeWith(
    treeniRutiiniSerializer,
    json,
  );

  // Return the resulting instance.
  return treeniRutiini!;
}

ValitutViikonPaivatStruct myCreateValitutViikonPaivat(
  bool? ma,
  bool? ti,
  bool? ke,
  bool? to,
  bool? pe,
  bool? la,
  bool? su,
) {
  return createValitutViikonPaivatStruct(
    ma: ma ?? false,
    ti: ti ?? false,
    ke: ke ?? false,
    to: to ?? false,
    pe: pe ?? false,
    la: la ?? false,
    su: su ?? false,
  );
}
