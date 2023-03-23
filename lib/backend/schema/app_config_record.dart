import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_config_record.g.dart';

abstract class AppConfigRecord
    implements Built<AppConfigRecord, AppConfigRecordBuilder> {
  static Serializer<AppConfigRecord> get serializer =>
      _$appConfigRecordSerializer;

  int? get daysAfterShowAds;

  @BuiltValueField(wireName: 'showBannerAd_android')
  bool? get showBannerAdAndroid;

  @BuiltValueField(wireName: 'showBannerAd_IOS')
  bool? get showBannerAdIOS;

  @BuiltValueField(wireName: 'showBannerAd_web')
  bool? get showBannerAdWeb;

  @BuiltValueField(wireName: 'showInterstitialAd_android')
  bool? get showInterstitialAdAndroid;

  @BuiltValueField(wireName: 'showInterstitialAd_ios')
  bool? get showInterstitialAdIos;

  @BuiltValueField(wireName: 'showInterstitialAd_web')
  bool? get showInterstitialAdWeb;

  bool? get showAdsOnAllPlatforms;

  DocumentReference? get developersList;

  String? get privacyPolicyUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppConfigRecordBuilder builder) => builder
    ..daysAfterShowAds = 0
    ..showBannerAdAndroid = false
    ..showBannerAdIOS = false
    ..showBannerAdWeb = false
    ..showInterstitialAdAndroid = false
    ..showInterstitialAdIos = false
    ..showInterstitialAdWeb = false
    ..showAdsOnAllPlatforms = false
    ..privacyPolicyUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appConfig');

  static Stream<AppConfigRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppConfigRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppConfigRecord._();
  factory AppConfigRecord([void Function(AppConfigRecordBuilder) updates]) =
      _$AppConfigRecord;

  static AppConfigRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppConfigRecordData({
  int? daysAfterShowAds,
  bool? showBannerAdAndroid,
  bool? showBannerAdIOS,
  bool? showBannerAdWeb,
  bool? showInterstitialAdAndroid,
  bool? showInterstitialAdIos,
  bool? showInterstitialAdWeb,
  bool? showAdsOnAllPlatforms,
  DocumentReference? developersList,
  String? privacyPolicyUrl,
}) {
  final firestoreData = serializers.toFirestore(
    AppConfigRecord.serializer,
    AppConfigRecord(
      (a) => a
        ..daysAfterShowAds = daysAfterShowAds
        ..showBannerAdAndroid = showBannerAdAndroid
        ..showBannerAdIOS = showBannerAdIOS
        ..showBannerAdWeb = showBannerAdWeb
        ..showInterstitialAdAndroid = showInterstitialAdAndroid
        ..showInterstitialAdIos = showInterstitialAdIos
        ..showInterstitialAdWeb = showInterstitialAdWeb
        ..showAdsOnAllPlatforms = showAdsOnAllPlatforms
        ..developersList = developersList
        ..privacyPolicyUrl = privacyPolicyUrl,
    ),
  );

  return firestoreData;
}
