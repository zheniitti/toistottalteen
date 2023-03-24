import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'liike_struct.g.dart';

abstract class LiikeStruct implements Built<LiikeStruct, LiikeStructBuilder> {
  static Serializer<LiikeStruct> get serializer => _$liikeStructSerializer;

  String? get nimi;

  String? get kommentti;

  int? get toistoMaara;

  int? get sarjaMaara;

  BuiltList<SarjaStruct> get sarjat;

  double? get aloitusPainoKg;

  double? get matkaMetri;

  bool? get tehty;

  BuiltList<String>? get photos;

  double? get kestoSekunteina;

  bool? get isOtherExerciseType;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(LiikeStructBuilder builder) => builder
    ..nimi = ''
    ..kommentti = ''
    ..toistoMaara = 0
    ..sarjaMaara = 0
    ..sarjat = ListBuilder()
    ..aloitusPainoKg = 0.0
    ..matkaMetri = 0.0
    ..tehty = false
    ..photos = ListBuilder()
    ..kestoSekunteina = 0.0
    ..isOtherExerciseType = false
    ..firestoreUtilData = FirestoreUtilData();

  LiikeStruct._();
  factory LiikeStruct([void Function(LiikeStructBuilder) updates]) =
      _$LiikeStruct;
}

LiikeStruct createLiikeStruct({
  String? nimi,
  String? kommentti,
  int? toistoMaara,
  int? sarjaMaara,
  double? aloitusPainoKg,
  double? matkaMetri,
  bool? tehty,
  double? kestoSekunteina,
  bool? isOtherExerciseType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LiikeStruct(
      (l) => l
        ..nimi = nimi
        ..kommentti = kommentti
        ..toistoMaara = toistoMaara
        ..sarjaMaara = sarjaMaara
        ..sarjat = null
        ..aloitusPainoKg = aloitusPainoKg
        ..matkaMetri = matkaMetri
        ..tehty = tehty
        ..photos = null
        ..kestoSekunteina = kestoSekunteina
        ..isOtherExerciseType = isOtherExerciseType
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
