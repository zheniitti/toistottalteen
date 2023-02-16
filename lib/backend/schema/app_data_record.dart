import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_data_record.g.dart';

abstract class AppDataRecord
    implements Built<AppDataRecord, AppDataRecordBuilder> {
  static Serializer<AppDataRecord> get serializer => _$appDataRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'edited_time')
  DateTime? get editedTime;

  String? get bio;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  String? get appLangCode;

  bool? get darkMode;

  String? get weightUnit;

  BuiltList<String>? get treeniliikeNimet;

  BuiltList<TreeniRutiiniStruct>? get treeniRutiinit;

  BuiltList<TreeniSessioStruct>? get treeniSessiot;

  DateTime? get latestTrainingSessionTime;

  DateTime? get docCreatedTime;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppDataRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..bio = ''
    ..userName = ''
    ..appLangCode = ''
    ..darkMode = false
    ..weightUnit = ''
    ..treeniliikeNimet = ListBuilder()
    ..treeniRutiinit = ListBuilder()
    ..treeniSessiot = ListBuilder();

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
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  String? appLangCode,
  bool? darkMode,
  String? weightUnit,
  DateTime? latestTrainingSessionTime,
  DateTime? docCreatedTime,
  DocumentReference? userRef,
}) {
  final firestoreData = serializers.toFirestore(
    AppDataRecord.serializer,
    AppDataRecord(
      (a) => a
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..editedTime = editedTime
        ..bio = bio
        ..userName = userName
        ..appLangCode = appLangCode
        ..darkMode = darkMode
        ..weightUnit = weightUnit
        ..treeniliikeNimet = null
        ..treeniRutiinit = null
        ..treeniSessiot = null
        ..latestTrainingSessionTime = latestTrainingSessionTime
        ..docCreatedTime = docCreatedTime
        ..userRef = userRef,
    ),
  );

  return firestoreData;
}
