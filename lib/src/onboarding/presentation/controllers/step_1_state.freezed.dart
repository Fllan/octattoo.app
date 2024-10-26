// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_1_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Step1State {
  bool get realNameIsVisible => throw _privateConstructorUsedError;
  bool get pronounIsVisible => throw _privateConstructorUsedError;

  /// Create a copy of Step1State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Step1StateCopyWith<Step1State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Step1StateCopyWith<$Res> {
  factory $Step1StateCopyWith(
          Step1State value, $Res Function(Step1State) then) =
      _$Step1StateCopyWithImpl<$Res, Step1State>;
  @useResult
  $Res call({bool realNameIsVisible, bool pronounIsVisible});
}

/// @nodoc
class _$Step1StateCopyWithImpl<$Res, $Val extends Step1State>
    implements $Step1StateCopyWith<$Res> {
  _$Step1StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Step1State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? realNameIsVisible = null,
    Object? pronounIsVisible = null,
  }) {
    return _then(_value.copyWith(
      realNameIsVisible: null == realNameIsVisible
          ? _value.realNameIsVisible
          : realNameIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      pronounIsVisible: null == pronounIsVisible
          ? _value.pronounIsVisible
          : pronounIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Step1StateImplCopyWith<$Res>
    implements $Step1StateCopyWith<$Res> {
  factory _$$Step1StateImplCopyWith(
          _$Step1StateImpl value, $Res Function(_$Step1StateImpl) then) =
      __$$Step1StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool realNameIsVisible, bool pronounIsVisible});
}

/// @nodoc
class __$$Step1StateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1StateImpl>
    implements _$$Step1StateImplCopyWith<$Res> {
  __$$Step1StateImplCopyWithImpl(
      _$Step1StateImpl _value, $Res Function(_$Step1StateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Step1State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? realNameIsVisible = null,
    Object? pronounIsVisible = null,
  }) {
    return _then(_$Step1StateImpl(
      realNameIsVisible: null == realNameIsVisible
          ? _value.realNameIsVisible
          : realNameIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      pronounIsVisible: null == pronounIsVisible
          ? _value.pronounIsVisible
          : pronounIsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Step1StateImpl extends _Step1State {
  _$Step1StateImpl(
      {this.realNameIsVisible = false, this.pronounIsVisible = false})
      : super._();

  @override
  @JsonKey()
  final bool realNameIsVisible;
  @override
  @JsonKey()
  final bool pronounIsVisible;

  @override
  String toString() {
    return 'Step1State(realNameIsVisible: $realNameIsVisible, pronounIsVisible: $pronounIsVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step1StateImpl &&
            (identical(other.realNameIsVisible, realNameIsVisible) ||
                other.realNameIsVisible == realNameIsVisible) &&
            (identical(other.pronounIsVisible, pronounIsVisible) ||
                other.pronounIsVisible == pronounIsVisible));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, realNameIsVisible, pronounIsVisible);

  /// Create a copy of Step1State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Step1StateImplCopyWith<_$Step1StateImpl> get copyWith =>
      __$$Step1StateImplCopyWithImpl<_$Step1StateImpl>(this, _$identity);
}

abstract class _Step1State extends Step1State {
  factory _Step1State(
      {final bool realNameIsVisible,
      final bool pronounIsVisible}) = _$Step1StateImpl;
  _Step1State._() : super._();

  @override
  bool get realNameIsVisible;
  @override
  bool get pronounIsVisible;

  /// Create a copy of Step1State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Step1StateImplCopyWith<_$Step1StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
