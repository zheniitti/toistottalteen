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
      'treeniSessio',
      serializers.serialize(object.treeniSessio,
          specifiedType: const FullType(TreeniSessioStruct)),
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
        case 'treeniSessio':
          result.treeniSessio.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TreeniSessioStruct))!
              as TreeniSessioStruct);
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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
  final TreeniSessioStruct treeniSessio;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TreeniSessiotRecord(
          [void Function(TreeniSessiotRecordBuilder)? updates]) =>
      (new TreeniSessiotRecordBuilder()..update(updates))._build();

  _$TreeniSessiotRecord._(
      {required this.treeniSessio, this.userRef, this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        treeniSessio, r'TreeniSessiotRecord', 'treeniSessio');
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
        treeniSessio == other.treeniSessio &&
        userRef == other.userRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, treeniSessio.hashCode), userRef.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TreeniSessiotRecord')
          ..add('treeniSessio', treeniSessio)
          ..add('userRef', userRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TreeniSessiotRecordBuilder
    implements Builder<TreeniSessiotRecord, TreeniSessiotRecordBuilder> {
  _$TreeniSessiotRecord? _$v;

  TreeniSessioStructBuilder? _treeniSessio;
  TreeniSessioStructBuilder get treeniSessio =>
      _$this._treeniSessio ??= new TreeniSessioStructBuilder();
  set treeniSessio(TreeniSessioStructBuilder? treeniSessio) =>
      _$this._treeniSessio = treeniSessio;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TreeniSessiotRecordBuilder() {
    TreeniSessiotRecord._initializeBuilder(this);
  }

  TreeniSessiotRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _treeniSessio = $v.treeniSessio.toBuilder();
      _userRef = $v.userRef;
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
              treeniSessio: treeniSessio.build(),
              userRef: userRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'treeniSessio';
        treeniSessio.build();
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
