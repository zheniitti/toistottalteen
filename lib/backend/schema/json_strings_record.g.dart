// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_strings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JsonStringsRecord> _$jsonStringsRecordSerializer =
    new _$JsonStringsRecordSerializer();

class _$JsonStringsRecordSerializer
    implements StructuredSerializer<JsonStringsRecord> {
  @override
  final Iterable<Type> types = const [JsonStringsRecord, _$JsonStringsRecord];
  @override
  final String wireName = 'JsonStringsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, JsonStringsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.jsonString;
    if (value != null) {
      result
        ..add('jsonString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.creationTime;
    if (value != null) {
      result
        ..add('creationTime')
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
  JsonStringsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JsonStringsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'jsonString':
          result.jsonString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'creationTime':
          result.creationTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modifiedTime':
          result.modifiedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$JsonStringsRecord extends JsonStringsRecord {
  @override
  final String? jsonString;
  @override
  final DateTime? creationTime;
  @override
  final DateTime? modifiedTime;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JsonStringsRecord(
          [void Function(JsonStringsRecordBuilder)? updates]) =>
      (new JsonStringsRecordBuilder()..update(updates))._build();

  _$JsonStringsRecord._(
      {this.jsonString,
      this.creationTime,
      this.modifiedTime,
      this.userRef,
      this.ffRef})
      : super._();

  @override
  JsonStringsRecord rebuild(void Function(JsonStringsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JsonStringsRecordBuilder toBuilder() =>
      new JsonStringsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JsonStringsRecord &&
        jsonString == other.jsonString &&
        creationTime == other.creationTime &&
        modifiedTime == other.modifiedTime &&
        userRef == other.userRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, jsonString.hashCode), creationTime.hashCode),
                modifiedTime.hashCode),
            userRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JsonStringsRecord')
          ..add('jsonString', jsonString)
          ..add('creationTime', creationTime)
          ..add('modifiedTime', modifiedTime)
          ..add('userRef', userRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JsonStringsRecordBuilder
    implements Builder<JsonStringsRecord, JsonStringsRecordBuilder> {
  _$JsonStringsRecord? _$v;

  String? _jsonString;
  String? get jsonString => _$this._jsonString;
  set jsonString(String? jsonString) => _$this._jsonString = jsonString;

  DateTime? _creationTime;
  DateTime? get creationTime => _$this._creationTime;
  set creationTime(DateTime? creationTime) =>
      _$this._creationTime = creationTime;

  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _$this._modifiedTime;
  set modifiedTime(DateTime? modifiedTime) =>
      _$this._modifiedTime = modifiedTime;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JsonStringsRecordBuilder() {
    JsonStringsRecord._initializeBuilder(this);
  }

  JsonStringsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jsonString = $v.jsonString;
      _creationTime = $v.creationTime;
      _modifiedTime = $v.modifiedTime;
      _userRef = $v.userRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JsonStringsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JsonStringsRecord;
  }

  @override
  void update(void Function(JsonStringsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JsonStringsRecord build() => _build();

  _$JsonStringsRecord _build() {
    final _$result = _$v ??
        new _$JsonStringsRecord._(
            jsonString: jsonString,
            creationTime: creationTime,
            modifiedTime: modifiedTime,
            userRef: userRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
