import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'treeni_sessiot_record.g.dart';

abstract class TreeniSessiotRecord
    implements Built<TreeniSessiotRecord, TreeniSessiotRecordBuilder> {
  static Serializer<TreeniSessiotRecord> get serializer =>
      _$treeniSessiotRecordSerializer;

  DocumentReference? get userRef;

  DateTime? get alku;

  DateTime? get loppu;

  String? get kommentti;

  TreeniRutiiniStruct get treeniRutiiniData;

  DateTime? get docCreatedTime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TreeniSessiotRecordBuilder builder) => builder
    ..kommentti = ''
    ..treeniRutiiniData = TreeniRutiiniStructBuilder();

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
  DocumentReference? userRef,
  DateTime? alku,
  DateTime? loppu,
  String? kommentti,
  TreeniRutiiniStruct? treeniRutiiniData,
  DateTime? docCreatedTime,
}) {
  final firestoreData = serializers.toFirestore(
    TreeniSessiotRecord.serializer,
    TreeniSessiotRecord(
      (t) => t
        ..userRef = userRef
        ..alku = alku
        ..loppu = loppu
        ..kommentti = kommentti
        ..treeniRutiiniData = TreeniRutiiniStructBuilder()
        ..docCreatedTime = docCreatedTime,
    ),
  );

  // Handle nested data for "treeniRutiiniData" field.
  addTreeniRutiiniStructData(
      firestoreData, treeniRutiiniData, 'treeniRutiiniData');

  return firestoreData;
}
