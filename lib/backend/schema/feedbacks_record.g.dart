// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedbacks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeedbacksRecord> _$feedbacksRecordSerializer =
    new _$FeedbacksRecordSerializer();

class _$FeedbacksRecordSerializer
    implements StructuredSerializer<FeedbacksRecord> {
  @override
  final Iterable<Type> types = const [FeedbacksRecord, _$FeedbacksRecord];
  @override
  final String wireName = 'FeedbacksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FeedbacksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('createdTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrls;
    if (value != null) {
      result
        ..add('photoUrls')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.videoUrl;
    if (value != null) {
      result
        ..add('videoUrl')
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
  FeedbacksRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeedbacksRecordBuilder();

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
        case 'createdTime':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photoUrls':
          result.photoUrls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'videoUrl':
          result.videoUrl = serializers.deserialize(value,
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

class _$FeedbacksRecord extends FeedbacksRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? createdTime;
  @override
  final String? message;
  @override
  final BuiltList<String>? photoUrls;
  @override
  final String? videoUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FeedbacksRecord([void Function(FeedbacksRecordBuilder)? updates]) =>
      (new FeedbacksRecordBuilder()..update(updates))._build();

  _$FeedbacksRecord._(
      {this.userRef,
      this.createdTime,
      this.message,
      this.photoUrls,
      this.videoUrl,
      this.ffRef})
      : super._();

  @override
  FeedbacksRecord rebuild(void Function(FeedbacksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeedbacksRecordBuilder toBuilder() =>
      new FeedbacksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeedbacksRecord &&
        userRef == other.userRef &&
        createdTime == other.createdTime &&
        message == other.message &&
        photoUrls == other.photoUrls &&
        videoUrl == other.videoUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, photoUrls.hashCode);
    _$hash = $jc(_$hash, videoUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeedbacksRecord')
          ..add('userRef', userRef)
          ..add('createdTime', createdTime)
          ..add('message', message)
          ..add('photoUrls', photoUrls)
          ..add('videoUrl', videoUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FeedbacksRecordBuilder
    implements Builder<FeedbacksRecord, FeedbacksRecordBuilder> {
  _$FeedbacksRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<String>? _photoUrls;
  ListBuilder<String> get photoUrls =>
      _$this._photoUrls ??= new ListBuilder<String>();
  set photoUrls(ListBuilder<String>? photoUrls) =>
      _$this._photoUrls = photoUrls;

  String? _videoUrl;
  String? get videoUrl => _$this._videoUrl;
  set videoUrl(String? videoUrl) => _$this._videoUrl = videoUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FeedbacksRecordBuilder() {
    FeedbacksRecord._initializeBuilder(this);
  }

  FeedbacksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _createdTime = $v.createdTime;
      _message = $v.message;
      _photoUrls = $v.photoUrls?.toBuilder();
      _videoUrl = $v.videoUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeedbacksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeedbacksRecord;
  }

  @override
  void update(void Function(FeedbacksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FeedbacksRecord build() => _build();

  _$FeedbacksRecord _build() {
    _$FeedbacksRecord _$result;
    try {
      _$result = _$v ??
          new _$FeedbacksRecord._(
              userRef: userRef,
              createdTime: createdTime,
              message: message,
              photoUrls: _photoUrls?.build(),
              videoUrl: videoUrl,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photoUrls';
        _photoUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FeedbacksRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
