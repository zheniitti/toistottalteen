import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'sarja_struct.g.dart';

abstract class SarjaStruct implements Built<SarjaStruct, SarjaStructBuilder> {
  static Serializer<SarjaStruct> get serializer => _$sarjaStructSerializer;

  int? get toistoMaara;

  double? get paino;

  double? get matkaMetreina;

  double? get kestoSekunteina;

  DateTime? get createdTime;

  DateTime? get modifiedTime;

  DateTime? get doneDatetime;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(SarjaStructBuilder builder) => builder
    ..toistoMaara = 0
    ..paino = 0.0
    ..matkaMetreina = 0.0
    ..kestoSekunteina = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  SarjaStruct._();
  factory SarjaStruct([void Function(SarjaStructBuilder) updates]) =
      _$SarjaStruct;
}

SarjaStruct createSarjaStruct({
  int? toistoMaara,
  double? paino,
  double? matkaMetreina,
  double? kestoSekunteina,
  DateTime? createdTime,
  DateTime? modifiedTime,
  DateTime? doneDatetime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SarjaStruct(
      (s) => s
        ..toistoMaara = toistoMaara
        ..paino = paino
        ..matkaMetreina = matkaMetreina
        ..kestoSekunteina = kestoSekunteina
        ..createdTime = createdTime
        ..modifiedTime = modifiedTime
        ..doneDatetime = doneDatetime
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

SarjaStruct? updateSarjaStruct(
  SarjaStruct? sarja, {
  bool clearUnsetFields = true,
}) =>
    sarja != null
        ? (sarja.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addSarjaStructData(
  Map<String, dynamic> firestoreData,
  SarjaStruct? sarja,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sarja == null) {
    return;
  }
  if (sarja.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && sarja.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sarjaData = getSarjaFirestoreData(sarja, forFieldValue);
  final nestedData = sarjaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = sarja.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getSarjaFirestoreData(
  SarjaStruct? sarja, [
  bool forFieldValue = false,
]) {
  if (sarja == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(SarjaStruct.serializer, sarja);

  // Add any Firestore field values
  sarja.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSarjaListFirestoreData(
  List<SarjaStruct>? sarjas,
) =>
    sarjas?.map((s) => getSarjaFirestoreData(s, true)).toList() ?? [];
