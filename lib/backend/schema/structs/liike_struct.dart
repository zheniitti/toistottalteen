import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'liike_struct.g.dart';

abstract class LiikeStruct implements Built<LiikeStruct, LiikeStructBuilder> {
  static Serializer<LiikeStruct> get serializer => _$liikeStructSerializer;

  String? get nimi;

  int? get toistoMaara;

  int? get sarjaMaara;

  String? get liikeTyyppi;

  double? get painoKg;

  String? get kommentti;

  double? get matkaMetri;

  double? get kestoSekunnit;

  int? get kestoMinuutit;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(LiikeStructBuilder builder) => builder
    ..nimi = ''
    ..toistoMaara = 0
    ..sarjaMaara = 0
    ..liikeTyyppi = ''
    ..painoKg = 0.0
    ..kommentti = ''
    ..matkaMetri = 0.0
    ..kestoSekunnit = 0.0
    ..kestoMinuutit = 0
    ..firestoreUtilData = FirestoreUtilData();

  LiikeStruct._();
  factory LiikeStruct([void Function(LiikeStructBuilder) updates]) =
      _$LiikeStruct;
}

LiikeStruct createLiikeStruct({
  String? nimi,
  int? toistoMaara,
  int? sarjaMaara,
  String? liikeTyyppi,
  double? painoKg,
  String? kommentti,
  double? matkaMetri,
  double? kestoSekunnit,
  int? kestoMinuutit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LiikeStruct(
      (l) => l
        ..nimi = nimi
        ..toistoMaara = toistoMaara
        ..sarjaMaara = sarjaMaara
        ..liikeTyyppi = liikeTyyppi
        ..painoKg = painoKg
        ..kommentti = kommentti
        ..matkaMetri = matkaMetri
        ..kestoSekunnit = kestoSekunnit
        ..kestoMinuutit = kestoMinuutit
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

LiikeStruct? updateLiikeStruct(
  LiikeStruct? liike, {
  bool clearUnsetFields = true,
}) =>
    liike != null
        ? (liike.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addLiikeStructData(
  Map<String, dynamic> firestoreData,
  LiikeStruct? liike,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (liike == null) {
    return;
  }
  if (liike.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && liike.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final liikeData = getLiikeFirestoreData(liike, forFieldValue);
  final nestedData = liikeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = liike.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getLiikeFirestoreData(
  LiikeStruct? liike, [
  bool forFieldValue = false,
]) {
  if (liike == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(LiikeStruct.serializer, liike);

  // Add any Firestore field values
  liike.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLiikeListFirestoreData(
  List<LiikeStruct>? liikes,
) =>
    liikes?.map((l) => getLiikeFirestoreData(l, true)).toList() ?? [];
