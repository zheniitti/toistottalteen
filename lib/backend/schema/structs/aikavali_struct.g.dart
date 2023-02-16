// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aikavali_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AikavaliStruct> _$aikavaliStructSerializer =
    new _$AikavaliStructSerializer();

class _$AikavaliStructSerializer
    implements StructuredSerializer<AikavaliStruct> {
  @override
  final Iterable<Type> types = const [AikavaliStruct, _$AikavaliStruct];
  @override
  final String wireName = 'AikavaliStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, AikavaliStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.alku;
    if (value != null) {
      result
        ..add('alku')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.loppu;
    if (value != null) {
      result
        ..add('loppu')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  AikavaliStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AikavaliStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'alku':
          result.alku = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'loppu':
          result.loppu = serializers.deserialize(value,
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

class _$AikavaliStruct extends AikavaliStruct {
  @override
  final DateTime? alku;
  @override
  final DateTime? loppu;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$AikavaliStruct([void Function(AikavaliStructBuilder)? updates]) =>
      (new AikavaliStructBuilder()..update(updates))._build();

  _$AikavaliStruct._({this.alku, this.loppu, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'AikavaliStruct', 'firestoreUtilData');
  }

  @override
  AikavaliStruct rebuild(void Function(AikavaliStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AikavaliStructBuilder toBuilder() =>
      new AikavaliStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AikavaliStruct &&
        alku == other.alku &&
        loppu == other.loppu &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, alku.hashCode), loppu.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AikavaliStruct')
          ..add('alku', alku)
          ..add('loppu', loppu)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class AikavaliStructBuilder
    implements Builder<AikavaliStruct, AikavaliStructBuilder> {
  _$AikavaliStruct? _$v;

  DateTime? _alku;
  DateTime? get alku => _$this._alku;
  set alku(DateTime? alku) => _$this._alku = alku;

  DateTime? _loppu;
  DateTime? get loppu => _$this._loppu;
  set loppu(DateTime? loppu) => _$this._loppu = loppu;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  AikavaliStructBuilder() {
    AikavaliStruct._initializeBuilder(this);
  }

  AikavaliStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _alku = $v.alku;
      _loppu = $v.loppu;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AikavaliStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AikavaliStruct;
  }

  @override
  void update(void Function(AikavaliStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AikavaliStruct build() => _build();

  _$AikavaliStruct _build() {
    final _$result = _$v ??
        new _$AikavaliStruct._(
            alku: alku,
            loppu: loppu,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'AikavaliStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
