// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treeni_sessio_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TreeniSessioStruct> _$treeniSessioStructSerializer =
    new _$TreeniSessioStructSerializer();

class _$TreeniSessioStructSerializer
    implements StructuredSerializer<TreeniSessioStruct> {
  @override
  final Iterable<Type> types = const [TreeniSessioStruct, _$TreeniSessioStruct];
  @override
  final String wireName = 'TreeniSessioStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TreeniSessioStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'treeniRutiini',
      serializers.serialize(object.treeniRutiini,
          specifiedType: const FullType(TreeniRutiiniStruct)),
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
    value = object.kommentti;
    if (value != null) {
      result
        ..add('kommentti')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TreeniSessioStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TreeniSessioStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'treeniRutiini':
          result.treeniRutiini.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TreeniRutiiniStruct))!
              as TreeniRutiiniStruct);
          break;
        case 'alku':
          result.alku = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'loppu':
          result.loppu = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'kommentti':
          result.kommentti = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$TreeniSessioStruct extends TreeniSessioStruct {
  @override
  final TreeniRutiiniStruct treeniRutiini;
  @override
  final DateTime? alku;
  @override
  final DateTime? loppu;
  @override
  final String? kommentti;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TreeniSessioStruct(
          [void Function(TreeniSessioStructBuilder)? updates]) =>
      (new TreeniSessioStructBuilder()..update(updates))._build();

  _$TreeniSessioStruct._(
      {required this.treeniRutiini,
      this.alku,
      this.loppu,
      this.kommentti,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        treeniRutiini, r'TreeniSessioStruct', 'treeniRutiini');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'TreeniSessioStruct', 'firestoreUtilData');
  }

  @override
  TreeniSessioStruct rebuild(
          void Function(TreeniSessioStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TreeniSessioStructBuilder toBuilder() =>
      new TreeniSessioStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TreeniSessioStruct &&
        treeniRutiini == other.treeniRutiini &&
        alku == other.alku &&
        loppu == other.loppu &&
        kommentti == other.kommentti &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, treeniRutiini.hashCode), alku.hashCode),
                loppu.hashCode),
            kommentti.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TreeniSessioStruct')
          ..add('treeniRutiini', treeniRutiini)
          ..add('alku', alku)
          ..add('loppu', loppu)
          ..add('kommentti', kommentti)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TreeniSessioStructBuilder
    implements Builder<TreeniSessioStruct, TreeniSessioStructBuilder> {
  _$TreeniSessioStruct? _$v;

  TreeniRutiiniStructBuilder? _treeniRutiini;
  TreeniRutiiniStructBuilder get treeniRutiini =>
      _$this._treeniRutiini ??= new TreeniRutiiniStructBuilder();
  set treeniRutiini(TreeniRutiiniStructBuilder? treeniRutiini) =>
      _$this._treeniRutiini = treeniRutiini;

  DateTime? _alku;
  DateTime? get alku => _$this._alku;
  set alku(DateTime? alku) => _$this._alku = alku;

  DateTime? _loppu;
  DateTime? get loppu => _$this._loppu;
  set loppu(DateTime? loppu) => _$this._loppu = loppu;

  String? _kommentti;
  String? get kommentti => _$this._kommentti;
  set kommentti(String? kommentti) => _$this._kommentti = kommentti;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TreeniSessioStructBuilder() {
    TreeniSessioStruct._initializeBuilder(this);
  }

  TreeniSessioStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _treeniRutiini = $v.treeniRutiini.toBuilder();
      _alku = $v.alku;
      _loppu = $v.loppu;
      _kommentti = $v.kommentti;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TreeniSessioStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TreeniSessioStruct;
  }

  @override
  void update(void Function(TreeniSessioStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TreeniSessioStruct build() => _build();

  _$TreeniSessioStruct _build() {
    _$TreeniSessioStruct _$result;
    try {
      _$result = _$v ??
          new _$TreeniSessioStruct._(
              treeniRutiini: treeniRutiini.build(),
              alku: alku,
              loppu: loppu,
              kommentti: kommentti,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'TreeniSessioStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'treeniRutiini';
        treeniRutiini.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TreeniSessioStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
