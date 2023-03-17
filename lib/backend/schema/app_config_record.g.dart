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
    value = object.daysAfterShowAds;
    if (value != null) {
      result
        ..add('daysAfterShowAds')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.showBannerAdAndroid;
    if (value != null) {
      result
        ..add('showBannerAd_android')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showBannerAdIOS;
    if (value != null) {
      result
        ..add('showBannerAd_IOS')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showBannerAdWeb;
    if (value != null) {
      result
        ..add('showBannerAd_web')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showInterstitialAdAndroid;
    if (value != null) {
      result
        ..add('showInterstitialAd_android')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showInterstitialAdIos;
    if (value != null) {
      result
        ..add('showInterstitialAd_ios')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showInterstitialAdWeb;
    if (value != null) {
      result
        ..add('showInterstitialAd_web')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showAdsOnAllPlatforms;
    if (value != null) {
      result
        ..add('showAdsOnAllPlatforms')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.developersRefsList;
    if (value != null) {
      result
        ..add('developersRefsList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
        case 'daysAfterShowAds':
          result.daysAfterShowAds = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'showBannerAd_android':
          result.showBannerAdAndroid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showBannerAd_IOS':
          result.showBannerAdIOS = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showBannerAd_web':
          result.showBannerAdWeb = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showInterstitialAd_android':
          result.showInterstitialAdAndroid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showInterstitialAd_ios':
          result.showInterstitialAdIos = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showInterstitialAd_web':
          result.showInterstitialAdWeb = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'showAdsOnAllPlatforms':
          result.showAdsOnAllPlatforms = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'developersRefsList':
          result.developersRefsList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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
  final int? daysAfterShowAds;
  @override
  final bool? showBannerAdAndroid;
  @override
  final bool? showBannerAdIOS;
  @override
  final bool? showBannerAdWeb;
  @override
  final bool? showInterstitialAdAndroid;
  @override
  final bool? showInterstitialAdIos;
  @override
  final bool? showInterstitialAdWeb;
  @override
  final bool? showAdsOnAllPlatforms;
  @override
  final BuiltList<DocumentReference<Object?>>? developersRefsList;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppConfigRecord([void Function(AppConfigRecordBuilder)? updates]) =>
      (new AppConfigRecordBuilder()..update(updates))._build();

  _$AppConfigRecord._(
      {this.daysAfterShowAds,
      this.showBannerAdAndroid,
      this.showBannerAdIOS,
      this.showBannerAdWeb,
      this.showInterstitialAdAndroid,
      this.showInterstitialAdIos,
      this.showInterstitialAdWeb,
      this.showAdsOnAllPlatforms,
      this.developersRefsList,
      this.ffRef})
      : super._();

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
        daysAfterShowAds == other.daysAfterShowAds &&
        showBannerAdAndroid == other.showBannerAdAndroid &&
        showBannerAdIOS == other.showBannerAdIOS &&
        showBannerAdWeb == other.showBannerAdWeb &&
        showInterstitialAdAndroid == other.showInterstitialAdAndroid &&
        showInterstitialAdIos == other.showInterstitialAdIos &&
        showInterstitialAdWeb == other.showInterstitialAdWeb &&
        showAdsOnAllPlatforms == other.showAdsOnAllPlatforms &&
        developersRefsList == other.developersRefsList &&
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
                                $jc(
                                    $jc($jc(0, daysAfterShowAds.hashCode),
                                        showBannerAdAndroid.hashCode),
                                    showBannerAdIOS.hashCode),
                                showBannerAdWeb.hashCode),
                            showInterstitialAdAndroid.hashCode),
                        showInterstitialAdIos.hashCode),
                    showInterstitialAdWeb.hashCode),
                showAdsOnAllPlatforms.hashCode),
            developersRefsList.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppConfigRecord')
          ..add('daysAfterShowAds', daysAfterShowAds)
          ..add('showBannerAdAndroid', showBannerAdAndroid)
          ..add('showBannerAdIOS', showBannerAdIOS)
          ..add('showBannerAdWeb', showBannerAdWeb)
          ..add('showInterstitialAdAndroid', showInterstitialAdAndroid)
          ..add('showInterstitialAdIos', showInterstitialAdIos)
          ..add('showInterstitialAdWeb', showInterstitialAdWeb)
          ..add('showAdsOnAllPlatforms', showAdsOnAllPlatforms)
          ..add('developersRefsList', developersRefsList)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppConfigRecordBuilder
    implements Builder<AppConfigRecord, AppConfigRecordBuilder> {
  _$AppConfigRecord? _$v;

  int? _daysAfterShowAds;
  int? get daysAfterShowAds => _$this._daysAfterShowAds;
  set daysAfterShowAds(int? daysAfterShowAds) =>
      _$this._daysAfterShowAds = daysAfterShowAds;

  bool? _showBannerAdAndroid;
  bool? get showBannerAdAndroid => _$this._showBannerAdAndroid;
  set showBannerAdAndroid(bool? showBannerAdAndroid) =>
      _$this._showBannerAdAndroid = showBannerAdAndroid;

  bool? _showBannerAdIOS;
  bool? get showBannerAdIOS => _$this._showBannerAdIOS;
  set showBannerAdIOS(bool? showBannerAdIOS) =>
      _$this._showBannerAdIOS = showBannerAdIOS;

  bool? _showBannerAdWeb;
  bool? get showBannerAdWeb => _$this._showBannerAdWeb;
  set showBannerAdWeb(bool? showBannerAdWeb) =>
      _$this._showBannerAdWeb = showBannerAdWeb;

  bool? _showInterstitialAdAndroid;
  bool? get showInterstitialAdAndroid => _$this._showInterstitialAdAndroid;
  set showInterstitialAdAndroid(bool? showInterstitialAdAndroid) =>
      _$this._showInterstitialAdAndroid = showInterstitialAdAndroid;

  bool? _showInterstitialAdIos;
  bool? get showInterstitialAdIos => _$this._showInterstitialAdIos;
  set showInterstitialAdIos(bool? showInterstitialAdIos) =>
      _$this._showInterstitialAdIos = showInterstitialAdIos;

  bool? _showInterstitialAdWeb;
  bool? get showInterstitialAdWeb => _$this._showInterstitialAdWeb;
  set showInterstitialAdWeb(bool? showInterstitialAdWeb) =>
      _$this._showInterstitialAdWeb = showInterstitialAdWeb;

  bool? _showAdsOnAllPlatforms;
  bool? get showAdsOnAllPlatforms => _$this._showAdsOnAllPlatforms;
  set showAdsOnAllPlatforms(bool? showAdsOnAllPlatforms) =>
      _$this._showAdsOnAllPlatforms = showAdsOnAllPlatforms;

  ListBuilder<DocumentReference<Object?>>? _developersRefsList;
  ListBuilder<DocumentReference<Object?>> get developersRefsList =>
      _$this._developersRefsList ??=
          new ListBuilder<DocumentReference<Object?>>();
  set developersRefsList(
          ListBuilder<DocumentReference<Object?>>? developersRefsList) =>
      _$this._developersRefsList = developersRefsList;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppConfigRecordBuilder() {
    AppConfigRecord._initializeBuilder(this);
  }

  AppConfigRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _daysAfterShowAds = $v.daysAfterShowAds;
      _showBannerAdAndroid = $v.showBannerAdAndroid;
      _showBannerAdIOS = $v.showBannerAdIOS;
      _showBannerAdWeb = $v.showBannerAdWeb;
      _showInterstitialAdAndroid = $v.showInterstitialAdAndroid;
      _showInterstitialAdIos = $v.showInterstitialAdIos;
      _showInterstitialAdWeb = $v.showInterstitialAdWeb;
      _showAdsOnAllPlatforms = $v.showAdsOnAllPlatforms;
      _developersRefsList = $v.developersRefsList?.toBuilder();
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
    _$AppConfigRecord _$result;
    try {
      _$result = _$v ??
          new _$AppConfigRecord._(
              daysAfterShowAds: daysAfterShowAds,
              showBannerAdAndroid: showBannerAdAndroid,
              showBannerAdIOS: showBannerAdIOS,
              showBannerAdWeb: showBannerAdWeb,
              showInterstitialAdAndroid: showInterstitialAdAndroid,
              showInterstitialAdIos: showInterstitialAdIos,
              showInterstitialAdWeb: showInterstitialAdWeb,
              showAdsOnAllPlatforms: showAdsOnAllPlatforms,
              developersRefsList: _developersRefsList?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'developersRefsList';
        _developersRefsList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppConfigRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
