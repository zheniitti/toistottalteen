// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sarja_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SarjaStruct> _$sarjaStructSerializer = new _$SarjaStructSerializer();

class _$SarjaStructSerializer implements StructuredSerializer<SarjaStruct> {
  @override
  final Iterable<Type> types = const [SarjaStruct, _$SarjaStruct];
  @override
  final String wireName = 'SarjaStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, SarjaStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.toistoMaara;
    if (value != null) {
      result
        ..add('toistoMaara')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paino;
    if (value != null) {
      result
        ..add('paino')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  SarjaStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SarjaStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'toistoMaara':
          result.toistoMaara = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'paino':
          result.paino = serializers.deserialize(value,
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

class _$SarjaStruct extends SarjaStruct {
  @override
  final int? toistoMaara;
  @override
  final double? paino;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$SarjaStruct([void Function(SarjaStructBuilder)? updates]) =>
      (new SarjaStructBuilder()..update(updates))._build();

  _$SarjaStruct._(
      {this.toistoMaara, this.paino, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'SarjaStruct', 'firestoreUtilData');
  }

  @override
  SarjaStruct rebuild(void Function(SarjaStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SarjaStructBuilder toBuilder() => new SarjaStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SarjaStruct &&
        toistoMaara == other.toistoMaara &&
        paino == other.paino &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, toistoMaara.hashCode);
    _$hash = $jc(_$hash, paino.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SarjaStruct')
          ..add('toistoMaara', toistoMaara)
          ..add('paino', paino)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class SarjaStructBuilder implements Builder<SarjaStruct, SarjaStructBuilder> {
  _$SarjaStruct? _$v;

  int? _toistoMaara;
  int? get toistoMaara => _$this._toistoMaara;
  set toistoMaara(int? toistoMaara) => _$this._toistoMaara = toistoMaara;

  double? _paino;
  double? get paino => _$this._paino;
  set paino(double? paino) => _$this._paino = paino;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  SarjaStructBuilder() {
    SarjaStruct._initializeBuilder(this);
  }

  SarjaStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _toistoMaara = $v.toistoMaara;
      _paino = $v.paino;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SarjaStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SarjaStruct;
  }

  @override
  void update(void Function(SarjaStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SarjaStruct build() => _build();

  _$SarjaStruct _build() {
    final _$result = _$v ??
        new _$SarjaStruct._(
            toistoMaara: toistoMaara,
            paino: paino,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'SarjaStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
