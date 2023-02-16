import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tilastot_ja_analytiikka_record.g.dart';

abstract class TilastotJaAnalytiikkaRecord
    implements
        Built<TilastotJaAnalytiikkaRecord, TilastotJaAnalytiikkaRecordBuilder> {
  static Serializer<TilastotJaAnalytiikkaRecord> get serializer =>
      _$tilastotJaAnalytiikkaRecordSerializer;

  BuiltList<String>? get kaikkiLiikkeet;

  BuiltList<String>? get kaikkiTreenirutiininNimet;

  int? get sovelluksenAvaukset;

  int? get tallennetutTreenisessiot;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TilastotJaAnalytiikkaRecordBuilder builder) =>
      builder
        ..kaikkiLiikkeet = ListBuilder()
        ..kaikkiTreenirutiininNimet = ListBuilder()
        ..sovelluksenAvaukset = 0
        ..tallennetutTreenisessiot = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tilastotJaAnalytiikka');

  static Stream<TilastotJaAnalytiikkaRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TilastotJaAnalytiikkaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TilastotJaAnalytiikkaRecord._();
  factory TilastotJaAnalytiikkaRecord(
          [void Function(TilastotJaAnalytiikkaRecordBuilder) updates]) =
      _$TilastotJaAnalytiikkaRecord;

  static TilastotJaAnalytiikkaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTilastotJaAnalytiikkaRecordData({
  int? sovelluksenAvaukset,
  int? tallennetutTreenisessiot,
}) {
  final firestoreData = serializers.toFirestore(
    TilastotJaAnalytiikkaRecord.serializer,
    TilastotJaAnalytiikkaRecord(
      (t) => t
        ..kaikkiLiikkeet = null
        ..kaikkiTreenirutiininNimet = null
        ..sovelluksenAvaukset = sovelluksenAvaukset
        ..tallennetutTreenisessiot = tallennetutTreenisessiot,
    ),
  );

  return firestoreData;
}
