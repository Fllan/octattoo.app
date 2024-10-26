// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_2_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Step2State {
  WorkplaceTypes? get workplaceType => throw _privateConstructorUsedError;

  /// Create a copy of Step2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Step2StateCopyWith<Step2State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Step2StateCopyWith<$Res> {
  factory $Step2StateCopyWith(
          Step2State value, $Res Function(Step2State) then) =
      _$Step2StateCopyWithImpl<$Res, Step2State>;
  @useResult
  $Res call({WorkplaceTypes? workplaceType});
}

/// @nodoc
class _$Step2StateCopyWithImpl<$Res, $Val extends Step2State>
    implements $Step2StateCopyWith<$Res> {
  _$Step2StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Step2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workplaceType = freezed,
  }) {
    return _then(_value.copyWith(
      workplaceType: freezed == workplaceType
          ? _value.workplaceType
          : workplaceType // ignore: cast_nullable_to_non_nullable
              as WorkplaceTypes?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Step2StateImplCopyWith<$Res>
    implements $Step2StateCopyWith<$Res> {
  factory _$$Step2StateImplCopyWith(
          _$Step2StateImpl value, $Res Function(_$Step2StateImpl) then) =
      __$$Step2StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkplaceTypes? workplaceType});
}

/// @nodoc
class __$$Step2StateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2StateImpl>
    implements _$$Step2StateImplCopyWith<$Res> {
  __$$Step2StateImplCopyWithImpl(
      _$Step2StateImpl _value, $Res Function(_$Step2StateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Step2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workplaceType = freezed,
  }) {
    return _then(_$Step2StateImpl(
      workplaceType: freezed == workplaceType
          ? _value.workplaceType
          : workplaceType // ignore: cast_nullable_to_non_nullable
              as WorkplaceTypes?,
    ));
  }
}

/// @nodoc

class _$Step2StateImpl extends _Step2State {
  _$Step2StateImpl({this.workplaceType = null}) : super._();

  @override
  @JsonKey()
  final WorkplaceTypes? workplaceType;

  @override
  String toString() {
    return 'Step2State(workplaceType: $workplaceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step2StateImpl &&
            (identical(other.workplaceType, workplaceType) ||
                other.workplaceType == workplaceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workplaceType);

  /// Create a copy of Step2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Step2StateImplCopyWith<_$Step2StateImpl> get copyWith =>
      __$$Step2StateImplCopyWithImpl<_$Step2StateImpl>(this, _$identity);
}

abstract class _Step2State extends Step2State {
  factory _Step2State({final WorkplaceTypes? workplaceType}) = _$Step2StateImpl;
  _Step2State._() : super._();

  @override
  WorkplaceTypes? get workplaceType;

  /// Create a copy of Step2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Step2StateImplCopyWith<_$Step2StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
