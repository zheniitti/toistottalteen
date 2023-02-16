// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppDataRecord> _$appDataRecordSerializer =
    new _$AppDataRecordSerializer();

class _$AppDataRecordSerializer implements StructuredSerializer<AppDataRecord> {
  @override
  final Iterable<Type> types = const [AppDataRecord, _$AppDataRecord];
  @override
  final String wireName = 'AppDataRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.editedTime;
    if (value != null) {
      result
        ..add('edited_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appLangCode;
    if (value != null) {
      result
        ..add('appLangCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.darkMode;
    if (value != null) {
      result
        ..add('darkMode')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.weightUnit;
    if (value != null) {
      result
        ..add('weightUnit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.treeniliikeNimet;
    if (value != null) {
      result
        ..add('treeniliikeNimet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.treeniRutiinit;
    if (value != null) {
      result
        ..add('treeniRutiinit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TreeniRutiiniStruct)])));
    }
    value = object.treeniSessiot;
    if (value != null) {
      result
        ..add('treeniSessiot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TreeniSessioStruct)])));
    }
    value = object.latestTrainingSessionTime;
    if (value != null) {
      result
        ..add('latestTrainingSessionTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.docCreatedTime;
    if (value != null) {
      result
        ..add('docCreatedTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AppDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'edited_time':
          result.editedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'appLangCode':
          result.appLangCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'darkMode':
          result.darkMode = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'weightUnit':
          result.weightUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'treeniliikeNimet':
          result.treeniliikeNimet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'treeniRutiinit':
          result.treeniRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TreeniRutiiniStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'treeniSessiot':
          result.treeniSessiot.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TreeniSessioStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'latestTrainingSessionTime':
          result.latestTrainingSessionTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'docCreatedTime':
          result.docCreatedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppDataRecord extends AppDataRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final DateTime? editedTime;
  @override
  final String? bio;
  @override
  final String? userName;
  @override
  final String? appLangCode;
  @override
  final bool? darkMode;
  @override
  final String? weightUnit;
  @override
  final BuiltList<String>? treeniliikeNimet;
  @override
  final BuiltList<TreeniRutiiniStruct>? treeniRutiinit;
  @override
  final BuiltList<TreeniSessioStruct>? treeniSessiot;
  @override
  final DateTime? latestTrainingSessionTime;
  @override
  final DateTime? docCreatedTime;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppDataRecord([void Function(AppDataRecordBuilder)? updates]) =>
      (new AppDataRecordBuilder()..update(updates))._build();

  _$AppDataRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.editedTime,
      this.bio,
      this.userName,
      this.appLangCode,
      this.darkMode,
      this.weightUnit,
      this.treeniliikeNimet,
      this.treeniRutiinit,
      this.treeniSessiot,
      this.latestTrainingSessionTime,
      this.docCreatedTime,
      this.userRef,
      this.ffRef})
      : super._();

  @override
  AppDataRecord rebuild(void Function(AppDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppDataRecordBuilder toBuilder() => new AppDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppDataRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        editedTime == other.editedTime &&
        bio == other.bio &&
        userName == other.userName &&
        appLangCode == other.appLangCode &&
        darkMode == other.darkMode &&
        weightUnit == other.weightUnit &&
        treeniliikeNimet == other.treeniliikeNimet &&
        treeniRutiinit == other.treeniRutiinit &&
        treeniSessiot == other.treeniSessiot &&
        latestTrainingSessionTime == other.latestTrainingSessionTime &&
        docCreatedTime == other.docCreatedTime &&
        userRef == other.userRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                email
                                                                                    .hashCode),
                                                                            displayName
                                                                                .hashCode),
                                                                        photoUrl
                                                                            .hashCode),
                                                                    uid
                                                                        .hashCode),
                                                                createdTime
                                                                    .hashCode),
                                                            phoneNumber
                                                                .hashCode),
                                                        editedTime.hashCode),
                                                    bio.hashCode),
                                                userName.hashCode),
                                            appLangCode.hashCode),
                                        darkMode.hashCode),
                                    weightUnit.hashCode),
                                treeniliikeNimet.hashCode),
                            treeniRutiinit.hashCode),
                        treeniSessiot.hashCode),
                    latestTrainingSessionTime.hashCode),
                docCreatedTime.hashCode),
            userRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppDataRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('editedTime', editedTime)
          ..add('bio', bio)
          ..add('userName', userName)
          ..add('appLangCode', appLangCode)
          ..add('darkMode', darkMode)
          ..add('weightUnit', weightUnit)
          ..add('treeniliikeNimet', treeniliikeNimet)
          ..add('treeniRutiinit', treeniRutiinit)
          ..add('treeniSessiot', treeniSessiot)
          ..add('latestTrainingSessionTime', latestTrainingSessionTime)
          ..add('docCreatedTime', docCreatedTime)
          ..add('userRef', userRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppDataRecordBuilder
    implements Builder<AppDataRecord, AppDataRecordBuilder> {
  _$AppDataRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime? _editedTime;
  DateTime? get editedTime => _$this._editedTime;
  set editedTime(DateTime? editedTime) => _$this._editedTime = editedTime;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _appLangCode;
  String? get appLangCode => _$this._appLangCode;
  set appLangCode(String? appLangCode) => _$this._appLangCode = appLangCode;

  bool? _darkMode;
  bool? get darkMode => _$this._darkMode;
  set darkMode(bool? darkMode) => _$this._darkMode = darkMode;

  String? _weightUnit;
  String? get weightUnit => _$this._weightUnit;
  set weightUnit(String? weightUnit) => _$this._weightUnit = weightUnit;

  ListBuilder<String>? _treeniliikeNimet;
  ListBuilder<String> get treeniliikeNimet =>
      _$this._treeniliikeNimet ??= new ListBuilder<String>();
  set treeniliikeNimet(ListBuilder<String>? treeniliikeNimet) =>
      _$this._treeniliikeNimet = treeniliikeNimet;

  ListBuilder<TreeniRutiiniStruct>? _treeniRutiinit;
  ListBuilder<TreeniRutiiniStruct> get treeniRutiinit =>
      _$this._treeniRutiinit ??= new ListBuilder<TreeniRutiiniStruct>();
  set treeniRutiinit(ListBuilder<TreeniRutiiniStruct>? treeniRutiinit) =>
      _$this._treeniRutiinit = treeniRutiinit;

  ListBuilder<TreeniSessioStruct>? _treeniSessiot;
  ListBuilder<TreeniSessioStruct> get treeniSessiot =>
      _$this._treeniSessiot ??= new ListBuilder<TreeniSessioStruct>();
  set treeniSessiot(ListBuilder<TreeniSessioStruct>? treeniSessiot) =>
      _$this._treeniSessiot = treeniSessiot;

  DateTime? _latestTrainingSessionTime;
  DateTime? get latestTrainingSessionTime => _$this._latestTrainingSessionTime;
  set latestTrainingSessionTime(DateTime? latestTrainingSessionTime) =>
      _$this._latestTrainingSessionTime = latestTrainingSessionTime;

  DateTime? _docCreatedTime;
  DateTime? get docCreatedTime => _$this._docCreatedTime;
  set docCreatedTime(DateTime? docCreatedTime) =>
      _$this._docCreatedTime = docCreatedTime;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppDataRecordBuilder() {
    AppDataRecord._initializeBuilder(this);
  }

  AppDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _editedTime = $v.editedTime;
      _bio = $v.bio;
      _userName = $v.userName;
      _appLangCode = $v.appLangCode;
      _darkMode = $v.darkMode;
      _weightUnit = $v.weightUnit;
      _treeniliikeNimet = $v.treeniliikeNimet?.toBuilder();
      _treeniRutiinit = $v.treeniRutiinit?.toBuilder();
      _treeniSessiot = $v.treeniSessiot?.toBuilder();
      _latestTrainingSessionTime = $v.latestTrainingSessionTime;
      _docCreatedTime = $v.docCreatedTime;
      _userRef = $v.userRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppDataRecord;
  }

  @override
  void update(void Function(AppDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppDataRecord build() => _build();

  _$AppDataRecord _build() {
    _$AppDataRecord _$result;
    try {
      _$result = _$v ??
          new _$AppDataRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              editedTime: editedTime,
              bio: bio,
              userName: userName,
              appLangCode: appLangCode,
              darkMode: darkMode,
              weightUnit: weightUnit,
              treeniliikeNimet: _treeniliikeNimet?.build(),
              treeniRutiinit: _treeniRutiinit?.build(),
              treeniSessiot: _treeniSessiot?.build(),
              latestTrainingSessionTime: latestTrainingSessionTime,
              docCreatedTime: docCreatedTime,
              userRef: userRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'treeniliikeNimet';
        _treeniliikeNimet?.build();
        _$failedField = 'treeniRutiinit';
        _treeniRutiinit?.build();
        _$failedField = 'treeniSessiot';
        _treeniSessiot?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppDataRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
