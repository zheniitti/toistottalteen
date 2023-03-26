// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liike_tilasto_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiikeTilastoStruct> _$liikeTilastoStructSerializer =
    new _$LiikeTilastoStructSerializer();

class _$LiikeTilastoStructSerializer
    implements StructuredSerializer<LiikeTilastoStruct> {
  @override
  final Iterable<Type> types = const [LiikeTilastoStruct, _$LiikeTilastoStruct];
  @override
  final String wireName = 'LiikeTilastoStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LiikeTilastoStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.liikeNimi;
    if (value != null) {
      result
        ..add('liikeNimi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parasKerranMaksimiPainoKg;
    if (value != null) {
      result
        ..add('parasKerranMaksimiPainoKg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.parasToistoMaara;
    if (value != null) {
      result
        ..add('parasToistoMaara')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  LiikeTilastoStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiikeTilastoStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'liikeNimi':
          result.liikeNimi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'parasKerranMaksimiPainoKg':
          result.parasKerranMaksimiPainoKg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'parasToistoMaara':
          result.parasToistoMaara = serializers.deserialize(value,
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

class _$LiikeTilastoStruct extends LiikeTilastoStruct {
  @override
  final String? liikeNimi;
  @override
  final double? parasKerranMaksimiPainoKg;
  @override
  final int? parasToistoMaara;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$LiikeTilastoStruct(
          [void Function(LiikeTilastoStructBuilder)? updates]) =>
      (new LiikeTilastoStructBuilder()..update(updates))._build();

  _$LiikeTilastoStruct._(
      {this.liikeNimi,
      this.parasKerranMaksimiPainoKg,
      this.parasToistoMaara,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'LiikeTilastoStruct', 'firestoreUtilData');
  }

  @override
  LiikeTilastoStruct rebuild(
          void Function(LiikeTilastoStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiikeTilastoStructBuilder toBuilder() =>
      new LiikeTilastoStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiikeTilastoStruct &&
        liikeNimi == other.liikeNimi &&
        parasKerranMaksimiPainoKg == other.parasKerranMaksimiPainoKg &&
        parasToistoMaara == other.parasToistoMaara &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, liikeNimi.hashCode);
    _$hash = $jc(_$hash, parasKerranMaksimiPainoKg.hashCode);
    _$hash = $jc(_$hash, parasToistoMaara.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LiikeTilastoStruct')
          ..add('liikeNimi', liikeNimi)
          ..add('parasKerranMaksimiPainoKg', parasKerranMaksimiPainoKg)
          ..add('parasToistoMaara', parasToistoMaara)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class LiikeTilastoStructBuilder
    implements Builder<LiikeTilastoStruct, LiikeTilastoStructBuilder> {
  _$LiikeTilastoStruct? _$v;

  String? _liikeNimi;
  String? get liikeNimi => _$this._liikeNimi;
  set liikeNimi(String? liikeNimi) => _$this._liikeNimi = liikeNimi;

  double? _parasKerranMaksimiPainoKg;
  double? get parasKerranMaksimiPainoKg => _$this._parasKerranMaksimiPainoKg;
  set parasKerranMaksimiPainoKg(double? parasKerranMaksimiPainoKg) =>
      _$this._parasKerranMaksimiPainoKg = parasKerranMaksimiPainoKg;

  int? _parasToistoMaara;
  int? get parasToistoMaara => _$this._parasToistoMaara;
  set parasToistoMaara(int? parasToistoMaara) =>
      _$this._parasToistoMaara = parasToistoMaara;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  LiikeTilastoStructBuilder() {
    LiikeTilastoStruct._initializeBuilder(this);
  }

  LiikeTilastoStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _liikeNimi = $v.liikeNimi;
      _parasKerranMaksimiPainoKg = $v.parasKerranMaksimiPainoKg;
      _parasToistoMaara = $v.parasToistoMaara;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiikeTilastoStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LiikeTilastoStruct;
  }

  @override
  void update(void Function(LiikeTilastoStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LiikeTilastoStruct build() => _build();

  _$LiikeTilastoStruct _build() {
    final _$result = _$v ??
        new _$LiikeTilastoStruct._(
            liikeNimi: liikeNimi,
            parasKerranMaksimiPainoKg: parasKerranMaksimiPainoKg,
            parasToistoMaara: parasToistoMaara,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'LiikeTilastoStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
