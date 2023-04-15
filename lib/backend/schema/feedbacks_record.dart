import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'feedbacks_record.g.dart';

abstract class FeedbacksRecord
    implements Built<FeedbacksRecord, FeedbacksRecordBuilder> {
  static Serializer<FeedbacksRecord> get serializer =>
      _$feedbacksRecordSerializer;

  DocumentReference? get userRef;

  DateTime? get createdTime;

  String? get message;

  BuiltList<String>? get photoUrls;

  String? get videoUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FeedbacksRecordBuilder builder) => builder
    ..message = ''
    ..photoUrls = ListBuilder()
    ..videoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedbacks');

  static Stream<FeedbacksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FeedbacksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FeedbacksRecord._();
  factory FeedbacksRecord([void Function(FeedbacksRecordBuilder) updates]) =
      _$FeedbacksRecord;

  static FeedbacksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFeedbacksRecordData({
  DocumentReference? userRef,
  DateTime? createdTime,
  String? message,
  String? videoUrl,
}) {
  final firestoreData = serializers.toFirestore(
    FeedbacksRecord.serializer,
    FeedbacksRecord(
      (f) => f
        ..userRef = userRef
        ..createdTime = createdTime
        ..message = message
        ..photoUrls = null
        ..videoUrl = videoUrl,
    ),
  );

  return firestoreData;
}
