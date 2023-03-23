// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'selectedRutiiniToWorkout',
      serializers.serialize(object.selectedRutiiniToWorkout,
          specifiedType: const FullType(TreeniRutiiniStruct)),
    ];
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
    value = object.treeniRutiinit;
    if (value != null) {
      result
        ..add('treeniRutiinit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TreeniRutiiniStruct)])));
    }
    value = object.maRutiinit;
    if (value != null) {
      result
        ..add('maRutiinit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.tiRutiinit;
    if (value != null) {
      result
        ..add('tiRutiinit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.keRutiinit;
    if (value != null) {
      result
        ..add('keRutiinit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.toRutiinit;
    if (value != null) {
      result
        ..add('toRutiinit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.peRutiinit;
    if (value != null) {
      result
        ..add('peRutiinit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.laRutiinit;
    if (value != null) {
      result
        ..add('laRutiinit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.suRutiinit;
    if (value != null) {
      result
        ..add('suRutiinit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.refSessioToEdit;
    if (value != null) {
      result
        ..add('refSessioToEdit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isWeightUnitKg;
    if (value != null) {
      result
        ..add('isWeightUnitKg')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

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
        case 'appLangCode':
          result.appLangCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'darkMode':
          result.darkMode = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'treeniRutiinit':
          result.treeniRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TreeniRutiiniStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'maRutiinit':
          result.maRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'tiRutiinit':
          result.tiRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'keRutiinit':
          result.keRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'toRutiinit':
          result.toRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'peRutiinit':
          result.peRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'laRutiinit':
          result.laRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'suRutiinit':
          result.suRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'refSessioToEdit':
          result.refSessioToEdit = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'selectedRutiiniToWorkout':
          result.selectedRutiiniToWorkout.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TreeniRutiiniStruct))!
              as TreeniRutiiniStruct);
          break;
        case 'isWeightUnitKg':
          result.isWeightUnitKg = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$UsersRecord extends UsersRecord {
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
  final String? appLangCode;
  @override
  final bool? darkMode;
  @override
  final BuiltList<TreeniRutiiniStruct>? treeniRutiinit;
  @override
  final BuiltList<DateTime>? maRutiinit;
  @override
  final BuiltList<DateTime>? tiRutiinit;
  @override
  final BuiltList<DateTime>? keRutiinit;
  @override
  final BuiltList<DateTime>? toRutiinit;
  @override
  final BuiltList<DateTime>? peRutiinit;
  @override
  final BuiltList<DateTime>? laRutiinit;
  @override
  final BuiltList<DateTime>? suRutiinit;
  @override
  final DocumentReference<Object?>? refSessioToEdit;
  @override
  final TreeniRutiiniStruct selectedRutiiniToWorkout;
  @override
  final bool? isWeightUnitKg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.appLangCode,
      this.darkMode,
      this.treeniRutiinit,
      this.maRutiinit,
      this.tiRutiinit,
      this.keRutiinit,
      this.toRutiinit,
      this.peRutiinit,
      this.laRutiinit,
      this.suRutiinit,
      this.refSessioToEdit,
      required this.selectedRutiiniToWorkout,
      this.isWeightUnitKg,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        selectedRutiiniToWorkout, r'UsersRecord', 'selectedRutiiniToWorkout');
  }

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        appLangCode == other.appLangCode &&
        darkMode == other.darkMode &&
        treeniRutiinit == other.treeniRutiinit &&
        maRutiinit == other.maRutiinit &&
        tiRutiinit == other.tiRutiinit &&
        keRutiinit == other.keRutiinit &&
        toRutiinit == other.toRutiinit &&
        peRutiinit == other.peRutiinit &&
        laRutiinit == other.laRutiinit &&
        suRutiinit == other.suRutiinit &&
        refSessioToEdit == other.refSessioToEdit &&
        selectedRutiiniToWorkout == other.selectedRutiiniToWorkout &&
        isWeightUnitKg == other.isWeightUnitKg &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, appLangCode.hashCode);
    _$hash = $jc(_$hash, darkMode.hashCode);
    _$hash = $jc(_$hash, treeniRutiinit.hashCode);
    _$hash = $jc(_$hash, maRutiinit.hashCode);
    _$hash = $jc(_$hash, tiRutiinit.hashCode);
    _$hash = $jc(_$hash, keRutiinit.hashCode);
    _$hash = $jc(_$hash, toRutiinit.hashCode);
    _$hash = $jc(_$hash, peRutiinit.hashCode);
    _$hash = $jc(_$hash, laRutiinit.hashCode);
    _$hash = $jc(_$hash, suRutiinit.hashCode);
    _$hash = $jc(_$hash, refSessioToEdit.hashCode);
    _$hash = $jc(_$hash, selectedRutiiniToWorkout.hashCode);
    _$hash = $jc(_$hash, isWeightUnitKg.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('appLangCode', appLangCode)
          ..add('darkMode', darkMode)
          ..add('treeniRutiinit', treeniRutiinit)
          ..add('maRutiinit', maRutiinit)
          ..add('tiRutiinit', tiRutiinit)
          ..add('keRutiinit', keRutiinit)
          ..add('toRutiinit', toRutiinit)
          ..add('peRutiinit', peRutiinit)
          ..add('laRutiinit', laRutiinit)
          ..add('suRutiinit', suRutiinit)
          ..add('refSessioToEdit', refSessioToEdit)
          ..add('selectedRutiiniToWorkout', selectedRutiiniToWorkout)
          ..add('isWeightUnitKg', isWeightUnitKg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

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

  String? _appLangCode;
  String? get appLangCode => _$this._appLangCode;
  set appLangCode(String? appLangCode) => _$this._appLangCode = appLangCode;

  bool? _darkMode;
  bool? get darkMode => _$this._darkMode;
  set darkMode(bool? darkMode) => _$this._darkMode = darkMode;

  ListBuilder<TreeniRutiiniStruct>? _treeniRutiinit;
  ListBuilder<TreeniRutiiniStruct> get treeniRutiinit =>
      _$this._treeniRutiinit ??= new ListBuilder<TreeniRutiiniStruct>();
  set treeniRutiinit(ListBuilder<TreeniRutiiniStruct>? treeniRutiinit) =>
      _$this._treeniRutiinit = treeniRutiinit;

  ListBuilder<DateTime>? _maRutiinit;
  ListBuilder<DateTime> get maRutiinit =>
      _$this._maRutiinit ??= new ListBuilder<DateTime>();
  set maRutiinit(ListBuilder<DateTime>? maRutiinit) =>
      _$this._maRutiinit = maRutiinit;

  ListBuilder<DateTime>? _tiRutiinit;
  ListBuilder<DateTime> get tiRutiinit =>
      _$this._tiRutiinit ??= new ListBuilder<DateTime>();
  set tiRutiinit(ListBuilder<DateTime>? tiRutiinit) =>
      _$this._tiRutiinit = tiRutiinit;

  ListBuilder<DateTime>? _keRutiinit;
  ListBuilder<DateTime> get keRutiinit =>
      _$this._keRutiinit ??= new ListBuilder<DateTime>();
  set keRutiinit(ListBuilder<DateTime>? keRutiinit) =>
      _$this._keRutiinit = keRutiinit;

  ListBuilder<DateTime>? _toRutiinit;
  ListBuilder<DateTime> get toRutiinit =>
      _$this._toRutiinit ??= new ListBuilder<DateTime>();
  set toRutiinit(ListBuilder<DateTime>? toRutiinit) =>
      _$this._toRutiinit = toRutiinit;

  ListBuilder<DateTime>? _peRutiinit;
  ListBuilder<DateTime> get peRutiinit =>
      _$this._peRutiinit ??= new ListBuilder<DateTime>();
  set peRutiinit(ListBuilder<DateTime>? peRutiinit) =>
      _$this._peRutiinit = peRutiinit;

  ListBuilder<DateTime>? _laRutiinit;
  ListBuilder<DateTime> get laRutiinit =>
      _$this._laRutiinit ??= new ListBuilder<DateTime>();
  set laRutiinit(ListBuilder<DateTime>? laRutiinit) =>
      _$this._laRutiinit = laRutiinit;

  ListBuilder<DateTime>? _suRutiinit;
  ListBuilder<DateTime> get suRutiinit =>
      _$this._suRutiinit ??= new ListBuilder<DateTime>();
  set suRutiinit(ListBuilder<DateTime>? suRutiinit) =>
      _$this._suRutiinit = suRutiinit;

  DocumentReference<Object?>? _refSessioToEdit;
  DocumentReference<Object?>? get refSessioToEdit => _$this._refSessioToEdit;
  set refSessioToEdit(DocumentReference<Object?>? refSessioToEdit) =>
      _$this._refSessioToEdit = refSessioToEdit;

  TreeniRutiiniStructBuilder? _selectedRutiiniToWorkout;
  TreeniRutiiniStructBuilder get selectedRutiiniToWorkout =>
      _$this._selectedRutiiniToWorkout ??= new TreeniRutiiniStructBuilder();
  set selectedRutiiniToWorkout(
          TreeniRutiiniStructBuilder? selectedRutiiniToWorkout) =>
      _$this._selectedRutiiniToWorkout = selectedRutiiniToWorkout;

  bool? _isWeightUnitKg;
  bool? get isWeightUnitKg => _$this._isWeightUnitKg;
  set isWeightUnitKg(bool? isWeightUnitKg) =>
      _$this._isWeightUnitKg = isWeightUnitKg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _appLangCode = $v.appLangCode;
      _darkMode = $v.darkMode;
      _treeniRutiinit = $v.treeniRutiinit?.toBuilder();
      _maRutiinit = $v.maRutiinit?.toBuilder();
      _tiRutiinit = $v.tiRutiinit?.toBuilder();
      _keRutiinit = $v.keRutiinit?.toBuilder();
      _toRutiinit = $v.toRutiinit?.toBuilder();
      _peRutiinit = $v.peRutiinit?.toBuilder();
      _laRutiinit = $v.laRutiinit?.toBuilder();
      _suRutiinit = $v.suRutiinit?.toBuilder();
      _refSessioToEdit = $v.refSessioToEdit;
      _selectedRutiiniToWorkout = $v.selectedRutiiniToWorkout.toBuilder();
      _isWeightUnitKg = $v.isWeightUnitKg;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              appLangCode: appLangCode,
              darkMode: darkMode,
              treeniRutiinit: _treeniRutiinit?.build(),
              maRutiinit: _maRutiinit?.build(),
              tiRutiinit: _tiRutiinit?.build(),
              keRutiinit: _keRutiinit?.build(),
              toRutiinit: _toRutiinit?.build(),
              peRutiinit: _peRutiinit?.build(),
              laRutiinit: _laRutiinit?.build(),
              suRutiinit: _suRutiinit?.build(),
              refSessioToEdit: refSessioToEdit,
              selectedRutiiniToWorkout: selectedRutiiniToWorkout.build(),
              isWeightUnitKg: isWeightUnitKg,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'treeniRutiinit';
        _treeniRutiinit?.build();
        _$failedField = 'maRutiinit';
        _maRutiinit?.build();
        _$failedField = 'tiRutiinit';
        _tiRutiinit?.build();
        _$failedField = 'keRutiinit';
        _keRutiinit?.build();
        _$failedField = 'toRutiinit';
        _toRutiinit?.build();
        _$failedField = 'peRutiinit';
        _peRutiinit?.build();
        _$failedField = 'laRutiinit';
        _laRutiinit?.build();
        _$failedField = 'suRutiinit';
        _suRutiinit?.build();

        _$failedField = 'selectedRutiiniToWorkout';
        selectedRutiiniToWorkout.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
