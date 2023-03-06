import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_data_record.g.dart';

abstract class AppDataRecord
    implements Built<AppDataRecord, AppDataRecordBuilder> {
  static Serializer<AppDataRecord> get serializer => _$appDataRecordSerializer;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get appLangCode;

  bool? get darkMode;

  String? get weightUnit;

  BuiltList<String>? get treeniliikeNimet;

  BuiltList<TreeniRutiiniStruct>? get treeniRutiinit;

  DocumentReference? get userRef;

  String? get latestPlatform;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppDataRecordBuilder builder) => builder
    ..appLangCode = ''
    ..darkMode = false
    ..weightUnit = ''
    ..treeniliikeNimet = ListBuilder()
    ..treeniRutiinit = ListBuilder()
    ..latestPlatform = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appData');

  static Stream<AppDataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppDataRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppDataRecord._();
  factory AppDataRecord([void Function(AppDataRecordBuilder) updates]) =
      _$AppDataRecord;

  static AppDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppDataRecordData({
  DateTime? createdTime,
  String? appLangCode,
  bool? darkMode,
  String? weightUnit,
  DocumentReference? userRef,
  String? latestPlatform,
}) {
  final firestoreData = serializers.toFirestore(
    AppDataRecord.serializer,
    AppDataRecord(
      (a) => a
        ..createdTime = createdTime
        ..appLangCode = appLangCode
        ..darkMode = darkMode
        ..weightUnit = weightUnit
        ..treeniliikeNimet = null
        ..treeniRutiinit = null
        ..userRef = userRef
        ..latestPlatform = latestPlatform,
    ),
  );

  return firestoreData;
}
