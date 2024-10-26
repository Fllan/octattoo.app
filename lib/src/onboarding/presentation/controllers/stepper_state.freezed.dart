// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stepper_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StepperState {
  int get currentStep => throw _privateConstructorUsedError;
  bool get isValidStep1 => throw _privateConstructorUsedError;
  bool get isValidStep2 => throw _privateConstructorUsedError;

  /// Create a copy of StepperState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepperStateCopyWith<StepperState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepperStateCopyWith<$Res> {
  factory $StepperStateCopyWith(
          StepperState value, $Res Function(StepperState) then) =
      _$StepperStateCopyWithImpl<$Res, StepperState>;
  @useResult
  $Res call({int currentStep, bool isValidStep1, bool isValidStep2});
}

/// @nodoc
class _$StepperStateCopyWithImpl<$Res, $Val extends StepperState>
    implements $StepperStateCopyWith<$Res> {
  _$StepperStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepperState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? isValidStep1 = null,
    Object? isValidStep2 = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      isValidStep1: null == isValidStep1
          ? _value.isValidStep1
          : isValidStep1 // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidStep2: null == isValidStep2
          ? _value.isValidStep2
          : isValidStep2 // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepperStateImplCopyWith<$Res>
    implements $StepperStateCopyWith<$Res> {
  factory _$$StepperStateImplCopyWith(
          _$StepperStateImpl value, $Res Function(_$StepperStateImpl) then) =
      __$$StepperStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentStep, bool isValidStep1, bool isValidStep2});
}

/// @nodoc
class __$$StepperStateImplCopyWithImpl<$Res>
    extends _$StepperStateCopyWithImpl<$Res, _$StepperStateImpl>
    implements _$$StepperStateImplCopyWith<$Res> {
  __$$StepperStateImplCopyWithImpl(
      _$StepperStateImpl _value, $Res Function(_$StepperStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StepperState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? isValidStep1 = null,
    Object? isValidStep2 = null,
  }) {
    return _then(_$StepperStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      isValidStep1: null == isValidStep1
          ? _value.isValidStep1
          : isValidStep1 // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidStep2: null == isValidStep2
          ? _value.isValidStep2
          : isValidStep2 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StepperStateImpl extends _StepperState {
  _$StepperStateImpl(
      {this.currentStep = 0,
      this.isValidStep1 = false,
      this.isValidStep2 = false})
      : super._();

  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final bool isValidStep1;
  @override
  @JsonKey()
  final bool isValidStep2;

  @override
  String toString() {
    return 'StepperState(currentStep: $currentStep, isValidStep1: $isValidStep1, isValidStep2: $isValidStep2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepperStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.isValidStep1, isValidStep1) ||
                other.isValidStep1 == isValidStep1) &&
            (identical(other.isValidStep2, isValidStep2) ||
                other.isValidStep2 == isValidStep2));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentStep, isValidStep1, isValidStep2);

  /// Create a copy of StepperState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepperStateImplCopyWith<_$StepperStateImpl> get copyWith =>
      __$$StepperStateImplCopyWithImpl<_$StepperStateImpl>(this, _$identity);
}

abstract class _StepperState extends StepperState {
  factory _StepperState(
      {final int currentStep,
      final bool isValidStep1,
      final bool isValidStep2}) = _$StepperStateImpl;
  _StepperState._() : super._();

  @override
  int get currentStep;
  @override
  bool get isValidStep1;
  @override
  bool get isValidStep2;

  /// Create a copy of StepperState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepperStateImplCopyWith<_$StepperStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
