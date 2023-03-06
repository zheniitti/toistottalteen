// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppDataRecord> _$appDataRecordSerializer =
    new _$AppDataRecordSerializer();

class _$AppDataRecordSerializer implements StructuredSerializer<AppDataRecord> {
  @override
  final Iterable<Type> types = const [AppDataRecord, _$AppDataRecord];
  @override
  final String wireName = 'AppDataRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.appLangCode;
    if (value != null) {
      result
        ..add('appLangCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.darkMode;
    if (value != null) {
      result
        ..add('darkMode')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.weightUnit;
    if (value != null) {
      result
        ..add('weightUnit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.treeniliikeNimet;
    if (value != null) {
      result
        ..add('treeniliikeNimet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.treeniRutiinit;
    if (value != null) {
      result
        ..add('treeniRutiinit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TreeniRutiiniStruct)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.latestPlatform;
    if (value != null) {
      result
        ..add('latestPlatform')
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
  AppDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'appLangCode':
          result.appLangCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'darkMode':
          result.darkMode = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'weightUnit':
          result.weightUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'treeniliikeNimet':
          result.treeniliikeNimet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'treeniRutiinit':
          result.treeniRutiinit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TreeniRutiiniStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'latestPlatform':
          result.latestPlatform = serializers.deserialize(value,
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

class _$AppDataRecord extends AppDataRecord {
  @override
  final DateTime? createdTime;
  @override
  final String? appLangCode;
  @override
  final bool? darkMode;
  @override
  final String? weightUnit;
  @override
  final BuiltList<String>? treeniliikeNimet;
  @override
  final BuiltList<TreeniRutiiniStruct>? treeniRutiinit;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? latestPlatform;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppDataRecord([void Function(AppDataRecordBuilder)? updates]) =>
      (new AppDataRecordBuilder()..update(updates))._build();

  _$AppDataRecord._(
      {this.createdTime,
      this.appLangCode,
      this.darkMode,
      this.weightUnit,
      this.treeniliikeNimet,
      this.treeniRutiinit,
      this.userRef,
      this.latestPlatform,
      this.ffRef})
      : super._();

  @override
  AppDataRecord rebuild(void Function(AppDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppDataRecordBuilder toBuilder() => new AppDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppDataRecord &&
        createdTime == other.createdTime &&
        appLangCode == other.appLangCode &&
        darkMode == other.darkMode &&
        weightUnit == other.weightUnit &&
        treeniliikeNimet == other.treeniliikeNimet &&
        treeniRutiinit == other.treeniRutiinit &&
        userRef == other.userRef &&
        latestPlatform == other.latestPlatform &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, createdTime.hashCode),
                                    appLangCode.hashCode),
                                darkMode.hashCode),
                            weightUnit.hashCode),
                        treeniliikeNimet.hashCode),
                    treeniRutiinit.hashCode),
                userRef.hashCode),
            latestPlatform.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppDataRecord')
          ..add('createdTime', createdTime)
          ..add('appLangCode', appLangCode)
          ..add('darkMode', darkMode)
          ..add('weightUnit', weightUnit)
          ..add('treeniliikeNimet', treeniliikeNimet)
          ..add('treeniRutiinit', treeniRutiinit)
          ..add('userRef', userRef)
          ..add('latestPlatform', latestPlatform)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppDataRecordBuilder
    implements Builder<AppDataRecord, AppDataRecordBuilder> {
  _$AppDataRecord? _$v;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _appLangCode;
  String? get appLangCode => _$this._appLangCode;
  set appLangCode(String? appLangCode) => _$this._appLangCode = appLangCode;

  bool? _darkMode;
  bool? get darkMode => _$this._darkMode;
  set darkMode(bool? darkMode) => _$this._darkMode = darkMode;

  String? _weightUnit;
  String? get weightUnit => _$this._weightUnit;
  set weightUnit(String? weightUnit) => _$this._weightUnit = weightUnit;

  ListBuilder<String>? _treeniliikeNimet;
  ListBuilder<String> get treeniliikeNimet =>
      _$this._treeniliikeNimet ??= new ListBuilder<String>();
  set treeniliikeNimet(ListBuilder<String>? treeniliikeNimet) =>
      _$this._treeniliikeNimet = treeniliikeNimet;

  ListBuilder<TreeniRutiiniStruct>? _treeniRutiinit;
  ListBuilder<TreeniRutiiniStruct> get treeniRutiinit =>
      _$this._treeniRutiinit ??= new ListBuilder<TreeniRutiiniStruct>();
  set treeniRutiinit(ListBuilder<TreeniRutiiniStruct>? treeniRutiinit) =>
      _$this._treeniRutiinit = treeniRutiinit;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _latestPlatform;
  String? get latestPlatform => _$this._latestPlatform;
  set latestPlatform(String? latestPlatform) =>
      _$this._latestPlatform = latestPlatform;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppDataRecordBuilder() {
    AppDataRecord._initializeBuilder(this);
  }

  AppDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _appLangCode = $v.appLangCode;
      _darkMode = $v.darkMode;
      _weightUnit = $v.weightUnit;
      _treeniliikeNimet = $v.treeniliikeNimet?.toBuilder();
      _treeniRutiinit = $v.treeniRutiinit?.toBuilder();
      _userRef = $v.userRef;
      _latestPlatform = $v.latestPlatform;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppDataRecord;
  }

  @override
  void update(void Function(AppDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppDataRecord build() => _build();

  _$AppDataRecord _build() {
    _$AppDataRecord _$result;
    try {
      _$result = _$v ??
          new _$AppDataRecord._(
              createdTime: createdTime,
              appLangCode: appLangCode,
              darkMode: darkMode,
              weightUnit: weightUnit,
              treeniliikeNimet: _treeniliikeNimet?.build(),
              treeniRutiinit: _treeniRutiinit?.build(),
              userRef: userRef,
              latestPlatform: latestPlatform,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'treeniliikeNimet';
        _treeniliikeNimet?.build();
        _$failedField = 'treeniRutiinit';
        _treeniRutiinit?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppDataRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
