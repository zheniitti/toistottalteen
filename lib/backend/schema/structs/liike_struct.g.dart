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
    value = object.liikeTyyppi;
    if (value != null) {
      result
        ..add('liikeTyyppi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.painoKg;
    if (value != null) {
      result
        ..add('painoKg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.kommentti;
    if (value != null) {
      result
        ..add('kommentti')
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
    value = object.kestoSekunnit;
    if (value != null) {
      result
        ..add('kestoSekunnit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.kestoMinuutit;
    if (value != null) {
      result
        ..add('kestoMinuutit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
        case 'toistoMaara':
          result.toistoMaara = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sarjaMaara':
          result.sarjaMaara = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'liikeTyyppi':
          result.liikeTyyppi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'painoKg':
          result.painoKg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'kommentti':
          result.kommentti = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'matkaMetri':
          result.matkaMetri = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'kestoSekunnit':
          result.kestoSekunnit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'kestoMinuutit':
          result.kestoMinuutit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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
  final int? toistoMaara;
  @override
  final int? sarjaMaara;
  @override
  final String? liikeTyyppi;
  @override
  final double? painoKg;
  @override
  final String? kommentti;
  @override
  final double? matkaMetri;
  @override
  final double? kestoSekunnit;
  @override
  final int? kestoMinuutit;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$LiikeStruct([void Function(LiikeStructBuilder)? updates]) =>
      (new LiikeStructBuilder()..update(updates))._build();

  _$LiikeStruct._(
      {this.nimi,
      this.toistoMaara,
      this.sarjaMaara,
      this.liikeTyyppi,
      this.painoKg,
      this.kommentti,
      this.matkaMetri,
      this.kestoSekunnit,
      this.kestoMinuutit,
      required this.firestoreUtilData})
      : super._() {
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
        toistoMaara == other.toistoMaara &&
        sarjaMaara == other.sarjaMaara &&
        liikeTyyppi == other.liikeTyyppi &&
        painoKg == other.painoKg &&
        kommentti == other.kommentti &&
        matkaMetri == other.matkaMetri &&
        kestoSekunnit == other.kestoSekunnit &&
        kestoMinuutit == other.kestoMinuutit &&
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
                                    $jc($jc(0, nimi.hashCode),
                                        toistoMaara.hashCode),
                                    sarjaMaara.hashCode),
                                liikeTyyppi.hashCode),
                            painoKg.hashCode),
                        kommentti.hashCode),
                    matkaMetri.hashCode),
                kestoSekunnit.hashCode),
            kestoMinuutit.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LiikeStruct')
          ..add('nimi', nimi)
          ..add('toistoMaara', toistoMaara)
          ..add('sarjaMaara', sarjaMaara)
          ..add('liikeTyyppi', liikeTyyppi)
          ..add('painoKg', painoKg)
          ..add('kommentti', kommentti)
          ..add('matkaMetri', matkaMetri)
          ..add('kestoSekunnit', kestoSekunnit)
          ..add('kestoMinuutit', kestoMinuutit)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class LiikeStructBuilder implements Builder<LiikeStruct, LiikeStructBuilder> {
  _$LiikeStruct? _$v;

  String? _nimi;
  String? get nimi => _$this._nimi;
  set nimi(String? nimi) => _$this._nimi = nimi;

  int? _toistoMaara;
  int? get toistoMaara => _$this._toistoMaara;
  set toistoMaara(int? toistoMaara) => _$this._toistoMaara = toistoMaara;

  int? _sarjaMaara;
  int? get sarjaMaara => _$this._sarjaMaara;
  set sarjaMaara(int? sarjaMaara) => _$this._sarjaMaara = sarjaMaara;

  String? _liikeTyyppi;
  String? get liikeTyyppi => _$this._liikeTyyppi;
  set liikeTyyppi(String? liikeTyyppi) => _$this._liikeTyyppi = liikeTyyppi;

  double? _painoKg;
  double? get painoKg => _$this._painoKg;
  set painoKg(double? painoKg) => _$this._painoKg = painoKg;

  String? _kommentti;
  String? get kommentti => _$this._kommentti;
  set kommentti(String? kommentti) => _$this._kommentti = kommentti;

  double? _matkaMetri;
  double? get matkaMetri => _$this._matkaMetri;
  set matkaMetri(double? matkaMetri) => _$this._matkaMetri = matkaMetri;

  double? _kestoSekunnit;
  double? get kestoSekunnit => _$this._kestoSekunnit;
  set kestoSekunnit(double? kestoSekunnit) =>
      _$this._kestoSekunnit = kestoSekunnit;

  int? _kestoMinuutit;
  int? get kestoMinuutit => _$this._kestoMinuutit;
  set kestoMinuutit(int? kestoMinuutit) =>
      _$this._kestoMinuutit = kestoMinuutit;

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
      _toistoMaara = $v.toistoMaara;
      _sarjaMaara = $v.sarjaMaara;
      _liikeTyyppi = $v.liikeTyyppi;
      _painoKg = $v.painoKg;
      _kommentti = $v.kommentti;
      _matkaMetri = $v.matkaMetri;
      _kestoSekunnit = $v.kestoSekunnit;
      _kestoMinuutit = $v.kestoMinuutit;
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
    final _$result = _$v ??
        new _$LiikeStruct._(
            nimi: nimi,
            toistoMaara: toistoMaara,
            sarjaMaara: sarjaMaara,
            liikeTyyppi: liikeTyyppi,
            painoKg: painoKg,
            kommentti: kommentti,
            matkaMetri: matkaMetri,
            kestoSekunnit: kestoSekunnit,
            kestoMinuutit: kestoMinuutit,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'LiikeStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
