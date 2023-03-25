// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treeni_rutiini_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TreeniRutiiniStruct> _$treeniRutiiniStructSerializer =
    new _$TreeniRutiiniStructSerializer();

class _$TreeniRutiiniStructSerializer
    implements StructuredSerializer<TreeniRutiiniStruct> {
  @override
  final Iterable<Type> types = const [
    TreeniRutiiniStruct,
    _$TreeniRutiiniStruct
  ];
  @override
  final String wireName = 'TreeniRutiiniStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TreeniRutiiniStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'liikkeet',
      serializers.serialize(object.liikkeet,
          specifiedType:
              const FullType(BuiltList, const [const FullType(LiikeStruct)])),
      'valitutViikonPaivat',
      serializers.serialize(object.valitutViikonPaivat,
          specifiedType: const FullType(ValitutViikonPaivatStruct)),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.createdTime;
    if (value != null) {
      result
        ..add('createdTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.nimi;
    if (value != null) {
      result
        ..add('nimi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kommentti;
    if (value != null) {
      result
        ..add('kommentti')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isTreeniPohja;
    if (value != null) {
      result
        ..add('isTreeniPohja')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.finishedEditing;
    if (value != null) {
      result
        ..add('finishedEditing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.lastWorkoutTime;
    if (value != null) {
      result
        ..add('lastWorkoutTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  TreeniRutiiniStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TreeniRutiiniStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdTime':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'nimi':
          result.nimi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kommentti':
          result.kommentti = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'liikkeet':
          result.liikkeet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LiikeStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'isTreeniPohja':
          result.isTreeniPohja = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'finishedEditing':
          result.finishedEditing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'lastWorkoutTime':
          result.lastWorkoutTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'valitutViikonPaivat':
          result.valitutViikonPaivat.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ValitutViikonPaivatStruct))!
              as ValitutViikonPaivatStruct);
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$TreeniRutiiniStruct extends TreeniRutiiniStruct {
  @override
  final DateTime? createdTime;
  @override
  final String? nimi;
  @override
  final String? kommentti;
  @override
  final BuiltList<LiikeStruct> liikkeet;
  @override
  final bool? isTreeniPohja;
  @override
  final bool? finishedEditing;
  @override
  final DateTime? lastWorkoutTime;
  @override
  final ValitutViikonPaivatStruct valitutViikonPaivat;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TreeniRutiiniStruct(
          [void Function(TreeniRutiiniStructBuilder)? updates]) =>
      (new TreeniRutiiniStructBuilder()..update(updates))._build();

  _$TreeniRutiiniStruct._(
      {this.createdTime,
      this.nimi,
      this.kommentti,
      required this.liikkeet,
      this.isTreeniPohja,
      this.finishedEditing,
      this.lastWorkoutTime,
      required this.valitutViikonPaivat,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        liikkeet, r'TreeniRutiiniStruct', 'liikkeet');
    BuiltValueNullFieldError.checkNotNull(
        valitutViikonPaivat, r'TreeniRutiiniStruct', 'valitutViikonPaivat');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'TreeniRutiiniStruct', 'firestoreUtilData');
  }

  @override
  TreeniRutiiniStruct rebuild(
          void Function(TreeniRutiiniStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TreeniRutiiniStructBuilder toBuilder() =>
      new TreeniRutiiniStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TreeniRutiiniStruct &&
        createdTime == other.createdTime &&
        nimi == other.nimi &&
        kommentti == other.kommentti &&
        liikkeet == other.liikkeet &&
        isTreeniPohja == other.isTreeniPohja &&
        finishedEditing == other.finishedEditing &&
        lastWorkoutTime == other.lastWorkoutTime &&
        valitutViikonPaivat == other.valitutViikonPaivat &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, nimi.hashCode);
    _$hash = $jc(_$hash, kommentti.hashCode);
    _$hash = $jc(_$hash, liikkeet.hashCode);
    _$hash = $jc(_$hash, isTreeniPohja.hashCode);
    _$hash = $jc(_$hash, finishedEditing.hashCode);
    _$hash = $jc(_$hash, lastWorkoutTime.hashCode);
    _$hash = $jc(_$hash, valitutViikonPaivat.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TreeniRutiiniStruct')
          ..add('createdTime', createdTime)
          ..add('nimi', nimi)
          ..add('kommentti', kommentti)
          ..add('liikkeet', liikkeet)
          ..add('isTreeniPohja', isTreeniPohja)
          ..add('finishedEditing', finishedEditing)
          ..add('lastWorkoutTime', lastWorkoutTime)
          ..add('valitutViikonPaivat', valitutViikonPaivat)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TreeniRutiiniStructBuilder
    implements Builder<TreeniRutiiniStruct, TreeniRutiiniStructBuilder> {
  _$TreeniRutiiniStruct? _$v;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _nimi;
  String? get nimi => _$this._nimi;
  set nimi(String? nimi) => _$this._nimi = nimi;

  String? _kommentti;
  String? get kommentti => _$this._kommentti;
  set kommentti(String? kommentti) => _$this._kommentti = kommentti;

  ListBuilder<LiikeStruct>? _liikkeet;
  ListBuilder<LiikeStruct> get liikkeet =>
      _$this._liikkeet ??= new ListBuilder<LiikeStruct>();
  set liikkeet(ListBuilder<LiikeStruct>? liikkeet) =>
      _$this._liikkeet = liikkeet;

  bool? _isTreeniPohja;
  bool? get isTreeniPohja => _$this._isTreeniPohja;
  set isTreeniPohja(bool? isTreeniPohja) =>
      _$this._isTreeniPohja = isTreeniPohja;

  bool? _finishedEditing;
  bool? get finishedEditing => _$this._finishedEditing;
  set finishedEditing(bool? finishedEditing) =>
      _$this._finishedEditing = finishedEditing;

  DateTime? _lastWorkoutTime;
  DateTime? get lastWorkoutTime => _$this._lastWorkoutTime;
  set lastWorkoutTime(DateTime? lastWorkoutTime) =>
      _$this._lastWorkoutTime = lastWorkoutTime;

  ValitutViikonPaivatStructBuilder? _valitutViikonPaivat;
  ValitutViikonPaivatStructBuilder get valitutViikonPaivat =>
      _$this._valitutViikonPaivat ??= new ValitutViikonPaivatStructBuilder();
  set valitutViikonPaivat(
          ValitutViikonPaivatStructBuilder? valitutViikonPaivat) =>
      _$this._valitutViikonPaivat = valitutViikonPaivat;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TreeniRutiiniStructBuilder() {
    TreeniRutiiniStruct._initializeBuilder(this);
  }

  TreeniRutiiniStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _nimi = $v.nimi;
      _kommentti = $v.kommentti;
      _liikkeet = $v.liikkeet.toBuilder();
      _isTreeniPohja = $v.isTreeniPohja;
      _finishedEditing = $v.finishedEditing;
      _lastWorkoutTime = $v.lastWorkoutTime;
      _valitutViikonPaivat = $v.valitutViikonPaivat.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TreeniRutiiniStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TreeniRutiiniStruct;
  }

  @override
  void update(void Function(TreeniRutiiniStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TreeniRutiiniStruct build() => _build();

  _$TreeniRutiiniStruct _build() {
    _$TreeniRutiiniStruct _$result;
    try {
      _$result = _$v ??
          new _$TreeniRutiiniStruct._(
              createdTime: createdTime,
              nimi: nimi,
              kommentti: kommentti,
              liikkeet: liikkeet.build(),
              isTreeniPohja: isTreeniPohja,
              finishedEditing: finishedEditing,
              lastWorkoutTime: lastWorkoutTime,
              valitutViikonPaivat: valitutViikonPaivat.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'TreeniRutiiniStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'liikkeet';
        liikkeet.build();

        _$failedField = 'valitutViikonPaivat';
        valitutViikonPaivat.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TreeniRutiiniStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
