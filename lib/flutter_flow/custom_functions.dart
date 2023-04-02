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

String? rutiininToistotJaPainoString(
  LiikeStruct? liike,
  String langCode,
) {
  if (liike == null) return '';
  bool isKg = currentUserDocument?.isWeightUnitKg ?? true;
  final String sarjat = liike?.sarjaMaara.toString() ?? '0';
  final String toistot = liike?.toistoMaara.toString() ?? '0';
  final String paino = (liike?.aloitusPainoKg.toString() ?? '0') + 'kg';
  if (liike?.isOtherExerciseType ?? false) {
    final double seconds = liike.kestoSekunteina ?? 0;
    int hours = (seconds / 3600).floor();
    int minutes = ((seconds / 60) % 60).floor();
    int secs = (seconds % 60).floor();

    String hoursStr = (hours < 10) ? "0$hours" : "$hours";
    String minutesStr = (minutes < 10) ? "0$minutes" : "$minutes";
    String secondsStr = (secs < 10) ? "0$secs" : "$secs";
    String kestoStr = hoursStr + 'h ' + minutesStr + 'm ' + secondsStr + 's';
    final meters = liike.matkaMetri ?? 0;
    int kilometers = (meters / 1000).floor();
    int metersRemaining = (meters % 1000).floor();

    String kilometersStr = (kilometers > 0) ? "$kilometers km" : "";
    String metersStr = (metersRemaining > 0) ? "$metersRemaining m" : "0 m";
    String matkaStr = '';
    if (kilometers > 0 && metersRemaining > 0) {
      matkaStr = "$kilometersStr $metersStr";
    } else {
      matkaStr = "$kilometersStr $metersStr";
    }
    return kestoStr + '\n' + matkaStr;
  } else {
    String sarjoja = '';
    switch (langCode) {
      case 'fi':
        sarjoja = 'sarjaa';
        break;
      case 'en':
        sarjoja = 'sets';
        break;
      default:
    }
    String toistoja = '';
    switch (langCode) {
      case 'fi':
        toistoja = 'toistoa';
        break;
      case 'en':
        toistoja = 'reps';
        break;
      default:
    }
    return sarjat + ' ' + sarjoja + '\n' + toistot + ' ' + toistoja;
  }
}

TreeniRutiiniStruct? getTreeniRutiiniByName(
  List<TreeniRutiiniStruct>? rutiinitList,
  String? name,
) {
  if (rutiinitList == null || rutiinitList.isEmpty || name == null || name.isEmpty) return null;
  return rutiinitList.firstWhere((rutiini) => rutiini.nimi == name);
}

