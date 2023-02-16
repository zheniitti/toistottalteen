// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppConfigRecord> _$appConfigRecordSerializer =
    new _$AppConfigRecordSerializer();

class _$AppConfigRecordSerializer
    implements StructuredSerializer<AppConfigRecord> {
  @override
  final Iterable<Type> types = const [AppConfigRecord, _$AppConfigRecord];
  @override
  final String wireName = 'AppConfigRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppConfigRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.androidShowBannerAds;
    if (value != null) {
      result
        ..add('androidShowBannerAds')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  AppConfigRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppConfigRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'androidShowBannerAds':
          result.androidShowBannerAds = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$AppConfigRecord extends AppConfigRecord {
  @override
  final bool? androidShowBannerAds;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppConfigRecord([void Function(AppConfigRecordBuilder)? updates]) =>
      (new AppConfigRecordBuilder()..update(updates))._build();

  _$AppConfigRecord._({this.androidShowBannerAds, this.ffRef}) : super._();

  @override
  AppConfigRecord rebuild(void Function(AppConfigRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppConfigRecordBuilder toBuilder() =>
      new AppConfigRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppConfigRecord &&
        androidShowBannerAds == other.androidShowBannerAds &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, androidShowBannerAds.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppConfigRecord')
          ..add('androidShowBannerAds', androidShowBannerAds)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppConfigRecordBuilder
    implements Builder<AppConfigRecord, AppConfigRecordBuilder> {
  _$AppConfigRecord? _$v;

  bool? _androidShowBannerAds;
  bool? get androidShowBannerAds => _$this._androidShowBannerAds;
  set androidShowBannerAds(bool? androidShowBannerAds) =>
      _$this._androidShowBannerAds = androidShowBannerAds;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppConfigRecordBuilder() {
    AppConfigRecord._initializeBuilder(this);
  }

  AppConfigRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _androidShowBannerAds = $v.androidShowBannerAds;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppConfigRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppConfigRecord;
  }

  @override
  void update(void Function(AppConfigRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppConfigRecord build() => _build();

  _$AppConfigRecord _build() {
    final _$result = _$v ??
        new _$AppConfigRecord._(
            androidShowBannerAds: androidShowBannerAds, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
