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
    value = object.docCreatedTime;
    if (value != null) {
      result
        ..add('docCreatedTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photos;
    if (value != null) {
      result
        ..add('photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isEditing;
    if (value != null) {
      result
        ..add('isEditing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.lastModifiedTime;
    if (value != null) {
      result
        ..add('lastModifiedTime')
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
        case 'treeniRutiiniData':
          result.treeniRutiiniData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TreeniRutiiniStruct))!
              as TreeniRutiiniStruct);
          break;
        case 'docCreatedTime':
          result.docCreatedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'photos':
          result.photos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isEditing':
          result.isEditing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'lastModifiedTime':
          result.lastModifiedTime = serializers.deserialize(value,
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

class _$TreeniSessiotRecord extends TreeniSessiotRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? alku;
  @override
  final DateTime? loppu;
  @override
  final TreeniRutiiniStruct treeniRutiiniData;
  @override
  final DateTime? docCreatedTime;
  @override
  final BuiltList<String>? photos;
  @override
  final bool? isEditing;
  @override
  final DateTime? lastModifiedTime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TreeniSessiotRecord(
          [void Function(TreeniSessiotRecordBuilder)? updates]) =>
      (new TreeniSessiotRecordBuilder()..update(updates))._build();

  _$TreeniSessiotRecord._(
      {this.userRef,
      this.alku,
      this.loppu,
      required this.treeniRutiiniData,
      this.docCreatedTime,
      this.photos,
      this.isEditing,
      this.lastModifiedTime,
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
        treeniRutiiniData == other.treeniRutiiniData &&
        docCreatedTime == other.docCreatedTime &&
        photos == other.photos &&
        isEditing == other.isEditing &&
        lastModifiedTime == other.lastModifiedTime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, alku.hashCode);
    _$hash = $jc(_$hash, loppu.hashCode);
    _$hash = $jc(_$hash, treeniRutiiniData.hashCode);
    _$hash = $jc(_$hash, docCreatedTime.hashCode);
    _$hash = $jc(_$hash, photos.hashCode);
    _$hash = $jc(_$hash, isEditing.hashCode);
    _$hash = $jc(_$hash, lastModifiedTime.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TreeniSessiotRecord')
          ..add('userRef', userRef)
          ..add('alku', alku)
          ..add('loppu', loppu)
          ..add('treeniRutiiniData', treeniRutiiniData)
          ..add('docCreatedTime', docCreatedTime)
          ..add('photos', photos)
          ..add('isEditing', isEditing)
          ..add('lastModifiedTime', lastModifiedTime)
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

  TreeniRutiiniStructBuilder? _treeniRutiiniData;
  TreeniRutiiniStructBuilder get treeniRutiiniData =>
      _$this._treeniRutiiniData ??= new TreeniRutiiniStructBuilder();
  set treeniRutiiniData(TreeniRutiiniStructBuilder? treeniRutiiniData) =>
      _$this._treeniRutiiniData = treeniRutiiniData;

  DateTime? _docCreatedTime;
  DateTime? get docCreatedTime => _$this._docCreatedTime;
  set docCreatedTime(DateTime? docCreatedTime) =>
      _$this._docCreatedTime = docCreatedTime;

  ListBuilder<String>? _photos;
  ListBuilder<String> get photos =>
      _$this._photos ??= new ListBuilder<String>();
  set photos(ListBuilder<String>? photos) => _$this._photos = photos;

  bool? _isEditing;
  bool? get isEditing => _$this._isEditing;
  set isEditing(bool? isEditing) => _$this._isEditing = isEditing;

  DateTime? _lastModifiedTime;
  DateTime? get lastModifiedTime => _$this._lastModifiedTime;
  set lastModifiedTime(DateTime? lastModifiedTime) =>
      _$this._lastModifiedTime = lastModifiedTime;

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
      _treeniRutiiniData = $v.treeniRutiiniData.toBuilder();
      _docCreatedTime = $v.docCreatedTime;
      _photos = $v.photos?.toBuilder();
      _isEditing = $v.isEditing;
      _lastModifiedTime = $v.lastModifiedTime;
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
              treeniRutiiniData: treeniRutiiniData.build(),
              docCreatedTime: docCreatedTime,
              photos: _photos?.build(),
              isEditing: isEditing,
              lastModifiedTime: lastModifiedTime,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'treeniRutiiniData';
        treeniRutiiniData.build();

        _$failedField = 'photos';
        _photos?.build();
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