List<String> mapRutiiniNimet(List<TreeniRutiiniStruct>? treeniRutiinit) {
  if (treeniRutiinit == null || treeniRutiinit.isEmpty) return [];
  return treeniRutiinit.toList().map((rutiini) => rutiini?.nimi ?? '').toList();
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
  ValitutViikonPaivatStruct valitutViikonPaivatStruct = createValitutViikonPaivatStruct(
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
  List<TreeniRutiiniStruct> list = rutiiList.toList();
  if (navbarIndex == 0 && seachbarString != null && seachbarString.isNotEmpty) {
    list.retainWhere((rut) => rut.nimi!.toLowerCase().contains(seachbarString.toLowerCase()) || rut.kommentti!.toLowerCase().contains(seachbarString.toLowerCase()));
    //list.sort((a, b) => stringSimilarity(b.nimi, seachbarString).compareTo(stringSimilarity(a.nimi, seachbarString)));
  }
  if (reverseList != null && reverseList) list.reversed.toList();
  return list ?? [] as List<TreeniRutiiniStruct>;
}

String durationFromStartEnd(
  DateTime? start,
  DateTime? end,
  String? langCode,
) {
  if (start == null) {
    return '';
  }
  end = end ?? DateTime.now();
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
  int maxLength = string1.length > string2.length ? string1.length : string2.length;

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
  try {
    final treeniRutiini = serializers.deserializeWith(
      treeniRutiiniSerializer,
      json,
    );
    return treeniRutiini!;
  } on Exception catch (e) {
    print('Error: $e');
  }
  return createTreeniRutiiniStruct();
}

double? remainingSeconds(double? seconds) {
  if (seconds == null) return null;
  double remainingSeconds = seconds % 60;
  return remainingSeconds;
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

int? remainingMinutes(double? seconds) {
  if (seconds == null) return null;

  int minutes = ((seconds % 3600) ~/ 60).toInt();
  return minutes;
}

String? treenipaivatString(
  ValitutViikonPaivatStruct valitutViikonPaivat,
  String? langCode,
) {
  if (valitutViikonPaivat == null) return '';

  List<String> paivat;
  switch (langCode) {
    case 'fi':
      paivat = ['Ma', 'Ti', 'Ke', 'To', 'Pe', 'La', 'Su'];
      break;
    case 'en':
      paivat = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      break;
    default:
      paivat = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  }

  String str = '';
  str = valitutViikonPaivat.ma ?? false ? str = str + paivat[0] + ', ' : str;
  str = valitutViikonPaivat.ti ?? false ? str = str + paivat[1] + ', ' : str;
  str = valitutViikonPaivat.ke ?? false ? str = str + paivat[2] + ', ' : str;
  str = valitutViikonPaivat.to ?? false ? str = str + paivat[3] + ', ' : str;
  str = valitutViikonPaivat.pe ?? false ? str = str + paivat[4] + ', ' : str;
  str = valitutViikonPaivat.la ?? false ? str = str + paivat[5] + ', ' : str;
  str = valitutViikonPaivat.su ?? false ? str = str + paivat[6] : str;
  if (str.endsWith(', ')) {
    str = str.substring(0, str.length - 2);
  }
  return str;
}

double toSeconds(
  int? hours,
  int? minutes,
  double? seconds,
) {
  final double totalSeconds = ((hours ?? 0) * 3600) + ((minutes ?? 0) * 60) + (seconds ?? 0);
  return totalSeconds;
}

int? remainingHours(double? seconds) {
  if (seconds == null) return null;
  return (seconds / 3600).floor();
}

String durationFromSeconds(
  double? seconds,
  String langCode,
) {
  if (seconds == null) return '0 h 0 min 0 s';
  int hours = (seconds ~/ 3600).toInt();
  int minutes = ((seconds % 3600) ~/ 60).toInt();
  double remainingSeconds = seconds % 60;

  String result = '$hours hours, $minutes minutes, ${remainingSeconds.toStringAsFixed(2)} seconds';
  return result;
}

String? kestoString(
  double? sekunnit,
  String? langCode,
) {
  // convert sekunnit to days, hours, minutes and seconds and return as string
  if (sekunnit == null) {
    return null;
  }
  int days = sekunnit ~/ 86400;
  int hours = (sekunnit % 86400) ~/ 3600;
  int minutes = ((sekunnit % 86400) % 3600) ~/ 60;
  double seconds = ((sekunnit % 86400) % 3600) % 60;
  String daysStr = (days == 0) ? '' : '$days days ';
  String hoursStr = (hours == 0) ? '' : '$hours hours ';
  String minutesStr = (minutes == 0) ? '' : '$minutes minutes ';
  String secondsStr = (seconds == 0) ? '' : '$seconds seconds';

  return '$daysStr$hoursStr$minutesStr$secondsStr';
}

double? lisaaSekunnit(
  DateTime? alku,
  DateTime? loppu,
  double? sekunnit,
) {
  // calculate seconds between alku and loppu and add to sekunnit. Return the sum
  if (alku == null || loppu == null) {
    return sekunnit;
  }
  if (sekunnit == null) sekunnit = 0;
  return sekunnit + loppu.difference(alku).inSeconds.toDouble();
}

dynamic liikeToLiikeJsonList(
  LiikeStruct? liike,
  List<LiikeStruct>? manyLiikes,
) {
  if (liike == null && manyLiikes == null) {
    return [];
  }
  if (liike != null) {
    return [getLiikeFirestoreData(liike, true)];
  }
  if (manyLiikes != null) {
    return getLiikeListFirestoreData(manyLiikes);
  }
}

List<LiikeStruct>? nullLiikeList() {
  return null;
}

List<dynamic> emptyJsonList() {
  return [];
}

List<TreeniSessiotRecord> filterSessioList(
  List<TreeniSessiotRecord>? sessioList,
  String? searchbarString,
  int navbarIndex,
) {
  if (searchbarString == null || searchbarString.isEmpty) return sessioList ?? [];

  var list = sessioList?.toList() ?? [];
  if (sessioList == null || sessioList.isEmpty) return [];
  if (navbarIndex == 2 && searchbarString != null && searchbarString.isNotEmpty) {
    list = sessioList.toList()..retainWhere((sessio) => sessio.treeniRutiiniData.nimi!.toLowerCase().contains(searchbarString.toLowerCase()) || sessio.treeniRutiiniData.kommentti!.toLowerCase().contains(searchbarString.toLowerCase()));
  }
  return list;
}

double doubleDurationInSecondsFromStarAndEnd(
  DateTime? start,
  DateTime? end,
) {
  if (start == null || end == null) return 0;
  return end.difference(start).inSeconds.toDouble();
}

double? allDurationInSecondsFromSessioDocs(List<TreeniSessiotRecord>? sessioDocs) {
  return 0.0;
}

List<LiikeStruct> liikkeetFromSessioDocsList(
  List<TreeniSessiotRecord>? sessioDocs,
  LiikeStruct? liike,
) {
  // get from treeniSessiot and treeniRutiiniData and find all liike from every treeniSessio document
  List<LiikeStruct> liikkeet = [];
  List<String> liikeNimet = [];
  if (sessioDocs != null) {
    for (TreeniSessiotRecord sessioDoc in sessioDocs) {
      if (sessioDoc.treeniRutiiniData != null) {
        TreeniRutiiniStruct rutiiniData = sessioDoc.treeniRutiiniData;
        if (rutiiniData?.liikkeet != null && rutiiniData.liikkeet.isNotEmpty) {
          for (LiikeStruct liike in rutiiniData.liikkeet) {
            if (liike != null && liike?.nimi != null && liike.nimi!.isNotEmpty) {
              if (!liikeNimet.contains(liike.nimi)) {
                liikkeet.add(liike);
                liikeNimet.add(liike.nimi!);
              }
            }
          }
        }
      }
    }
  }
  return liikkeet;
}

List<LiikeStruct>? allLiikkeetFromSessioDocs(List<TreeniSessiotRecord>? sessioDocs) {
  // get all unique liike from sessioDocs
  if (sessioDocs == null) return null;
  final List<LiikeStruct> liikeList = <LiikeStruct>[];
  for (TreeniSessiotRecord sessioDoc in sessioDocs) {
    for (LiikeStruct liike in sessioDoc.treeniRutiiniData.liikkeet) {
      if (!liikeList.contains(liike)) {
        liikeList.add(liike);
      }
    }
  }
  return liikeList;
}
