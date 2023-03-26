import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

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

  String? get appLangCode;

  bool? get darkMode;

  BuiltList<TreeniRutiiniStruct>? get treeniRutiinit;

  BuiltList<DateTime>? get maRutiinit;

  BuiltList<DateTime>? get tiRutiinit;

  BuiltList<DateTime>? get keRutiinit;

  BuiltList<DateTime>? get toRutiinit;

  BuiltList<DateTime>? get peRutiinit;

  BuiltList<DateTime>? get laRutiinit;

  BuiltList<DateTime>? get suRutiinit;

  DocumentReference? get refSessioToEdit;

  TreeniRutiiniStruct get selectedRutiiniToWorkout;

  bool? get isWeightUnitKg;

  double? get treeniKestoYhteensaSekunteina;

  int? get treeniaYhteensa;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..appLangCode = ''
    ..darkMode = false
    ..treeniRutiinit = ListBuilder()
    ..maRutiinit = ListBuilder()
    ..tiRutiinit = ListBuilder()
    ..keRutiinit = ListBuilder()
    ..toRutiinit = ListBuilder()
    ..peRutiinit = ListBuilder()
    ..laRutiinit = ListBuilder()
    ..suRutiinit = ListBuilder()
    ..selectedRutiiniToWorkout = TreeniRutiiniStructBuilder()
    ..isWeightUnitKg = false
    ..treeniKestoYhteensaSekunteina = 0.0
    ..treeniaYhteensa = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? appLangCode,
  bool? darkMode,
  DocumentReference? refSessioToEdit,
  TreeniRutiiniStruct? selectedRutiiniToWorkout,
  bool? isWeightUnitKg,
  double? treeniKestoYhteensaSekunteina,
  int? treeniaYhteensa,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..appLangCode = appLangCode
        ..darkMode = darkMode
        ..treeniRutiinit = null
        ..maRutiinit = null
        ..tiRutiinit = null
        ..keRutiinit = null
        ..toRutiinit = null
        ..peRutiinit = null
        ..laRutiinit = null
        ..suRutiinit = null
        ..refSessioToEdit = refSessioToEdit
        ..selectedRutiiniToWorkout = TreeniRutiiniStructBuilder()
        ..isWeightUnitKg = isWeightUnitKg
        ..treeniKestoYhteensaSekunteina = treeniKestoYhteensaSekunteina
        ..treeniaYhteensa = treeniaYhteensa,
    ),
  );

  // Handle nested data for "selectedRutiiniToWorkout" field.
  addTreeniRutiiniStructData(
      firestoreData, selectedRutiiniToWorkout, 'selectedRutiiniToWorkout');

  return firestoreData;
}
