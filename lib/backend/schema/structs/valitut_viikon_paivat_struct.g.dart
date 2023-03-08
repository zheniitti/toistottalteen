// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valitut_viikon_paivat_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ValitutViikonPaivatStruct> _$valitutViikonPaivatStructSerializer =
    new _$ValitutViikonPaivatStructSerializer();

class _$ValitutViikonPaivatStructSerializer
    implements StructuredSerializer<ValitutViikonPaivatStruct> {
  @override
  final Iterable<Type> types = const [
    ValitutViikonPaivatStruct,
    _$ValitutViikonPaivatStruct
  ];
  @override
  final String wireName = 'ValitutViikonPaivatStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ValitutViikonPaivatStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.ma;
    if (value != null) {
      result
        ..add('ma')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ti;
    if (value != null) {
      result
        ..add('ti')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ke;
    if (value != null) {
      result
        ..add('ke')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.pe;
    if (value != null) {
      result
        ..add('pe')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.la;
    if (value != null) {
      result
        ..add('la')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.su;
    if (value != null) {
      result
        ..add('su')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ValitutViikonPaivatStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValitutViikonPaivatStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ma':
          result.ma = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ti':
          result.ti = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ke':
          result.ke = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'pe':
          result.pe = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'la':
          result.la = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'su':
          result.su = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$ValitutViikonPaivatStruct extends ValitutViikonPaivatStruct {
  @override
  final bool? ma;
  @override
  final bool? ti;
  @override
  final bool? ke;
  @override
  final bool? to;
  @override
  final bool? pe;
  @override
  final bool? la;
  @override
  final bool? su;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ValitutViikonPaivatStruct(
          [void Function(ValitutViikonPaivatStructBuilder)? updates]) =>
      (new ValitutViikonPaivatStructBuilder()..update(updates))._build();

  _$ValitutViikonPaivatStruct._(
      {this.ma,
      this.ti,
      this.ke,
      this.to,
      this.pe,
      this.la,
      this.su,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ValitutViikonPaivatStruct', 'firestoreUtilData');
  }

  @override
  ValitutViikonPaivatStruct rebuild(
          void Function(ValitutViikonPaivatStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValitutViikonPaivatStructBuilder toBuilder() =>
      new ValitutViikonPaivatStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValitutViikonPaivatStruct &&
        ma == other.ma &&
        ti == other.ti &&
        ke == other.ke &&
        to == other.to &&
        pe == other.pe &&
        la == other.la &&
        su == other.su &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc($jc(0, ma.hashCode), ti.hashCode), ke.hashCode),
                        to.hashCode),
                    pe.hashCode),
                la.hashCode),
            su.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValitutViikonPaivatStruct')
          ..add('ma', ma)
          ..add('ti', ti)
          ..add('ke', ke)
          ..add('to', to)
          ..add('pe', pe)
          ..add('la', la)
          ..add('su', su)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ValitutViikonPaivatStructBuilder
    implements
        Builder<ValitutViikonPaivatStruct, ValitutViikonPaivatStructBuilder> {
  _$ValitutViikonPaivatStruct? _$v;

  bool? _ma;
  bool? get ma => _$this._ma;
  set ma(bool? ma) => _$this._ma = ma;

  bool? _ti;
  bool? get ti => _$this._ti;
  set ti(bool? ti) => _$this._ti = ti;

  bool? _ke;
  bool? get ke => _$this._ke;
  set ke(bool? ke) => _$this._ke = ke;

  bool? _to;
  bool? get to => _$this._to;
  set to(bool? to) => _$this._to = to;

  bool? _pe;
  bool? get pe => _$this._pe;
  set pe(bool? pe) => _$this._pe = pe;

  bool? _la;
  bool? get la => _$this._la;
  set la(bool? la) => _$this._la = la;

  bool? _su;
  bool? get su => _$this._su;
  set su(bool? su) => _$this._su = su;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ValitutViikonPaivatStructBuilder() {
    ValitutViikonPaivatStruct._initializeBuilder(this);
  }

  ValitutViikonPaivatStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ma = $v.ma;
      _ti = $v.ti;
      _ke = $v.ke;
      _to = $v.to;
      _pe = $v.pe;
      _la = $v.la;
      _su = $v.su;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValitutViikonPaivatStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValitutViikonPaivatStruct;
  }

  @override
  void update(void Function(ValitutViikonPaivatStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValitutViikonPaivatStruct build() => _build();

  _$ValitutViikonPaivatStruct _build() {
    final _$result = _$v ??
        new _$ValitutViikonPaivatStruct._(
            ma: ma,
            ti: ti,
            ke: ke,
            to: to,
            pe: pe,
            la: la,
            su: su,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'ValitutViikonPaivatStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
