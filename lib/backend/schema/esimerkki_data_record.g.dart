// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esimerkki_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EsimerkkiDataRecord> _$esimerkkiDataRecordSerializer =
    new _$EsimerkkiDataRecordSerializer();

class _$EsimerkkiDataRecordSerializer
    implements StructuredSerializer<EsimerkkiDataRecord> {
  @override
  final Iterable<Type> types = const [
    EsimerkkiDataRecord,
    _$EsimerkkiDataRecord
  ];
  @override
  final String wireName = 'EsimerkkiDataRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EsimerkkiDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.esimerkkiRutiinit;
    if (value != null) {
      result
        ..add('esimerkkiRutiinit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TreeniRutiiniStruct)])));
    }
    value = object.languageCode;
    if (value != null) {
      result
        ..add('languageCode')
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
  EsimerkkiDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EsimerkkiDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'esimerkkiRutiinit':
          result.esimerkkiRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TreeniRutiiniStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'languageCode':
          result.languageCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$EsimerkkiDataRecord extends EsimerkkiDataRecord {
  @override
  final BuiltList<TreeniRutiiniStruct>? esimerkkiRutiinit;
  @override
  final String? languageCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EsimerkkiDataRecord(
          [void Function(EsimerkkiDataRecordBuilder)? updates]) =>
      (new EsimerkkiDataRecordBuilder()..update(updates))._build();

  _$EsimerkkiDataRecord._(
      {this.esimerkkiRutiinit, this.languageCode, this.ffRef})
      : super._();

  @override
  EsimerkkiDataRecord rebuild(
          void Function(EsimerkkiDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EsimerkkiDataRecordBuilder toBuilder() =>
      new EsimerkkiDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EsimerkkiDataRecord &&
        esimerkkiRutiinit == other.esimerkkiRutiinit &&
        languageCode == other.languageCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, esimerkkiRutiinit.hashCode);
    _$hash = $jc(_$hash, languageCode.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EsimerkkiDataRecord')
          ..add('esimerkkiRutiinit', esimerkkiRutiinit)
          ..add('languageCode', languageCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EsimerkkiDataRecordBuilder
    implements Builder<EsimerkkiDataRecord, EsimerkkiDataRecordBuilder> {
  _$EsimerkkiDataRecord? _$v;

  ListBuilder<TreeniRutiiniStruct>? _esimerkkiRutiinit;
  ListBuilder<TreeniRutiiniStruct> get esimerkkiRutiinit =>
      _$this._esimerkkiRutiinit ??= new ListBuilder<TreeniRutiiniStruct>();
  set esimerkkiRutiinit(ListBuilder<TreeniRutiiniStruct>? esimerkkiRutiinit) =>
      _$this._esimerkkiRutiinit = esimerkkiRutiinit;

  String? _languageCode;
  String? get languageCode => _$this._languageCode;
  set languageCode(String? languageCode) => _$this._languageCode = languageCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EsimerkkiDataRecordBuilder() {
    EsimerkkiDataRecord._initializeBuilder(this);
  }

  EsimerkkiDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _esimerkkiRutiinit = $v.esimerkkiRutiinit?.toBuilder();
      _languageCode = $v.languageCode;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EsimerkkiDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EsimerkkiDataRecord;
  }

  @override
  void update(void Function(EsimerkkiDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EsimerkkiDataRecord build() => _build();

  _$EsimerkkiDataRecord _build() {
    _$EsimerkkiDataRecord _$result;
    try {
      _$result = _$v ??
          new _$EsimerkkiDataRecord._(
              esimerkkiRutiinit: _esimerkkiRutiinit?.build(),
              languageCode: languageCode,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'esimerkkiRutiinit';
        _esimerkkiRutiinit?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EsimerkkiDataRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
