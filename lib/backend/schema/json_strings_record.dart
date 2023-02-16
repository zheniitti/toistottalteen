import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'json_strings_record.g.dart';

abstract class JsonStringsRecord
    implements Built<JsonStringsRecord, JsonStringsRecordBuilder> {
  static Serializer<JsonStringsRecord> get serializer =>
      _$jsonStringsRecordSerializer;

  String? get jsonString;

  DateTime? get creationTime;

  DateTime? get modifiedTime;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(JsonStringsRecordBuilder builder) =>
      builder..jsonString = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jsonStrings');

  static Stream<JsonStringsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JsonStringsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JsonStringsRecord._();
  factory JsonStringsRecord([void Function(JsonStringsRecordBuilder) updates]) =
      _$JsonStringsRecord;

  static JsonStringsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJsonStringsRecordData({
  String? jsonString,
  DateTime? creationTime,
  DateTime? modifiedTime,
  DocumentReference? userRef,
}) {
  final firestoreData = serializers.toFirestore(
    JsonStringsRecord.serializer,
    JsonStringsRecord(
      (j) => j
        ..jsonString = jsonString
        ..creationTime = creationTime
        ..modifiedTime = modifiedTime
        ..userRef = userRef,
    ),
  );

  return firestoreData;
}
