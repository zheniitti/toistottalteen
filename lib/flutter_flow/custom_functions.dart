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
  final String paino = (liike?.painoKg.toString() ?? '0') + 'kg';
  return setit + ' x ' + toistot + ' x ' + paino;
}

LiikeStruct paivitaLiike(
  String nimi,
  int? toistoMaara,
  int? sarjaMaara,
  double? painoKg,
  double? matkaMetrit,
  int? kestoMinuutit,
  double? kestoSekunnit,
  String? tyyppi,
  String? kommentti,
  LiikeStruct liike,
) {
  // create LiikeStruct using the parameters
  /*liike.rebuild(
    (p0) {
      return {
        nimi: nimi,
        toistoMaara: toistoMaara,
        sarjaMaara: sarjaMaara,
        painoKg: painoKg,
        matkaMetrit: matkaMetrit,
        kestoMinuutit: kestoMinuutit,
        kestoSekunnit: kestoSekunnit,
        tyyppi: tyyppi,
        kommentti: kommentti,
      };
    },
  );*/

  return liike;
}

LiikeStruct emptyLiike() {
  return LiikeStruct();
}

TreeniRutiiniStruct emptyRutiini() {
  return TreeniRutiiniStruct();
}

TreeniSessioStruct? emptySessio() {
  return TreeniSessioStruct();
}