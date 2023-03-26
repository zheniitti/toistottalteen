import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'liike_tilasto_struct.g.dart';

abstract class LiikeTilastoStruct
    implements Built<LiikeTilastoStruct, LiikeTilastoStructBuilder> {
  static Serializer<LiikeTilastoStruct> get serializer =>
      _$liikeTilastoStructSerializer;

  String? get liikeNimi;

  double? get parasKerranMaksimiPainoKg;

  int? get parasToistoMaara;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(LiikeTilastoStructBuilder builder) => builder
    ..liikeNimi = ''
    ..parasKerranMaksimiPainoKg = 0.0
    ..parasToistoMaara = 0
    ..firestoreUtilData = FirestoreUtilData();

  LiikeTilastoStruct._();
  factory LiikeTilastoStruct(
          [void Function(LiikeTilastoStructBuilder) updates]) =
      _$LiikeTilastoStruct;
}

LiikeTilastoStruct createLiikeTilastoStruct({
  String? liikeNimi,
  double? parasKerranMaksimiPainoKg,
  int? parasToistoMaara,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LiikeTilastoStruct(
      (l) => l
        ..liikeNimi = liikeNimi
        ..parasKerranMaksimiPainoKg = parasKerranMaksimiPainoKg
        ..parasToistoMaara = parasToistoMaara
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

LiikeTilastoStruct? updateLiikeTilastoStruct(
  LiikeTilastoStruct? liikeTilasto, {
  bool clearUnsetFields = true,
}) =>
    liikeTilasto != null
        ? (liikeTilasto.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addLiikeTilastoStructData(
  Map<String, dynamic> firestoreData,
  LiikeTilastoStruct? liikeTilasto,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (liikeTilasto == null) {
    return;
  }
  if (liikeTilasto.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && liikeTilasto.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final liikeTilastoData =
      getLiikeTilastoFirestoreData(liikeTilasto, forFieldValue);
  final nestedData =
      liikeTilastoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = liikeTilasto.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getLiikeTilastoFirestoreData(
  LiikeTilastoStruct? liikeTilasto, [
  bool forFieldValue = false,
]) {
  if (liikeTilasto == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(LiikeTilastoStruct.serializer, liikeTilasto);

  // Add any Firestore field values
  liikeTilasto.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLiikeTilastoListFirestoreData(
  List<LiikeTilastoStruct>? liikeTilastos,
) =>
    liikeTilastos?.map((l) => getLiikeTilastoFirestoreData(l, true)).toList() ??
    [];
