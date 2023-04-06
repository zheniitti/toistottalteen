// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_stats_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkoutStatsStruct> _$workoutStatsStructSerializer =
    new _$WorkoutStatsStructSerializer();

class _$WorkoutStatsStructSerializer
    implements StructuredSerializer<WorkoutStatsStruct> {
  @override
  final Iterable<Type> types = const [WorkoutStatsStruct, _$WorkoutStatsStruct];
  @override
  final String wireName = 'WorkoutStatsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WorkoutStatsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.totalWorkoutDurationSeconds;
    if (value != null) {
      result
        ..add('totalWorkoutDuration_seconds')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.numbTotalWorkouts;
    if (value != null) {
      result
        ..add('numbTotalWorkouts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.avgWorkoutDurationSeconds;
    if (value != null) {
      result
        ..add('avgWorkoutDuration_seconds')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.avgWorkoutExercices;
    if (value != null) {
      result
        ..add('avgWorkoutExercices')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  WorkoutStatsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkoutStatsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'totalWorkoutDuration_seconds':
          result.totalWorkoutDurationSeconds = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'numbTotalWorkouts':
          result.numbTotalWorkouts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'avgWorkoutDuration_seconds':
          result.avgWorkoutDurationSeconds = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'avgWorkoutExercices':
          result.avgWorkoutExercices = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$WorkoutStatsStruct extends WorkoutStatsStruct {
  @override
  final double? totalWorkoutDurationSeconds;
  @override
  final int? numbTotalWorkouts;
  @override
  final double? avgWorkoutDurationSeconds;
  @override
  final int? avgWorkoutExercices;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$WorkoutStatsStruct(
          [void Function(WorkoutStatsStructBuilder)? updates]) =>
      (new WorkoutStatsStructBuilder()..update(updates))._build();

  _$WorkoutStatsStruct._(
      {this.totalWorkoutDurationSeconds,
      this.numbTotalWorkouts,
      this.avgWorkoutDurationSeconds,
      this.avgWorkoutExercices,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'WorkoutStatsStruct', 'firestoreUtilData');
  }

  @override
  WorkoutStatsStruct rebuild(
          void Function(WorkoutStatsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkoutStatsStructBuilder toBuilder() =>
      new WorkoutStatsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkoutStatsStruct &&
        totalWorkoutDurationSeconds == other.totalWorkoutDurationSeconds &&
        numbTotalWorkouts == other.numbTotalWorkouts &&
        avgWorkoutDurationSeconds == other.avgWorkoutDurationSeconds &&
        avgWorkoutExercices == other.avgWorkoutExercices &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalWorkoutDurationSeconds.hashCode);
    _$hash = $jc(_$hash, numbTotalWorkouts.hashCode);
    _$hash = $jc(_$hash, avgWorkoutDurationSeconds.hashCode);
    _$hash = $jc(_$hash, avgWorkoutExercices.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkoutStatsStruct')
          ..add('totalWorkoutDurationSeconds', totalWorkoutDurationSeconds)
          ..add('numbTotalWorkouts', numbTotalWorkouts)
          ..add('avgWorkoutDurationSeconds', avgWorkoutDurationSeconds)
          ..add('avgWorkoutExercices', avgWorkoutExercices)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class WorkoutStatsStructBuilder
    implements Builder<WorkoutStatsStruct, WorkoutStatsStructBuilder> {
  _$WorkoutStatsStruct? _$v;

  double? _totalWorkoutDurationSeconds;
  double? get totalWorkoutDurationSeconds =>
      _$this._totalWorkoutDurationSeconds;
  set totalWorkoutDurationSeconds(double? totalWorkoutDurationSeconds) =>
      _$this._totalWorkoutDurationSeconds = totalWorkoutDurationSeconds;

  int? _numbTotalWorkouts;
  int? get numbTotalWorkouts => _$this._numbTotalWorkouts;
  set numbTotalWorkouts(int? numbTotalWorkouts) =>
      _$this._numbTotalWorkouts = numbTotalWorkouts;

  double? _avgWorkoutDurationSeconds;
  double? get avgWorkoutDurationSeconds => _$this._avgWorkoutDurationSeconds;
  set avgWorkoutDurationSeconds(double? avgWorkoutDurationSeconds) =>
      _$this._avgWorkoutDurationSeconds = avgWorkoutDurationSeconds;

  int? _avgWorkoutExercices;
  int? get avgWorkoutExercices => _$this._avgWorkoutExercices;
  set avgWorkoutExercices(int? avgWorkoutExercices) =>
      _$this._avgWorkoutExercices = avgWorkoutExercices;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  WorkoutStatsStructBuilder() {
    WorkoutStatsStruct._initializeBuilder(this);
  }

  WorkoutStatsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalWorkoutDurationSeconds = $v.totalWorkoutDurationSeconds;
      _numbTotalWorkouts = $v.numbTotalWorkouts;
      _avgWorkoutDurationSeconds = $v.avgWorkoutDurationSeconds;
      _avgWorkoutExercices = $v.avgWorkoutExercices;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkoutStatsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkoutStatsStruct;
  }

  @override
  void update(void Function(WorkoutStatsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkoutStatsStruct build() => _build();

  _$WorkoutStatsStruct _build() {
    final _$result = _$v ??
        new _$WorkoutStatsStruct._(
            totalWorkoutDurationSeconds: totalWorkoutDurationSeconds,
            numbTotalWorkouts: numbTotalWorkouts,
            avgWorkoutDurationSeconds: avgWorkoutDurationSeconds,
            avgWorkoutExercices: avgWorkoutExercices,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'WorkoutStatsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
