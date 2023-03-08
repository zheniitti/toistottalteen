import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'valitut_viikon_paivat_struct.g.dart';

abstract class ValitutViikonPaivatStruct
    implements
        Built<ValitutViikonPaivatStruct, ValitutViikonPaivatStructBuilder> {
  static Serializer<ValitutViikonPaivatStruct> get serializer =>
      _$valitutViikonPaivatStructSerializer;

  bool? get ma;

  bool? get ti;

  bool? get ke;

  bool? get to;

  bool? get pe;

  bool? get la;

  bool? get su;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ValitutViikonPaivatStructBuilder builder) =>
      builder
        ..ma = false
        ..ti = false
        ..ke = false
        ..to = false
        ..pe = false
        ..la = false
        ..su = false
        ..firestoreUtilData = FirestoreUtilData();

  ValitutViikonPaivatStruct._();
  factory ValitutViikonPaivatStruct(
          [void Function(ValitutViikonPaivatStructBuilder) updates]) =
      _$ValitutViikonPaivatStruct;
}

ValitutViikonPaivatStruct createValitutViikonPaivatStruct({
  bool? ma,
  bool? ti,
  bool? ke,
  bool? to,
  bool? pe,
  bool? la,
  bool? su,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ValitutViikonPaivatStruct(
      (v) => v
        ..ma = ma
        ..ti = ti
        ..ke = ke
        ..to = to
        ..pe = pe
        ..la = la
        ..su = su
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ValitutViikonPaivatStruct? updateValitutViikonPaivatStruct(
  ValitutViikonPaivatStruct? valitutViikonPaivat, {
  bool clearUnsetFields = true,
}) =>
    valitutViikonPaivat != null
        ? (valitutViikonPaivat.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addValitutViikonPaivatStructData(
  Map<String, dynamic> firestoreData,
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (valitutViikonPaivat == null) {
    return;
  }
  if (valitutViikonPaivat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue &&
      valitutViikonPaivat.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final valitutViikonPaivatData =
      getValitutViikonPaivatFirestoreData(valitutViikonPaivat, forFieldValue);
  final nestedData =
      valitutViikonPaivatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = valitutViikonPaivat.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getValitutViikonPaivatFirestoreData(
  ValitutViikonPaivatStruct? valitutViikonPaivat, [
  bool forFieldValue = false,
]) {
  if (valitutViikonPaivat == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      ValitutViikonPaivatStruct.serializer, valitutViikonPaivat);

  // Add any Firestore field values
  valitutViikonPaivat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getValitutViikonPaivatListFirestoreData(
  List<ValitutViikonPaivatStruct>? valitutViikonPaivats,
) =>
    valitutViikonPaivats
        ?.map((v) => getValitutViikonPaivatFirestoreData(v, true))
        .toList() ??
    [];
