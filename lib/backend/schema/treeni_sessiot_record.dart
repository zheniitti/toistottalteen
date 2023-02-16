import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'treeni_sessiot_record.g.dart';

abstract class TreeniSessiotRecord
    implements Built<TreeniSessiotRecord, TreeniSessiotRecordBuilder> {
  static Serializer<TreeniSessiotRecord> get serializer =>
      _$treeniSessiotRecordSerializer;

  TreeniSessioStruct get treeniSessio;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TreeniSessiotRecordBuilder builder) =>
      builder..treeniSessio = TreeniSessioStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('treeniSessiot');

  static Stream<TreeniSessiotRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TreeniSessiotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TreeniSessiotRecord._();
  factory TreeniSessiotRecord(
          [void Function(TreeniSessiotRecordBuilder) updates]) =
      _$TreeniSessiotRecord;

  static TreeniSessiotRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTreeniSessiotRecordData({
  TreeniSessioStruct? treeniSessio,
  DocumentReference? userRef,
}) {
  final firestoreData = serializers.toFirestore(
    TreeniSessiotRecord.serializer,
    TreeniSessiotRecord(
      (t) => t
        ..treeniSessio = TreeniSessioStructBuilder()
        ..userRef = userRef,
    ),
  );

  // Handle nested data for "treeniSessio" field.
  addTreeniSessioStructData(firestoreData, treeniSessio, 'treeniSessio');

  return firestoreData;
}
