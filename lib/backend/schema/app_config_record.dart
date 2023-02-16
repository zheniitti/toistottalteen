import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_config_record.g.dart';

abstract class AppConfigRecord
    implements Built<AppConfigRecord, AppConfigRecordBuilder> {
  static Serializer<AppConfigRecord> get serializer =>
      _$appConfigRecordSerializer;

  bool? get androidShowBannerAds;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppConfigRecordBuilder builder) =>
      builder..androidShowBannerAds = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appConfig');

  static Stream<AppConfigRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppConfigRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppConfigRecord._();
  factory AppConfigRecord([void Function(AppConfigRecordBuilder) updates]) =
      _$AppConfigRecord;

  static AppConfigRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppConfigRecordData({
  bool? androidShowBannerAds,
}) {
  final firestoreData = serializers.toFirestore(
    AppConfigRecord.serializer,
    AppConfigRecord(
      (a) => a..androidShowBannerAds = androidShowBannerAds,
    ),
  );

  return firestoreData;
}
