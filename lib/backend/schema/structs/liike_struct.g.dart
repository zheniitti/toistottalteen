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
    value = object.liikeTyyppi;
    if (value != null) {
      result
        ..add('liikeTyyppi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.showComment;
    if (value != null) {
      result
        ..add('showComment')
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
        case 'liikeTyyppi':
          result.liikeTyyppi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'matkaMetri':
          result.matkaMetri = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tehty':
          result.tehty = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showComment':
          result.showComment = serializers.deserialize(value,
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
  final String? liikeTyyppi;
  @override
  final double? matkaMetri;
  @override
  final bool? tehty;
  @override
  final bool? showComment;
  @override
  final BuiltList<String>? photos;
  @override
  final double? kestoSekunteina;
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
      this.liikeTyyppi,
      this.matkaMetri,
      this.tehty,
      this.showComment,
      this.photos,
      this.kestoSekunteina,
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
        liikeTyyppi == other.liikeTyyppi &&
        matkaMetri == other.matkaMetri &&
        tehty == other.tehty &&
        showComment == other.showComment &&
        photos == other.photos &&
        kestoSekunteina == other.kestoSekunteina &&
        firestoreUtilData == other.firestoreUtilData;
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
                                                $jc($jc(0, nimi.hashCode),
                                                    kommentti.hashCode),
                                                toistoMaara.hashCode),
                                            sarjaMaara.hashCode),
                                        sarjat.hashCode),
                                    aloitusPainoKg.hashCode),
                                liikeTyyppi.hashCode),
                            matkaMetri.hashCode),
                        tehty.hashCode),
                    showComment.hashCode),
                photos.hashCode),
            kestoSekunteina.hashCode),
        firestoreUtilData.hashCode));
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
          ..add('liikeTyyppi', liikeTyyppi)
          ..add('matkaMetri', matkaMetri)
          ..add('tehty', tehty)
          ..add('showComment', showComment)
          ..add('photos', photos)
          ..add('kestoSekunteina', kestoSekunteina)
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

  String? _liikeTyyppi;
  String? get liikeTyyppi => _$this._liikeTyyppi;
  set liikeTyyppi(String? liikeTyyppi) => _$this._liikeTyyppi = liikeTyyppi;

  double? _matkaMetri;
  double? get matkaMetri => _$this._matkaMetri;
  set matkaMetri(double? matkaMetri) => _$this._matkaMetri = matkaMetri;

  bool? _tehty;
  bool? get tehty => _$this._tehty;
  set tehty(bool? tehty) => _$this._tehty = tehty;

  bool? _showComment;
  bool? get showComment => _$this._showComment;
  set showComment(bool? showComment) => _$this._showComment = showComment;

  ListBuilder<String>? _photos;
  ListBuilder<String> get photos =>
      _$this._photos ??= new ListBuilder<String>();
  set photos(ListBuilder<String>? photos) => _$this._photos = photos;

  double? _kestoSekunteina;
  double? get kestoSekunteina => _$this._kestoSekunteina;
  set kestoSekunteina(double? kestoSekunteina) =>
      _$this._kestoSekunteina = kestoSekunteina;

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
      _liikeTyyppi = $v.liikeTyyppi;
      _matkaMetri = $v.matkaMetri;
      _tehty = $v.tehty;
      _showComment = $v.showComment;
      _photos = $v.photos?.toBuilder();
      _kestoSekunteina = $v.kestoSekunteina;
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
              liikeTyyppi: liikeTyyppi,
              matkaMetri: matkaMetri,
              tehty: tehty,
              showComment: showComment,
              photos: _photos?.build(),
              kestoSekunteina: kestoSekunteina,
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
