import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'esimerkki_data_record.g.dart';

abstract class EsimerkkiDataRecord
    implements Built<EsimerkkiDataRecord, EsimerkkiDataRecordBuilder> {
  static Serializer<EsimerkkiDataRecord> get serializer =>
      _$esimerkkiDataRecordSerializer;

  BuiltList<TreeniRutiiniStruct>? get esimerkkiRutiinit;

  BuiltList<LiikeStruct>? get esimerkkiLiikkeet;

  BuiltList<TreeniSessioStruct>? get esimerkkiSessiot;

  String? get languageCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EsimerkkiDataRecordBuilder builder) => builder
    ..esimerkkiRutiinit = ListBuilder()
    ..esimerkkiLiikkeet = ListBuilder()
    ..esimerkkiSessiot = ListBuilder()
    ..languageCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('esimerkkiData');

  static Stream<EsimerkkiDataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EsimerkkiDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EsimerkkiDataRecord._();
  factory EsimerkkiDataRecord(
          [void Function(EsimerkkiDataRecordBuilder) updates]) =
      _$EsimerkkiDataRecord;

  static EsimerkkiDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEsimerkkiDataRecordData({
  String? languageCode,
}) {
  final firestoreData = serializers.toFirestore(
    EsimerkkiDataRecord.serializer,
    EsimerkkiDataRecord(
      (e) => e
        ..esimerkkiRutiinit = null
        ..esimerkkiLiikkeet = null
        ..esimerkkiSessiot = null
        ..languageCode = languageCode,
    ),
  );

  return firestoreData;
}
