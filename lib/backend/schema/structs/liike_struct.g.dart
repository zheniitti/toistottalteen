// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liike_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiikeStruct> _$liikeStructSerializer = new _$LiikeStructSerializer();

class _$LiikeStructSerializer implements StructuredSerializer<LiikeStruct> {
  @override
  final Iterable<Type> types = const [LiikeStruct, _$LiikeStruct];
  @override
  final String wireName = 'LiikeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, LiikeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'sarjat',
      serializers.serialize(object.sarjat,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SarjaStruct)])),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
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
    value = object.toistoMaara;
    if (value != null) {
      result
        ..add('toistoMaara')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sarjaMaara;
    if (value != null) {
      result
        ..add('sarjaMaara')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.aloitusPainoKg;
    if (value != null) {
      result
        ..add('aloitusPainoKg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.matkaMetri;
    if (value != null) {
      result
        ..add('matkaMetri')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tehty;
    if (value != null) {
      result
        ..add('tehty')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.photos;
    if (value != null) {
      result
        ..add('photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.kestoSekunteina;
    if (value != null) {
      result
        ..add('kestoSekunteina')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.isOtherExerciseType;
    if (value != null) {
      result
        ..add('isOtherExerciseType')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('createdTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedTime;
    if (value != null) {
      result
        ..add('modifiedTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  LiikeStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiikeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nimi':
          result.nimi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kommentti':
          result.kommentti = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toistoMaara':
          result.toistoMaara = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sarjaMaara':
          result.sarjaMaara = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sarjat':
          result.sarjat.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SarjaStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'aloitusPainoKg':
          result.aloitusPainoKg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'matkaMetri':
          result.matkaMetri = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tehty':
          result.tehty = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'photos':
          result.photos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'kestoSekunteina':
          result.kestoSekunteina = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'isOtherExerciseType':
          result.isOtherExerciseType = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'createdTime':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modifiedTime':
          result.modifiedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$LiikeStruct extends LiikeStruct {
  @override
  final String? nimi;
  @override
  final String? kommentti;
  @override
  final int? toistoMaara;
  @override
  final int? sarjaMaara;
  @override
  final BuiltList<SarjaStruct> sarjat;
  @override
  final double? aloitusPainoKg;
  @override
  final double? matkaMetri;
  @override
  final bool? tehty;
  @override
  final BuiltList<String>? photos;
  @override
  final double? kestoSekunteina;
  @override
  final bool? isOtherExerciseType;
  @override
  final DateTime? createdTime;
  @override
  final DateTime? modifiedTime;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$LiikeStruct([void Function(LiikeStructBuilder)? updates]) =>
      (new LiikeStructBuilder()..update(updates))._build();

  _$LiikeStruct._(
      {this.nimi,
      this.kommentti,
      this.toistoMaara,
      this.sarjaMaara,
      required this.sarjat,
      this.aloitusPainoKg,
      this.matkaMetri,
      this.tehty,
      this.photos,
      this.kestoSekunteina,
      this.isOtherExerciseType,
      this.createdTime,
      this.modifiedTime,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(sarjat, r'LiikeStruct', 'sarjat');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'LiikeStruct', 'firestoreUtilData');
  }

  @override
  LiikeStruct rebuild(void Function(LiikeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiikeStructBuilder toBuilder() => new LiikeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiikeStruct &&
        nimi == other.nimi &&
        kommentti == other.kommentti &&
        toistoMaara == other.toistoMaara &&
        sarjaMaara == other.sarjaMaara &&
        sarjat == other.sarjat &&
        aloitusPainoKg == other.aloitusPainoKg &&
        matkaMetri == other.matkaMetri &&
        tehty == other.tehty &&
        photos == other.photos &&
        kestoSekunteina == other.kestoSekunteina &&
        isOtherExerciseType == other.isOtherExerciseType &&
        createdTime == other.createdTime &&
        modifiedTime == other.modifiedTime &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nimi.hashCode);
    _$hash = $jc(_$hash, kommentti.hashCode);
    _$hash = $jc(_$hash, toistoMaara.hashCode);
    _$hash = $jc(_$hash, sarjaMaara.hashCode);
    _$hash = $jc(_$hash, sarjat.hashCode);
    _$hash = $jc(_$hash, aloitusPainoKg.hashCode);
    _$hash = $jc(_$hash, matkaMetri.hashCode);
    _$hash = $jc(_$hash, tehty.hashCode);
    _$hash = $jc(_$hash, photos.hashCode);
    _$hash = $jc(_$hash, kestoSekunteina.hashCode);
    _$hash = $jc(_$hash, isOtherExerciseType.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, modifiedTime.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LiikeStruct')
          ..add('nimi', nimi)
          ..add('kommentti', kommentti)
          ..add('toistoMaara', toistoMaara)
          ..add('sarjaMaara', sarjaMaara)
          ..add('sarjat', sarjat)
          ..add('aloitusPainoKg', aloitusPainoKg)
          ..add('matkaMetri', matkaMetri)
          ..add('tehty', tehty)
          ..add('photos', photos)
          ..add('kestoSekunteina', kestoSekunteina)
          ..add('isOtherExerciseType', isOtherExerciseType)
          ..add('createdTime', createdTime)
          ..add('modifiedTime', modifiedTime)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class LiikeStructBuilder implements Builder<LiikeStruct, LiikeStructBuilder> {
  _$LiikeStruct? _$v;

  String? _nimi;
  String? get nimi => _$this._nimi;
  set nimi(String? nimi) => _$this._nimi = nimi;

  String? _kommentti;
  String? get kommentti => _$this._kommentti;
  set kommentti(String? kommentti) => _$this._kommentti = kommentti;

  int? _toistoMaara;
  int? get toistoMaara => _$this._toistoMaara;
  set toistoMaara(int? toistoMaara) => _$this._toistoMaara = toistoMaara;

  int? _sarjaMaara;
  int? get sarjaMaara => _$this._sarjaMaara;
  set sarjaMaara(int? sarjaMaara) => _$this._sarjaMaara = sarjaMaara;

  ListBuilder<SarjaStruct>? _sarjat;
  ListBuilder<SarjaStruct> get sarjat =>
      _$this._sarjat ??= new ListBuilder<SarjaStruct>();
  set sarjat(ListBuilder<SarjaStruct>? sarjat) => _$this._sarjat = sarjat;

  double? _aloitusPainoKg;
  double? get aloitusPainoKg => _$this._aloitusPainoKg;
  set aloitusPainoKg(double? aloitusPainoKg) =>
      _$this._aloitusPainoKg = aloitusPainoKg;

  double? _matkaMetri;
  double? get matkaMetri => _$this._matkaMetri;
  set matkaMetri(double? matkaMetri) => _$this._matkaMetri = matkaMetri;

  bool? _tehty;
  bool? get tehty => _$this._tehty;
  set tehty(bool? tehty) => _$this._tehty = tehty;

  ListBuilder<String>? _photos;
  ListBuilder<String> get photos =>
      _$this._photos ??= new ListBuilder<String>();
  set photos(ListBuilder<String>? photos) => _$this._photos = photos;

  double? _kestoSekunteina;
  double? get kestoSekunteina => _$this._kestoSekunteina;
  set kestoSekunteina(double? kestoSekunteina) =>
      _$this._kestoSekunteina = kestoSekunteina;

  bool? _isOtherExerciseType;
  bool? get isOtherExerciseType => _$this._isOtherExerciseType;
  set isOtherExerciseType(bool? isOtherExerciseType) =>
      _$this._isOtherExerciseType = isOtherExerciseType;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _$this._modifiedTime;
  set modifiedTime(DateTime? modifiedTime) =>
      _$this._modifiedTime = modifiedTime;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  LiikeStructBuilder() {
    LiikeStruct._initializeBuilder(this);
  }

  LiikeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nimi = $v.nimi;
      _kommentti = $v.kommentti;
      _toistoMaara = $v.toistoMaara;
      _sarjaMaara = $v.sarjaMaara;
      _sarjat = $v.sarjat.toBuilder();
      _aloitusPainoKg = $v.aloitusPainoKg;
      _matkaMetri = $v.matkaMetri;
      _tehty = $v.tehty;
      _photos = $v.photos?.toBuilder();
      _kestoSekunteina = $v.kestoSekunteina;
      _isOtherExerciseType = $v.isOtherExerciseType;
      _createdTime = $v.createdTime;
      _modifiedTime = $v.modifiedTime;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiikeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LiikeStruct;
  }

  @override
  void update(void Function(LiikeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LiikeStruct build() => _build();

  _$LiikeStruct _build() {
    _$LiikeStruct _$result;
    try {
      _$result = _$v ??
          new _$LiikeStruct._(
              nimi: nimi,
              kommentti: kommentti,
              toistoMaara: toistoMaara,
              sarjaMaara: sarjaMaara,
              sarjat: sarjat.build(),
              aloitusPainoKg: aloitusPainoKg,
              matkaMetri: matkaMetri,
              tehty: tehty,
              photos: _photos?.build(),
              kestoSekunteina: kestoSekunteina,
              isOtherExerciseType: isOtherExerciseType,
              createdTime: createdTime,
              modifiedTime: modifiedTime,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'LiikeStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sarjat';
        sarjat.build();

        _$failedField = 'photos';
        _photos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LiikeStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
