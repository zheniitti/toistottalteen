import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'treeni_rutiini_struct.g.dart';

abstract class TreeniRutiiniStruct
    implements Built<TreeniRutiiniStruct, TreeniRutiiniStructBuilder> {
  static Serializer<TreeniRutiiniStruct> get serializer =>
      _$treeniRutiiniStructSerializer;

  BuiltList<LiikeStruct> get liikkeet;

  String? get kommentti;

  DateTime? get createdTime;

  String? get nimi;

  ValitutViikonPaivatStruct get valitutViikonPaivat;

  bool? get widgetExpanded;

  DateTime? get lastWorkoutTime;

  BuiltList<DateTime>? get modifiedTimes;

  bool? get isTreeniPohja;

  bool? get showComment;

  @BuiltValueField(wireName: 'UID')
  String? get uid;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(TreeniRutiiniStructBuilder builder) => builder
    ..liikkeet = ListBuilder()
    ..kommentti = ''
    ..nimi = ''
    ..valitutViikonPaivat = ValitutViikonPaivatStructBuilder()
    ..widgetExpanded = false
    ..modifiedTimes = ListBuilder()
    ..isTreeniPohja = false
    ..showComment = false
    ..uid = ''
    ..firestoreUtilData = FirestoreUtilData();

  TreeniRutiiniStruct._();
  factory TreeniRutiiniStruct(
          [void Function(TreeniRutiiniStructBuilder) updates]) =
      _$TreeniRutiiniStruct;
}

TreeniRutiiniStruct createTreeniRutiiniStruct({
  String? kommentti,
  DateTime? createdTime,
  String? nimi,
  ValitutViikonPaivatStruct? valitutViikonPaivat,
  bool? widgetExpanded,
  DateTime? lastWorkoutTime,
  bool? isTreeniPohja,
  bool? showComment,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TreeniRutiiniStruct(
      (t) => t
        ..liikkeet = null
        ..kommentti = kommentti
        ..createdTime = createdTime
        ..nimi = nimi
        ..valitutViikonPaivat = valitutViikonPaivat?.toBuilder() ??
            ValitutViikonPaivatStructBuilder()
        ..widgetExpanded = widgetExpanded
        ..lastWorkoutTime = lastWorkoutTime
        ..modifiedTimes = null
        ..isTreeniPohja = isTreeniPohja
        ..showComment = showComment
        ..uid = uid
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


/// Add TreeniRutiiniStruct data to Map<String, dynamic> object
void addTreeniRutiiniStructData(
  Map<String, dynamic> firestoreData,
  TreeniRutiiniStruct? treeniRutiini,
  String fieldName, [
  bool forFieldValue = false,
]) {
  // Remove any existing value for the given fieldName.
  firestoreData.remove(fieldName);

  // If treeniRutiini is null, do nothing.
  if (treeniRutiini == null) {
    return;
  }

  // If treeniRutiini has the delete flag set to true, add FieldValue.delete() to firestoreData and return.
  if (treeniRutiini.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }

  // If forFieldValue is false and treeniRutiini has the clearUnsetFields flag set to true, add an empty map to firestoreData for the given fieldName.
  if (!forFieldValue && treeniRutiini.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }

  // Get the Firestore data for treeniRutiini using the getTreeniRutiiniFirestoreData function.
  final treeniRutiiniData =
      getTreeniRutiiniFirestoreData(treeniRutiini, forFieldValue);

  // Create a Map of the nested data in treeniRutiiniData by prefixing each key with the fieldName.
  final nestedData =
      treeniRutiiniData.map((k, v) => MapEntry('$fieldName.$k', v));

  // If treeniRutiini has the create flag set to true, merge the nested data with any existing data in firestoreData using the mergeNestedFields function.
  // Otherwise, add the nested data directly to firestoreData.
  final create = treeniRutiini.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  // Return.
  return;
}


/// Convert TreeniRutiiniStruct to Map<String, dynamic>
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


/// Convert List<TreeniRutiiniStruct> to List<Map<String, dynamic>>
List<Map<String, dynamic>> getTreeniRutiiniListFirestoreData(
  List<TreeniRutiiniStruct>? treeniRutiinis,
) =>
    treeniRutiinis
        ?.map((t) => getTreeniRutiiniFirestoreData(t, true))
        .toList() ??
    [];
