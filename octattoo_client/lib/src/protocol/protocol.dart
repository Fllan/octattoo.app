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
import 'exceptions/artist_name_taken.dart' as _i2;
import 'features/tattoo_artist/tattoo_artist.dart' as _i3;
import 'features/octattoo_base_class.dart' as _i4;
import 'greetings/greeting.dart' as _i5;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i6;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i7;
export 'exceptions/artist_name_taken.dart';
export 'features/tattoo_artist/tattoo_artist.dart';
export 'features/octattoo_base_class.dart';
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

    if (t == _i2.ArtistNameTakenException) {
      return _i2.ArtistNameTakenException.fromJson(data) as T;
    }
    if (t == _i3.TattooArtist) {
      return _i3.TattooArtist.fromJson(data) as T;
    }
    if (t == _i4.OctattooBaseClass) {
      return _i4.OctattooBaseClass.fromJson(data) as T;
    }
    if (t == _i5.Greeting) {
      return _i5.Greeting.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ArtistNameTakenException?>()) {
      return (data != null ? _i2.ArtistNameTakenException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.TattooArtist?>()) {
      return (data != null ? _i3.TattooArtist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.OctattooBaseClass?>()) {
      return (data != null ? _i4.OctattooBaseClass.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Greeting?>()) {
      return (data != null ? _i5.Greeting.fromJson(data) : null) as T;
    }
    try {
      return _i6.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.ArtistNameTakenException => 'ArtistNameTakenException',
      _i3.TattooArtist => 'TattooArtist',
      _i4.OctattooBaseClass => 'OctattooBaseClass',
      _i5.Greeting => 'Greeting',
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
      case _i2.ArtistNameTakenException():
        return 'ArtistNameTakenException';
      case _i3.TattooArtist():
        return 'TattooArtist';
      case _i4.OctattooBaseClass():
        return 'OctattooBaseClass';
      case _i5.Greeting():
        return 'Greeting';
    }
    className = _i6.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i7.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'ArtistNameTakenException') {
      return deserialize<_i2.ArtistNameTakenException>(data['data']);
    }
    if (dataClassName == 'TattooArtist') {
      return deserialize<_i3.TattooArtist>(data['data']);
    }
    if (dataClassName == 'OctattooBaseClass') {
      return deserialize<_i4.OctattooBaseClass>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i5.Greeting>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i6.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i7.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
