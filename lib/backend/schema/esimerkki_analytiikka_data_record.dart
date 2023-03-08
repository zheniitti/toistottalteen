import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'esimerkki_analytiikka_data_record.g.dart';

abstract class EsimerkkiAnalytiikkaDataRecord
    implements
        Built<EsimerkkiAnalytiikkaDataRecord,
            EsimerkkiAnalytiikkaDataRecordBuilder> {
  static Serializer<EsimerkkiAnalytiikkaDataRecord> get serializer =>
      _$esimerkkiAnalytiikkaDataRecordSerializer;

  String? get treeniliikeNimet;

  int? get toistot;

  int? get painot;

  @BuiltValueField(wireName: 'id_pvm')
  DateTime? get idPvm;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          EsimerkkiAnalytiikkaDataRecordBuilder builder) =>
      builder
        ..treeniliikeNimet = ''
        ..toistot = 0
        ..painot = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('esimerkkiAnalytiikkaData');

  static Stream<EsimerkkiAnalytiikkaDataRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EsimerkkiAnalytiikkaDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EsimerkkiAnalytiikkaDataRecord._();
  factory EsimerkkiAnalytiikkaDataRecord(
          [void Function(EsimerkkiAnalytiikkaDataRecordBuilder) updates]) =
      _$EsimerkkiAnalytiikkaDataRecord;

  static EsimerkkiAnalytiikkaDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEsimerkkiAnalytiikkaDataRecordData({
  String? treeniliikeNimet,
  int? toistot,
  int? painot,
  DateTime? idPvm,
}) {
  final firestoreData = serializers.toFirestore(
    EsimerkkiAnalytiikkaDataRecord.serializer,
    EsimerkkiAnalytiikkaDataRecord(
      (e) => e
        ..treeniliikeNimet = treeniliikeNimet
        ..toistot = toistot
        ..painot = painot
        ..idPvm = idPvm,
    ),
  );

  return firestoreData;
}
