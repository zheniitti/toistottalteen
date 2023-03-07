// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esimerkki_analytiikka_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EsimerkkiAnalytiikkaDataRecord>
    _$esimerkkiAnalytiikkaDataRecordSerializer =
    new _$EsimerkkiAnalytiikkaDataRecordSerializer();

class _$EsimerkkiAnalytiikkaDataRecordSerializer
    implements StructuredSerializer<EsimerkkiAnalytiikkaDataRecord> {
  @override
  final Iterable<Type> types = const [
    EsimerkkiAnalytiikkaDataRecord,
    _$EsimerkkiAnalytiikkaDataRecord
  ];
  @override
  final String wireName = 'EsimerkkiAnalytiikkaDataRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EsimerkkiAnalytiikkaDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.treeniliikeNimet;
    if (value != null) {
      result
        ..add('treeniliikeNimet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toistot;
    if (value != null) {
      result
        ..add('toistot')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.painot;
    if (value != null) {
      result
        ..add('painot')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.idPvm;
    if (value != null) {
      result
        ..add('id_pvm')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  EsimerkkiAnalytiikkaDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EsimerkkiAnalytiikkaDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'treeniliikeNimet':
          result.treeniliikeNimet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toistot':
          result.toistot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'painot':
          result.painot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'id_pvm':
          result.idPvm = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$EsimerkkiAnalytiikkaDataRecord extends EsimerkkiAnalytiikkaDataRecord {
  @override
  final String? treeniliikeNimet;
  @override
  final int? toistot;
  @override
  final int? painot;
  @override
  final DateTime? idPvm;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EsimerkkiAnalytiikkaDataRecord(
          [void Function(EsimerkkiAnalytiikkaDataRecordBuilder)? updates]) =>
      (new EsimerkkiAnalytiikkaDataRecordBuilder()..update(updates))._build();

  _$EsimerkkiAnalytiikkaDataRecord._(
      {this.treeniliikeNimet,
      this.toistot,
      this.painot,
      this.idPvm,
      this.ffRef})
      : super._();

  @override
  EsimerkkiAnalytiikkaDataRecord rebuild(
          void Function(EsimerkkiAnalytiikkaDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EsimerkkiAnalytiikkaDataRecordBuilder toBuilder() =>
      new EsimerkkiAnalytiikkaDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EsimerkkiAnalytiikkaDataRecord &&
        treeniliikeNimet == other.treeniliikeNimet &&
        toistot == other.toistot &&
        painot == other.painot &&
        idPvm == other.idPvm &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, treeniliikeNimet.hashCode), toistot.hashCode),
                painot.hashCode),
            idPvm.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EsimerkkiAnalytiikkaDataRecord')
          ..add('treeniliikeNimet', treeniliikeNimet)
          ..add('toistot', toistot)
          ..add('painot', painot)
          ..add('idPvm', idPvm)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EsimerkkiAnalytiikkaDataRecordBuilder
    implements
        Builder<EsimerkkiAnalytiikkaDataRecord,
            EsimerkkiAnalytiikkaDataRecordBuilder> {
  _$EsimerkkiAnalytiikkaDataRecord? _$v;

  String? _treeniliikeNimet;
  String? get treeniliikeNimet => _$this._treeniliikeNimet;
  set treeniliikeNimet(String? treeniliikeNimet) =>
      _$this._treeniliikeNimet = treeniliikeNimet;

  int? _toistot;
  int? get toistot => _$this._toistot;
  set toistot(int? toistot) => _$this._toistot = toistot;

  int? _painot;
  int? get painot => _$this._painot;
  set painot(int? painot) => _$this._painot = painot;

  DateTime? _idPvm;
  DateTime? get idPvm => _$this._idPvm;
  set idPvm(DateTime? idPvm) => _$this._idPvm = idPvm;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EsimerkkiAnalytiikkaDataRecordBuilder() {
    EsimerkkiAnalytiikkaDataRecord._initializeBuilder(this);
  }

  EsimerkkiAnalytiikkaDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _treeniliikeNimet = $v.treeniliikeNimet;
      _toistot = $v.toistot;
      _painot = $v.painot;
      _idPvm = $v.idPvm;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EsimerkkiAnalytiikkaDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EsimerkkiAnalytiikkaDataRecord;
  }

  @override
  void update(void Function(EsimerkkiAnalytiikkaDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EsimerkkiAnalytiikkaDataRecord build() => _build();

  _$EsimerkkiAnalytiikkaDataRecord _build() {
    final _$result = _$v ??
        new _$EsimerkkiAnalytiikkaDataRecord._(
            treeniliikeNimet: treeniliikeNimet,
            toistot: toistot,
            painot: painot,
            idPvm: idPvm,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
