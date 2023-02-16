import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'treeni_sessio_struct.g.dart';

abstract class TreeniSessioStruct
    implements Built<TreeniSessioStruct, TreeniSessioStructBuilder> {
  static Serializer<TreeniSessioStruct> get serializer =>
      _$treeniSessioStructSerializer;

  TreeniRutiiniStruct get treeniRutiini;

  DateTime? get alku;

  DateTime? get loppu;

  String? get kommentti;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(TreeniSessioStructBuilder builder) => builder
    ..treeniRutiini = TreeniRutiiniStructBuilder()
    ..kommentti = ''
    ..firestoreUtilData = FirestoreUtilData();

  TreeniSessioStruct._();
  factory TreeniSessioStruct(
          [void Function(TreeniSessioStructBuilder) updates]) =
      _$TreeniSessioStruct;
}

TreeniSessioStruct createTreeniSessioStruct({
  TreeniRutiiniStruct? treeniRutiini,
  DateTime? alku,
  DateTime? loppu,
  String? kommentti,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TreeniSessioStruct(
      (t) => t
        ..treeniRutiini =
            treeniRutiini?.toBuilder() ?? TreeniRutiiniStructBuilder()
        ..alku = alku
        ..loppu = loppu
        ..kommentti = kommentti
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

TreeniSessioStruct? updateTreeniSessioStruct(
  TreeniSessioStruct? treeniSessio, {
  bool clearUnsetFields = true,
}) =>
    treeniSessio != null
        ? (treeniSessio.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addTreeniSessioStructData(
  Map<String, dynamic> firestoreData,
  TreeniSessioStruct? treeniSessio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (treeniSessio == null) {
    return;
  }
  if (treeniSessio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && treeniSessio.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final treeniSessioData =
      getTreeniSessioFirestoreData(treeniSessio, forFieldValue);
  final nestedData =
      treeniSessioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = treeniSessio.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getTreeniSessioFirestoreData(
  TreeniSessioStruct? treeniSessio, [
  bool forFieldValue = false,
]) {
  if (treeniSessio == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(TreeniSessioStruct.serializer, treeniSessio);

  // Handle nested data for "treeniRutiini" field.
  addTreeniRutiiniStructData(firestoreData, treeniSessio.treeniRutiini,
      'treeniRutiini', forFieldValue);

  // Add any Firestore field values
  treeniSessio.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTreeniSessioListFirestoreData(
  List<TreeniSessioStruct>? treeniSessios,
) =>
    treeniSessios?.map((t) => getTreeniSessioFirestoreData(t, true)).toList() ??
    [];
