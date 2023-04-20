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
    value = object.developersList;
    if (value != null) {
      result
        ..add('developersList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.privacyPolicyUrl;
    if (value != null) {
      result
        ..add('privacyPolicyUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.navbarWorkoutbuttonLottieAnimationUrl;
    if (value != null) {
      result
        ..add('navbar_workoutbutton_lottieAnimationUrl')
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
        case 'developersList':
          result.developersList = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'privacyPolicyUrl':
          result.privacyPolicyUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'navbar_workoutbutton_lottieAnimationUrl':
          result.navbarWorkoutbuttonLottieAnimationUrl = serializers
                  .deserialize(value, specifiedType: const FullType(String))
              as String?;
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
  final DocumentReference<Object?>? developersList;
  @override
  final String? privacyPolicyUrl;
  @override
  final String? navbarWorkoutbuttonLottieAnimationUrl;
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
      this.developersList,
      this.privacyPolicyUrl,
      this.navbarWorkoutbuttonLottieAnimationUrl,
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
        developersList == other.developersList &&
        privacyPolicyUrl == other.privacyPolicyUrl &&
        navbarWorkoutbuttonLottieAnimationUrl ==
            other.navbarWorkoutbuttonLottieAnimationUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, daysAfterShowAds.hashCode);
    _$hash = $jc(_$hash, showBannerAdAndroid.hashCode);
    _$hash = $jc(_$hash, showBannerAdIOS.hashCode);
    _$hash = $jc(_$hash, showBannerAdWeb.hashCode);
    _$hash = $jc(_$hash, showInterstitialAdAndroid.hashCode);
    _$hash = $jc(_$hash, showInterstitialAdIos.hashCode);
    _$hash = $jc(_$hash, showInterstitialAdWeb.hashCode);
    _$hash = $jc(_$hash, showAdsOnAllPlatforms.hashCode);
    _$hash = $jc(_$hash, developersList.hashCode);
    _$hash = $jc(_$hash, privacyPolicyUrl.hashCode);
    _$hash = $jc(_$hash, navbarWorkoutbuttonLottieAnimationUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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
          ..add('developersList', developersList)
          ..add('privacyPolicyUrl', privacyPolicyUrl)
          ..add('navbarWorkoutbuttonLottieAnimationUrl',
              navbarWorkoutbuttonLottieAnimationUrl)
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

  DocumentReference<Object?>? _developersList;
  DocumentReference<Object?>? get developersList => _$this._developersList;
  set developersList(DocumentReference<Object?>? developersList) =>
      _$this._developersList = developersList;

  String? _privacyPolicyUrl;
  String? get privacyPolicyUrl => _$this._privacyPolicyUrl;
  set privacyPolicyUrl(String? privacyPolicyUrl) =>
      _$this._privacyPolicyUrl = privacyPolicyUrl;

  String? _navbarWorkoutbuttonLottieAnimationUrl;
  String? get navbarWorkoutbuttonLottieAnimationUrl =>
      _$this._navbarWorkoutbuttonLottieAnimationUrl;
  set navbarWorkoutbuttonLottieAnimationUrl(
          String? navbarWorkoutbuttonLottieAnimationUrl) =>
      _$this._navbarWorkoutbuttonLottieAnimationUrl =
          navbarWorkoutbuttonLottieAnimationUrl;

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
      _developersList = $v.developersList;
      _privacyPolicyUrl = $v.privacyPolicyUrl;
      _navbarWorkoutbuttonLottieAnimationUrl =
          $v.navbarWorkoutbuttonLottieAnimationUrl;
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
            daysAfterShowAds: daysAfterShowAds,
            showBannerAdAndroid: showBannerAdAndroid,
            showBannerAdIOS: showBannerAdIOS,
            showBannerAdWeb: showBannerAdWeb,
            showInterstitialAdAndroid: showInterstitialAdAndroid,
            showInterstitialAdIos: showInterstitialAdIos,
            showInterstitialAdWeb: showInterstitialAdWeb,
            showAdsOnAllPlatforms: showAdsOnAllPlatforms,
            developersList: developersList,
            privacyPolicyUrl: privacyPolicyUrl,
            navbarWorkoutbuttonLottieAnimationUrl:
                navbarWorkoutbuttonLottieAnimationUrl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
