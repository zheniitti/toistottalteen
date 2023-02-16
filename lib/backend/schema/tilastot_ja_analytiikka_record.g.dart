// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tilastot_ja_analytiikka_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TilastotJaAnalytiikkaRecord>
    _$tilastotJaAnalytiikkaRecordSerializer =
    new _$TilastotJaAnalytiikkaRecordSerializer();

class _$TilastotJaAnalytiikkaRecordSerializer
    implements StructuredSerializer<TilastotJaAnalytiikkaRecord> {
  @override
  final Iterable<Type> types = const [
    TilastotJaAnalytiikkaRecord,
    _$TilastotJaAnalytiikkaRecord
  ];
  @override
  final String wireName = 'TilastotJaAnalytiikkaRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TilastotJaAnalytiikkaRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.kaikkiLiikkeet;
    if (value != null) {
      result
        ..add('kaikkiLiikkeet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.kaikkiTreenirutiininNimet;
    if (value != null) {
      result
        ..add('kaikkiTreenirutiininNimet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.sovelluksenAvaukset;
    if (value != null) {
      result
        ..add('sovelluksenAvaukset')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tallennetutTreenisessiot;
    if (value != null) {
      result
        ..add('tallennetutTreenisessiot')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  TilastotJaAnalytiikkaRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TilastotJaAnalytiikkaRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'kaikkiLiikkeet':
          result.kaikkiLiikkeet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'kaikkiTreenirutiininNimet':
          result.kaikkiTreenirutiininNimet.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'sovelluksenAvaukset':
          result.sovelluksenAvaukset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tallennetutTreenisessiot':
          result.tallennetutTreenisessiot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$TilastotJaAnalytiikkaRecord extends TilastotJaAnalytiikkaRecord {
  @override
  final BuiltList<String>? kaikkiLiikkeet;
  @override
  final BuiltList<String>? kaikkiTreenirutiininNimet;
  @override
  final int? sovelluksenAvaukset;
  @override
  final int? tallennetutTreenisessiot;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TilastotJaAnalytiikkaRecord(
          [void Function(TilastotJaAnalytiikkaRecordBuilder)? updates]) =>
      (new TilastotJaAnalytiikkaRecordBuilder()..update(updates))._build();

  _$TilastotJaAnalytiikkaRecord._(
      {this.kaikkiLiikkeet,
      this.kaikkiTreenirutiininNimet,
      this.sovelluksenAvaukset,
      this.tallennetutTreenisessiot,
      this.ffRef})
      : super._();

  @override
  TilastotJaAnalytiikkaRecord rebuild(
          void Function(TilastotJaAnalytiikkaRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TilastotJaAnalytiikkaRecordBuilder toBuilder() =>
      new TilastotJaAnalytiikkaRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TilastotJaAnalytiikkaRecord &&
        kaikkiLiikkeet == other.kaikkiLiikkeet &&
        kaikkiTreenirutiininNimet == other.kaikkiTreenirutiininNimet &&
        sovelluksenAvaukset == other.sovelluksenAvaukset &&
        tallennetutTreenisessiot == other.tallennetutTreenisessiot &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc(0, kaikkiLiikkeet.hashCode),
                    kaikkiTreenirutiininNimet.hashCode),
                sovelluksenAvaukset.hashCode),
            tallennetutTreenisessiot.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TilastotJaAnalytiikkaRecord')
          ..add('kaikkiLiikkeet', kaikkiLiikkeet)
          ..add('kaikkiTreenirutiininNimet', kaikkiTreenirutiininNimet)
          ..add('sovelluksenAvaukset', sovelluksenAvaukset)
          ..add('tallennetutTreenisessiot', tallennetutTreenisessiot)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TilastotJaAnalytiikkaRecordBuilder
    implements
        Builder<TilastotJaAnalytiikkaRecord,
            TilastotJaAnalytiikkaRecordBuilder> {
  _$TilastotJaAnalytiikkaRecord? _$v;

  ListBuilder<String>? _kaikkiLiikkeet;
  ListBuilder<String> get kaikkiLiikkeet =>
      _$this._kaikkiLiikkeet ??= new ListBuilder<String>();
  set kaikkiLiikkeet(ListBuilder<String>? kaikkiLiikkeet) =>
      _$this._kaikkiLiikkeet = kaikkiLiikkeet;

  ListBuilder<String>? _kaikkiTreenirutiininNimet;
  ListBuilder<String> get kaikkiTreenirutiininNimet =>
      _$this._kaikkiTreenirutiininNimet ??= new ListBuilder<String>();
  set kaikkiTreenirutiininNimet(
          ListBuilder<String>? kaikkiTreenirutiininNimet) =>
      _$this._kaikkiTreenirutiininNimet = kaikkiTreenirutiininNimet;

  int? _sovelluksenAvaukset;
  int? get sovelluksenAvaukset => _$this._sovelluksenAvaukset;
  set sovelluksenAvaukset(int? sovelluksenAvaukset) =>
      _$this._sovelluksenAvaukset = sovelluksenAvaukset;

  int? _tallennetutTreenisessiot;
  int? get tallennetutTreenisessiot => _$this._tallennetutTreenisessiot;
  set tallennetutTreenisessiot(int? tallennetutTreenisessiot) =>
      _$this._tallennetutTreenisessiot = tallennetutTreenisessiot;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TilastotJaAnalytiikkaRecordBuilder() {
    TilastotJaAnalytiikkaRecord._initializeBuilder(this);
  }

  TilastotJaAnalytiikkaRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kaikkiLiikkeet = $v.kaikkiLiikkeet?.toBuilder();
      _kaikkiTreenirutiininNimet = $v.kaikkiTreenirutiininNimet?.toBuilder();
      _sovelluksenAvaukset = $v.sovelluksenAvaukset;
      _tallennetutTreenisessiot = $v.tallennetutTreenisessiot;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TilastotJaAnalytiikkaRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TilastotJaAnalytiikkaRecord;
  }

  @override
  void update(void Function(TilastotJaAnalytiikkaRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TilastotJaAnalytiikkaRecord build() => _build();

  _$TilastotJaAnalytiikkaRecord _build() {
    _$TilastotJaAnalytiikkaRecord _$result;
    try {
      _$result = _$v ??
          new _$TilastotJaAnalytiikkaRecord._(
              kaikkiLiikkeet: _kaikkiLiikkeet?.build(),
              kaikkiTreenirutiininNimet: _kaikkiTreenirutiininNimet?.build(),
              sovelluksenAvaukset: sovelluksenAvaukset,
              tallennetutTreenisessiot: tallennetutTreenisessiot,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'kaikkiLiikkeet';
        _kaikkiLiikkeet?.build();
        _$failedField = 'kaikkiTreenirutiininNimet';
        _kaikkiTreenirutiininNimet?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TilastotJaAnalytiikkaRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
