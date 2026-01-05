/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'features/availability/availability.dart' as _i2;
import 'features/availability/availability_type.dart' as _i3;
import 'features/availability/recurring_pattern.dart' as _i4;
import 'features/availability/recurring_type.dart' as _i5;
import 'features/tattoo_artist/tattoo_artist.dart' as _i6;
import 'features/user/user.dart' as _i7;
import 'features/workplace/workplace.dart' as _i8;
import 'features/base_class.dart' as _i9;
import 'features/tattoo_artist/exceptions/artist_name_taken.dart' as _i10;
import 'greetings/greeting.dart' as _i11;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i12;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i13;
export 'features/availability/availability.dart';
export 'features/availability/availability_type.dart';
export 'features/availability/recurring_pattern.dart';
export 'features/availability/recurring_type.dart';
export 'features/tattoo_artist/tattoo_artist.dart';
export 'features/user/user.dart';
export 'features/workplace/workplace.dart';
export 'features/base_class.dart';
export 'features/tattoo_artist/exceptions/artist_name_taken.dart';
export 'greetings/greeting.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Availability) {
      return _i2.Availability.fromJson(data) as T;
    }
    if (t == _i3.AvailabilityType) {
      return _i3.AvailabilityType.fromJson(data) as T;
    }
    if (t == _i4.RecurringPattern) {
      return _i4.RecurringPattern.fromJson(data) as T;
    }
    if (t == _i5.RecurringType) {
      return _i5.RecurringType.fromJson(data) as T;
    }
    if (t == _i6.TattooArtist) {
      return _i6.TattooArtist.fromJson(data) as T;
    }
    if (t == _i7.User) {
      return _i7.User.fromJson(data) as T;
    }
    if (t == _i8.Workplace) {
      return _i8.Workplace.fromJson(data) as T;
    }
    if (t == _i9.BaseClass) {
      return _i9.BaseClass.fromJson(data) as T;
    }
    if (t == _i10.ArtistNameTakenException) {
      return _i10.ArtistNameTakenException.fromJson(data) as T;
    }
    if (t == _i11.Greeting) {
      return _i11.Greeting.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Availability?>()) {
      return (data != null ? _i2.Availability.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AvailabilityType?>()) {
      return (data != null ? _i3.AvailabilityType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.RecurringPattern?>()) {
      return (data != null ? _i4.RecurringPattern.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.RecurringType?>()) {
      return (data != null ? _i5.RecurringType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.TattooArtist?>()) {
      return (data != null ? _i6.TattooArtist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.User?>()) {
      return (data != null ? _i7.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Workplace?>()) {
      return (data != null ? _i8.Workplace.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.BaseClass?>()) {
      return (data != null ? _i9.BaseClass.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ArtistNameTakenException?>()) {
      return (data != null
              ? _i10.ArtistNameTakenException.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i11.Greeting?>()) {
      return (data != null ? _i11.Greeting.fromJson(data) : null) as T;
    }
    if (t == List<_i4.RecurringPattern>) {
      return (data as List)
              .map((e) => deserialize<_i4.RecurringPattern>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.RecurringPattern>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i4.RecurringPattern>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i2.Availability>) {
      return (data as List)
              .map((e) => deserialize<_i2.Availability>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i2.Availability>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i2.Availability>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i6.TattooArtist>) {
      return (data as List)
              .map((e) => deserialize<_i6.TattooArtist>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.TattooArtist>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.TattooArtist>(e))
                    .toList()
              : null)
          as T;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Availability => 'Availability',
      _i3.AvailabilityType => 'AvailabilityType',
      _i4.RecurringPattern => 'RecurringPattern',
      _i5.RecurringType => 'RecurringType',
      _i6.TattooArtist => 'TattooArtist',
      _i7.User => 'User',
      _i8.Workplace => 'Workplace',
      _i9.BaseClass => 'BaseClass',
      _i10.ArtistNameTakenException => 'ArtistNameTakenException',
      _i11.Greeting => 'Greeting',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('octattoo.', '');
    }

    switch (data) {
      case _i2.Availability():
        return 'Availability';
      case _i3.AvailabilityType():
        return 'AvailabilityType';
      case _i4.RecurringPattern():
        return 'RecurringPattern';
      case _i5.RecurringType():
        return 'RecurringType';
      case _i6.TattooArtist():
        return 'TattooArtist';
      case _i7.User():
        return 'User';
      case _i8.Workplace():
        return 'Workplace';
      case _i9.BaseClass():
        return 'BaseClass';
      case _i10.ArtistNameTakenException():
        return 'ArtistNameTakenException';
      case _i11.Greeting():
        return 'Greeting';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Availability') {
      return deserialize<_i2.Availability>(data['data']);
    }
    if (dataClassName == 'AvailabilityType') {
      return deserialize<_i3.AvailabilityType>(data['data']);
    }
    if (dataClassName == 'RecurringPattern') {
      return deserialize<_i4.RecurringPattern>(data['data']);
    }
    if (dataClassName == 'RecurringType') {
      return deserialize<_i5.RecurringType>(data['data']);
    }
    if (dataClassName == 'TattooArtist') {
      return deserialize<_i6.TattooArtist>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i7.User>(data['data']);
    }
    if (dataClassName == 'Workplace') {
      return deserialize<_i8.Workplace>(data['data']);
    }
    if (dataClassName == 'BaseClass') {
      return deserialize<_i9.BaseClass>(data['data']);
    }
    if (dataClassName == 'ArtistNameTakenException') {
      return deserialize<_i10.ArtistNameTakenException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i11.Greeting>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i12.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
