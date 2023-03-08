import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'aikavali_struct.g.dart';

abstract class AikavaliStruct
    implements Built<AikavaliStruct, AikavaliStructBuilder> {
  static Serializer<AikavaliStruct> get serializer =>
      _$aikavaliStructSerializer;

  DateTime? get alku;

  DateTime? get loppu;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(AikavaliStructBuilder builder) =>
      builder..firestoreUtilData = FirestoreUtilData();

  AikavaliStruct._();
  factory AikavaliStruct([void Function(AikavaliStructBuilder) updates]) =
      _$AikavaliStruct;
}

AikavaliStruct createAikavaliStruct({
  DateTime? alku,
  DateTime? loppu,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AikavaliStruct(
      (a) => a
        ..alku = alku
        ..loppu = loppu
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

AikavaliStruct? updateAikavaliStruct(
  AikavaliStruct? aikavali, {
  bool clearUnsetFields = true,
}) =>
    aikavali != null
        ? (aikavali.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addAikavaliStructData(
  Map<String, dynamic> firestoreData,
  AikavaliStruct? aikavali,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aikavali == null) {
    return;
  }
  if (aikavali.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && aikavali.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aikavaliData = getAikavaliFirestoreData(aikavali, forFieldValue);
  final nestedData = aikavaliData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = aikavali.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getAikavaliFirestoreData(
  AikavaliStruct? aikavali, [
  bool forFieldValue = false,
]) {
  if (aikavali == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(AikavaliStruct.serializer, aikavali);

  // Add any Firestore field values
  aikavali.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAikavaliListFirestoreData(
  List<AikavaliStruct>? aikavalis,
) =>
    aikavalis?.map((a) => getAikavaliFirestoreData(a, true)).toList() ?? [];
