import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'treeni_rutiini_struct.g.dart';

abstract class TreeniRutiiniStruct
    implements Built<TreeniRutiiniStruct, TreeniRutiiniStructBuilder> {
  static Serializer<TreeniRutiiniStruct> get serializer =>
      _$treeniRutiiniStructSerializer;

  DateTime? get createdTime;

  String? get nimi;

  BuiltList<LiikeStruct> get liikkeet;

  String? get kommentti;

  ValitutViikonPaivatStruct get valitutViikonPaivat;

  bool? get widgetExpanded;

  DateTime? get lastWorkoutTime;

  bool? get isTreeniPohja;

  bool? get finishedEditing;

  BuiltList<DateTime>? get modifiedTimes;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(TreeniRutiiniStructBuilder builder) => builder
    ..nimi = ''
    ..liikkeet = ListBuilder()
    ..kommentti = ''
    ..valitutViikonPaivat = ValitutViikonPaivatStructBuilder()
    ..widgetExpanded = false
    ..isTreeniPohja = false
    ..finishedEditing = false
    ..modifiedTimes = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  TreeniRutiiniStruct._();
  factory TreeniRutiiniStruct(
          [void Function(TreeniRutiiniStructBuilder) updates]) =
      _$TreeniRutiiniStruct;
}

TreeniRutiiniStruct createTreeniRutiiniStruct({
  DateTime? createdTime,
  String? nimi,
  String? kommentti,
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  bool? widgetExpanded,
  DateTime? lastWorkoutTime,
  bool? isTreeniPohja,
  bool? finishedEditing,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TreeniRutiiniStruct(
      (t) => t
        ..createdTime = createdTime
        ..nimi = nimi
        ..liikkeet = null
        ..kommentti = kommentti
        ..valitutViikonPaivat = valitutViikonPaivat?.toBuilder() ??
            ValitutViikonPaivatStructBuilder()
        ..widgetExpanded = widgetExpanded
        ..lastWorkoutTime = lastWorkoutTime
        ..isTreeniPohja = isTreeniPohja
        ..finishedEditing = finishedEditing
        ..modifiedTimes = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

TreeniRutiiniStruct? updateTreeniRutiiniStruct(
  TreeniRutiiniStruct? treeniRutiini, {
  bool clearUnsetFields = true,
}) =>
    treeniRutiini != null
        ? (treeniRutiini.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addTreeniRutiiniStructData(
  Map<String, dynamic> firestoreData,
  TreeniRutiiniStruct? treeniRutiini,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (treeniRutiini == null) {
    return;
  }
  if (treeniRutiini.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && treeniRutiini.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final treeniRutiiniData =
      getTreeniRutiiniFirestoreData(treeniRutiini, forFieldValue);
  final nestedData =
      treeniRutiiniData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = treeniRutiini.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getTreeniRutiiniFirestoreData(
  TreeniRutiiniStruct? treeniRutiini, [
  bool forFieldValue = false,
]) {
  if (treeniRutiini == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(TreeniRutiiniStruct.serializer, treeniRutiini);

  // Handle nested data for "valitutViikonPaivat" field.
  addValitutViikonPaivatStructData(firestoreData,
      treeniRutiini.valitutViikonPaivat, 'valitutViikonPaivat', forFieldValue);

  // Add any Firestore field values
  treeniRutiini.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTreeniRutiiniListFirestoreData(
  List<TreeniRutiiniStruct>? treeniRutiinis,
) =>
    treeniRutiinis
        ?.map((t) => getTreeniRutiiniFirestoreData(t, true))
        .toList() ??
    [];
