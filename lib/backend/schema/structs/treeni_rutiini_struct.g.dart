// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treeni_rutiini_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TreeniRutiiniStruct> _$treeniRutiiniStructSerializer =
    new _$TreeniRutiiniStructSerializer();

class _$TreeniRutiiniStructSerializer
    implements StructuredSerializer<TreeniRutiiniStruct> {
  @override
  final Iterable<Type> types = const [
    TreeniRutiiniStruct,
    _$TreeniRutiiniStruct
  ];
  @override
  final String wireName = 'TreeniRutiiniStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TreeniRutiiniStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'liikkeet',
      serializers.serialize(object.liikkeet,
          specifiedType:
              const FullType(BuiltList, const [const FullType(LiikeStruct)])),
      'valitutViikonPaivat',
      serializers.serialize(object.valitutViikonPaivat,
          specifiedType: const FullType(ValitutViikonPaivatStruct)),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.kommentti;
    if (value != null) {
      result
        ..add('kommentti')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('createdTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.nimi;
    if (value != null) {
      result
        ..add('nimi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.widgetExpanded;
    if (value != null) {
      result
        ..add('widgetExpanded')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.lastWorkoutTime;
    if (value != null) {
      result
        ..add('lastWorkoutTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedTimes;
    if (value != null) {
      result
        ..add('modifiedTimes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.isTreeniPohja;
    if (value != null) {
      result
        ..add('isTreeniPohja')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showComment;
    if (value != null) {
      result
        ..add('showComment')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  TreeniRutiiniStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TreeniRutiiniStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'liikkeet':
          result.liikkeet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LiikeStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'kommentti':
          result.kommentti = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdTime':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'nimi':
          result.nimi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valitutViikonPaivat':
          result.valitutViikonPaivat.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ValitutViikonPaivatStruct))!
              as ValitutViikonPaivatStruct);
          break;
        case 'widgetExpanded':
          result.widgetExpanded = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'lastWorkoutTime':
          result.lastWorkoutTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modifiedTimes':
          result.modifiedTimes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'isTreeniPohja':
          result.isTreeniPohja = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showComment':
          result.showComment = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$TreeniRutiiniStruct extends TreeniRutiiniStruct {
  @override
  final BuiltList<LiikeStruct> liikkeet;
  @override
  final String? kommentti;
  @override
  final DateTime? createdTime;
  @override
  final String? nimi;
  @override
  final ValitutViikonPaivatStruct valitutViikonPaivat;
  @override
  final bool? widgetExpanded;
  @override
  final DateTime? lastWorkoutTime;
  @override
  final BuiltList<DateTime>? modifiedTimes;
  @override
  final bool? isTreeniPohja;
  @override
  final bool? showComment;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TreeniRutiiniStruct(
          [void Function(TreeniRutiiniStructBuilder)? updates]) =>
      (new TreeniRutiiniStructBuilder()..update(updates))._build();

  _$TreeniRutiiniStruct._(
      {required this.liikkeet,
      this.kommentti,
      this.createdTime,
      this.nimi,
      required this.valitutViikonPaivat,
      this.widgetExpanded,
      this.lastWorkoutTime,
      this.modifiedTimes,
      this.isTreeniPohja,
      this.showComment,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        liikkeet, r'TreeniRutiiniStruct', 'liikkeet');
    BuiltValueNullFieldError.checkNotNull(
        valitutViikonPaivat, r'TreeniRutiiniStruct', 'valitutViikonPaivat');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'TreeniRutiiniStruct', 'firestoreUtilData');
  }

  @override
  TreeniRutiiniStruct rebuild(
          void Function(TreeniRutiiniStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TreeniRutiiniStructBuilder toBuilder() =>
      new TreeniRutiiniStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TreeniRutiiniStruct &&
        liikkeet == other.liikkeet &&
        kommentti == other.kommentti &&
        createdTime == other.createdTime &&
        nimi == other.nimi &&
        valitutViikonPaivat == other.valitutViikonPaivat &&
        widgetExpanded == other.widgetExpanded &&
        lastWorkoutTime == other.lastWorkoutTime &&
        modifiedTimes == other.modifiedTimes &&
        isTreeniPohja == other.isTreeniPohja &&
        showComment == other.showComment &&
        firestoreUtilData == other.firestoreUtilData;
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
                                $jc(
                                    $jc(
                                        $jc($jc(0, liikkeet.hashCode),
                                            kommentti.hashCode),
                                        createdTime.hashCode),
                                    nimi.hashCode),
                                valitutViikonPaivat.hashCode),
                            widgetExpanded.hashCode),
                        lastWorkoutTime.hashCode),
                    modifiedTimes.hashCode),
                isTreeniPohja.hashCode),
            showComment.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TreeniRutiiniStruct')
          ..add('liikkeet', liikkeet)
          ..add('kommentti', kommentti)
          ..add('createdTime', createdTime)
          ..add('nimi', nimi)
          ..add('valitutViikonPaivat', valitutViikonPaivat)
          ..add('widgetExpanded', widgetExpanded)
          ..add('lastWorkoutTime', lastWorkoutTime)
          ..add('modifiedTimes', modifiedTimes)
          ..add('isTreeniPohja', isTreeniPohja)
          ..add('showComment', showComment)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TreeniRutiiniStructBuilder
    implements Builder<TreeniRutiiniStruct, TreeniRutiiniStructBuilder> {
  _$TreeniRutiiniStruct? _$v;

  ListBuilder<LiikeStruct>? _liikkeet;
  ListBuilder<LiikeStruct> get liikkeet =>
      _$this._liikkeet ??= new ListBuilder<LiikeStruct>();
  set liikkeet(ListBuilder<LiikeStruct>? liikkeet) =>
      _$this._liikkeet = liikkeet;

  String? _kommentti;
  String? get kommentti => _$this._kommentti;
  set kommentti(String? kommentti) => _$this._kommentti = kommentti;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _nimi;
  String? get nimi => _$this._nimi;
  set nimi(String? nimi) => _$this._nimi = nimi;

  ValitutViikonPaivatStructBuilder? _valitutViikonPaivat;
  ValitutViikonPaivatStructBuilder get valitutViikonPaivat =>
      _$this._valitutViikonPaivat ??= new ValitutViikonPaivatStructBuilder();
  set valitutViikonPaivat(
          ValitutViikonPaivatStructBuilder? valitutViikonPaivat) =>
      _$this._valitutViikonPaivat = valitutViikonPaivat;

  bool? _widgetExpanded;
  bool? get widgetExpanded => _$this._widgetExpanded;
  set widgetExpanded(bool? widgetExpanded) =>
      _$this._widgetExpanded = widgetExpanded;

  DateTime? _lastWorkoutTime;
  DateTime? get lastWorkoutTime => _$this._lastWorkoutTime;
  set lastWorkoutTime(DateTime? lastWorkoutTime) =>
      _$this._lastWorkoutTime = lastWorkoutTime;

  ListBuilder<DateTime>? _modifiedTimes;
  ListBuilder<DateTime> get modifiedTimes =>
      _$this._modifiedTimes ??= new ListBuilder<DateTime>();
  set modifiedTimes(ListBuilder<DateTime>? modifiedTimes) =>
      _$this._modifiedTimes = modifiedTimes;

  bool? _isTreeniPohja;
  bool? get isTreeniPohja => _$this._isTreeniPohja;
  set isTreeniPohja(bool? isTreeniPohja) =>
      _$this._isTreeniPohja = isTreeniPohja;

  bool? _showComment;
  bool? get showComment => _$this._showComment;
  set showComment(bool? showComment) => _$this._showComment = showComment;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TreeniRutiiniStructBuilder() {
    TreeniRutiiniStruct._initializeBuilder(this);
  }

  TreeniRutiiniStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _liikkeet = $v.liikkeet.toBuilder();
      _kommentti = $v.kommentti;
      _createdTime = $v.createdTime;
      _nimi = $v.nimi;
      _valitutViikonPaivat = $v.valitutViikonPaivat.toBuilder();
      _widgetExpanded = $v.widgetExpanded;
      _lastWorkoutTime = $v.lastWorkoutTime;
      _modifiedTimes = $v.modifiedTimes?.toBuilder();
      _isTreeniPohja = $v.isTreeniPohja;
      _showComment = $v.showComment;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TreeniRutiiniStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TreeniRutiiniStruct;
  }

  @override
  void update(void Function(TreeniRutiiniStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TreeniRutiiniStruct build() => _build();

  _$TreeniRutiiniStruct _build() {
    _$TreeniRutiiniStruct _$result;
    try {
      _$result = _$v ??
          new _$TreeniRutiiniStruct._(
              liikkeet: liikkeet.build(),
              kommentti: kommentti,
              createdTime: createdTime,
              nimi: nimi,
              valitutViikonPaivat: valitutViikonPaivat.build(),
              widgetExpanded: widgetExpanded,
              lastWorkoutTime: lastWorkoutTime,
              modifiedTimes: _modifiedTimes?.build(),
              isTreeniPohja: isTreeniPohja,
              showComment: showComment,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'TreeniRutiiniStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'liikkeet';
        liikkeet.build();

        _$failedField = 'valitutViikonPaivat';
        valitutViikonPaivat.build();

        _$failedField = 'modifiedTimes';
        _modifiedTimes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TreeniRutiiniStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
