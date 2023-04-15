import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'workout_stats_struct.g.dart';

abstract class WorkoutStatsStruct
    implements Built<WorkoutStatsStruct, WorkoutStatsStructBuilder> {
  static Serializer<WorkoutStatsStruct> get serializer =>
      _$workoutStatsStructSerializer;

  @BuiltValueField(wireName: 'totalWorkoutDuration_seconds')
  double? get totalWorkoutDurationSeconds;

  int? get numbTotalWorkouts;

  @BuiltValueField(wireName: 'avgWorkoutDuration_seconds')
  double? get avgWorkoutDurationSeconds;

  int? get avgWorkoutExercices;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(WorkoutStatsStructBuilder builder) => builder
    ..totalWorkoutDurationSeconds = 0.0
    ..numbTotalWorkouts = 0
    ..avgWorkoutDurationSeconds = 0.0
    ..avgWorkoutExercices = 0
    ..firestoreUtilData = FirestoreUtilData();

  WorkoutStatsStruct._();
  factory WorkoutStatsStruct(
          [void Function(WorkoutStatsStructBuilder) updates]) =
      _$WorkoutStatsStruct;
}

WorkoutStatsStruct createWorkoutStatsStruct({
  double? totalWorkoutDurationSeconds,
  int? numbTotalWorkouts,
  double? avgWorkoutDurationSeconds,
  int? avgWorkoutExercices,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutStatsStruct(
      (w) => w
        ..totalWorkoutDurationSeconds = totalWorkoutDurationSeconds
        ..numbTotalWorkouts = numbTotalWorkouts
        ..avgWorkoutDurationSeconds = avgWorkoutDurationSeconds
        ..avgWorkoutExercices = avgWorkoutExercices
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

WorkoutStatsStruct? updateWorkoutStatsStruct(
  WorkoutStatsStruct? workoutStats, {
  bool clearUnsetFields = true,
}) =>
    workoutStats != null
        ? (workoutStats.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addWorkoutStatsStructData(
  Map<String, dynamic> firestoreData,
  WorkoutStatsStruct? workoutStats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workoutStats == null) {
    return;
  }
  if (workoutStats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && workoutStats.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutStatsData =
      getWorkoutStatsFirestoreData(workoutStats, forFieldValue);
  final nestedData =
      workoutStatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = workoutStats.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getWorkoutStatsFirestoreData(
  WorkoutStatsStruct? workoutStats, [
  bool forFieldValue = false,
]) {
  if (workoutStats == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(WorkoutStatsStruct.serializer, workoutStats);

  // Add any Firestore field values
  workoutStats.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutStatsListFirestoreData(
  List<WorkoutStatsStruct>? workoutStatss,
) =>
    workoutStatss?.map((w) => getWorkoutStatsFirestoreData(w, true)).toList() ??
    [];
