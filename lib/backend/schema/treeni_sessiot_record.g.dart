// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treeni_sessiot_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TreeniSessiotRecord> _$treeniSessiotRecordSerializer =
    new _$TreeniSessiotRecordSerializer();

class _$TreeniSessiotRecordSerializer
    implements StructuredSerializer<TreeniSessiotRecord> {
  @override
  final Iterable<Type> types = const [
    TreeniSessiotRecord,
    _$TreeniSessiotRecord
  ];
  @override
  final String wireName = 'TreeniSessiotRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TreeniSessiotRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'treeniRutiiniData',
      serializers.serialize(object.treeniRutiiniData,
          specifiedType: const FullType(TreeniRutiiniStruct)),
    ];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
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
  TreeniSessiotRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TreeniSessiotRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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
        case 'treeniRutiiniData':
          result.treeniRutiiniData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TreeniRutiiniStruct))!
              as TreeniRutiiniStruct);
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

class _$TreeniSessiotRecord extends TreeniSessiotRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? alku;
  @override
  final DateTime? loppu;
  @override
  final String? kommentti;
  @override
  final TreeniRutiiniStruct treeniRutiiniData;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TreeniSessiotRecord(
          [void Function(TreeniSessiotRecordBuilder)? updates]) =>
      (new TreeniSessiotRecordBuilder()..update(updates))._build();

  _$TreeniSessiotRecord._(
      {this.userRef,
      this.alku,
      this.loppu,
      this.kommentti,
      required this.treeniRutiiniData,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        treeniRutiiniData, r'TreeniSessiotRecord', 'treeniRutiiniData');
  }

  @override
  TreeniSessiotRecord rebuild(
          void Function(TreeniSessiotRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TreeniSessiotRecordBuilder toBuilder() =>
      new TreeniSessiotRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TreeniSessiotRecord &&
        userRef == other.userRef &&
        alku == other.alku &&
        loppu == other.loppu &&
        kommentti == other.kommentti &&
        treeniRutiiniData == other.treeniRutiiniData &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, userRef.hashCode), alku.hashCode),
                    loppu.hashCode),
                kommentti.hashCode),
            treeniRutiiniData.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TreeniSessiotRecord')
          ..add('userRef', userRef)
          ..add('alku', alku)
          ..add('loppu', loppu)
          ..add('kommentti', kommentti)
          ..add('treeniRutiiniData', treeniRutiiniData)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TreeniSessiotRecordBuilder
    implements Builder<TreeniSessiotRecord, TreeniSessiotRecordBuilder> {
  _$TreeniSessiotRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _alku;
  DateTime? get alku => _$this._alku;
  set alku(DateTime? alku) => _$this._alku = alku;

  DateTime? _loppu;
  DateTime? get loppu => _$this._loppu;
  set loppu(DateTime? loppu) => _$this._loppu = loppu;

  String? _kommentti;
  String? get kommentti => _$this._kommentti;
  set kommentti(String? kommentti) => _$this._kommentti = kommentti;

  TreeniRutiiniStructBuilder? _treeniRutiiniData;
  TreeniRutiiniStructBuilder get treeniRutiiniData =>
      _$this._treeniRutiiniData ??= new TreeniRutiiniStructBuilder();
  set treeniRutiiniData(TreeniRutiiniStructBuilder? treeniRutiiniData) =>
      _$this._treeniRutiiniData = treeniRutiiniData;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TreeniSessiotRecordBuilder() {
    TreeniSessiotRecord._initializeBuilder(this);
  }

  TreeniSessiotRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _alku = $v.alku;
      _loppu = $v.loppu;
      _kommentti = $v.kommentti;
      _treeniRutiiniData = $v.treeniRutiiniData.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TreeniSessiotRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TreeniSessiotRecord;
  }

  @override
  void update(void Function(TreeniSessiotRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TreeniSessiotRecord build() => _build();

  _$TreeniSessiotRecord _build() {
    _$TreeniSessiotRecord _$result;
    try {
      _$result = _$v ??
          new _$TreeniSessiotRecord._(
              userRef: userRef,
              alku: alku,
              loppu: loppu,
              kommentti: kommentti,
              treeniRutiiniData: treeniRutiiniData.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'treeniRutiiniData';
        treeniRutiiniData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TreeniSessiotRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
